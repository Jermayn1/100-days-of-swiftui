#!/usr/bin/env python3
"""Hält die README automatisch auf dem aktuellen Stand.

Ein Tag gilt als erledigt, sobald es in `Days/` einen Ordner gibt, dessen Name
mit „Day“ und der Tagesnummer beginnt und der mindestens eine Datei enthält –
z. B. `Days/Day 005 – If, switch, and the ternary operator/`.

Läuft automatisch als GitHub Action nach jedem Push. Lokal (optional):
  python3 .github/progress/update_progress.py

Nur Python-Standardbibliothek, keine Installation nötig.
"""
from __future__ import annotations

import json
import os
import re
import subprocess
import sys
from dataclasses import dataclass, field
from datetime import date
from pathlib import Path
from urllib.parse import quote

ROOT = Path(__file__).resolve().parents[2]
DAYS_DIR = "Days"
README = "README.md"
ASSETS = ".github/assets"
CURRICULUM = Path(__file__).with_name("curriculum.json")

DAY_PATTERN = re.compile(r"^(?:day|tag)[\s_-]*0*(\d{1,3})(?!\d)", re.IGNORECASE)
IGNORED_FILES = {".gitkeep", ".keep", ".DS_Store", "Thumbs.db"}

ICON = {"milestone": "🏆", "challenge": "🎯", "exam": "🎓"}


# --------------------------------------------------------------------------- Daten


@dataclass
class State:
    course: dict
    phases: list
    projects: list
    milestones: list
    days: dict  # Tag -> Eintrag aus curriculum.json
    folders: dict = field(default_factory=dict)  # Tag -> Ordner (relativ zum Repo)
    dates: dict = field(default_factory=dict)  # Tag -> date

    @property
    def next_day(self) -> int | None:
        return next((d for d in range(1, 101) if d not in self.folders), None)

    def title(self, day: int) -> str:
        e = self.days[day]
        if e["kind"] == "project":
            p = self.projects[e["project"] - 1]
            return f'{p["name"]} · Teil {e["part"]}/{p["to"] - p["from"] + 1}'
        return e["title"]

    def url(self, day: int) -> str:
        return self.course["dayUrl"].format(day=day)

    def count(self, days) -> int:
        return sum(1 for d in days if d in self.folders)


def load_curriculum() -> State:
    data = json.loads(CURRICULUM.read_text(encoding="utf-8"))
    days = {e["day"]: e for e in data["days"]}
    if sorted(days) != list(range(1, 101)):
        sys.exit("curriculum.json muss genau die Tage 1–100 enthalten.")
    return State(data["course"], data["phases"], data["projects"], data["milestones"], days)


def day_number(name: str) -> int | None:
    m = DAY_PATTERN.match(name)
    if m and 1 <= int(m.group(1)) <= 100:
        return int(m.group(1))
    return None


def has_content(folder: Path) -> bool:
    return any(p.is_file() and p.name not in IGNORED_FILES for p in folder.rglob("*"))


def scan_folders(root: Path) -> tuple[dict, list]:
    """Findet Tagesordner. Gibt {Tag: Pfad} und eine Liste von Hinweisen zurück."""
    found, notes = {}, []
    base = root / DAYS_DIR
    if not base.is_dir():
        return found, notes
    for folder in sorted(p for p in base.iterdir() if p.is_dir()):
        day = day_number(folder.name)
        if day is None:
            notes.append(f"Ignoriert (keine Tagesnummer erkannt): {folder.name}")
        elif not has_content(folder):
            notes.append(f"Ignoriert (Ordner ist leer): {folder.name}")
        elif day in found:
            notes.append(f"Doppelt für Tag {day}: {folder.name} – verwendet wird {found[day].name}")
        else:
            found[day] = folder
    return {d: p.relative_to(root) for d, p in found.items()}, notes


def git_dates(root: Path) -> dict:
    """Datum des ersten Commits je Tag – auch über Umbenennungen hinweg."""
    try:
        out = subprocess.run(
            ["git", "-c", "core.quotePath=false", "log", "--reverse", "--format=%x00%as", "--name-only", "--", DAYS_DIR],
            cwd=root, capture_output=True, text=True, check=True,
        ).stdout
    except (OSError, subprocess.CalledProcessError):
        return {}
    dates, current = {}, None
    for line in out.splitlines():
        if line.startswith("\0"):
            current = date.fromisoformat(line[1:])
        elif line.startswith(DAYS_DIR + "/") and current and Path(line).name not in IGNORED_FILES:
            parts = line.split("/")
            day = day_number(parts[1]) if len(parts) > 2 else None
            if day and day not in dates:
                dates[day] = current
    return dates


# --------------------------------------------------------------------------- Kennzahlen


def stats(s: State) -> dict:
    basics = range(1, 16)
    projects_done = sum(
        all(d in s.folders for d in range(p["from"], p["to"] + 1)) for p in s.projects)
    checkpoints = [d for d, e in s.days.items() if "checkpoint" in e]
    milestones = [m for m in s.milestones if m["kind"] == "milestone"]
    dates = [s.dates[d] for d in s.folders if d in s.dates]
    return {
        "done": len(s.folders),
        "basics": (s.count(basics), len(basics)),
        "projects": (projects_done, len(s.projects)),
        "checkpoints": (s.count(checkpoints), len(checkpoints)),
        "milestones": (sum(all(d in s.folders for d in m["days"]) for m in milestones), len(milestones)),
        "started": min(dates, default=None),
        "updated": max(dates, default=None),
    }


def fmt_date(d: date | None) -> str:
    return d.strftime("%d.%m.%Y") if d else ""


# --------------------------------------------------------------------------- Fortschrittskarte (SVG)

THEMES = {
    "light": dict(card="#F6F8FA", border="#D1D9E0", text="#1F2328", muted="#59636E",
                  track="#E6EAEF", track_text="#818B98", chip="#EBEEF1"),
    "dark": dict(card="#151B23", border="#3D444D", text="#F0F6FC", muted="#9198A1",
                 track="#212830", track_text="#656C76", chip="#1C232C"),
}
FONT = ("-apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Segoe UI', 'Helvetica Neue', "
        "Helvetica, Arial, sans-serif")
ORANGE = "#F05138"

# Breite Karte für Desktop, kompakte Karte (10 × 10) für Smartphones
LAYOUTS = {
    "wide": dict(W=1000, pad=32, cols=25, gap=6, big=46, label=19, meta=13.5, num=12.5, small=13.5,
                 value=16, chip_cols=4, chip_h=48, legend_step=150, unit="von 100 Tagen geschafft"),
    "compact": dict(W=420, pad=20, cols=10, gap=5, big=40, label=16, meta=12.5, num=12, small=12.5,
                    value=15, chip_cols=2, chip_h=44, legend_step=124, unit="von 100 Tagen"),
}


def _n(v: float) -> str:
    return f"{v:.2f}".rstrip("0").rstrip(".")


def _rect(x, y, w, h, r, extra=""):
    return f'<rect x="{_n(x)}" y="{_n(y)}" width="{_n(w)}" height="{_n(h)}" rx="{_n(r)}"{extra}/>'


def progress_svg(s: State, theme: str, layout: str = "wide") -> str:
    t, L, st = THEMES[theme], LAYOUTS[layout], stats(s)
    W, pad, cols, gap = L["W"], L["pad"], L["cols"], L["gap"]
    cell = (W - 2 * pad - (cols - 1) * gap) / cols
    rows = 100 // cols
    big_y = pad + L["big"] * .72
    meta_y = big_y + L["meta"] + 14
    grid_y = meta_y + 22
    legend_y = grid_y + rows * cell + (rows - 1) * gap + 32
    chips_y = legend_y + 20
    chip_rows = 4 // L["chip_cols"]
    H = chips_y + chip_rows * L["chip_h"] + (chip_rows - 1) * 10 + pad
    milestone_days = {m["days"][0] for m in s.milestones if m["kind"] in ("milestone", "exam")}
    nxt = s.next_day

    cells = []
    for i, day in enumerate(range(1, 101)):
        r, c = divmod(i, cols)
        x, y = pad + c * (cell + gap), grid_y + r * (cell + gap)
        tx, ty = _n(x + cell / 2), _n(y + cell / 2 + L["num"] * .36)

        def label(color):
            return f'<text x="{tx}" y="{ty}" class="n" fill="{color}">{day}</text>'

        if day in s.folders:
            cells.append(f'<g class="on" style="animation-delay:{min(i * .02, 1.2):.2f}s">'
                         f'{_rect(x, y, cell, cell, 7, " fill=\"url(#sw)\"")}{label("#FFFFFF")}</g>')
        elif day == nxt:
            cells.append(_rect(x + 1, y + 1, cell - 2, cell - 2, 6,
                               f' class="now" fill="none" stroke="{ORANGE}" stroke-width="2"') + label(ORANGE))
        else:
            dash = f' stroke="{t["track_text"]}" stroke-dasharray="3 3"' if day in milestone_days else ""
            cells.append(_rect(x + .5, y + .5, cell - 1, cell - 1, 6.5, f' fill="{t["track"]}"{dash}')
                         + label(t["track_text"]))

    legend, lx = [], pad
    for kind, label in (("done", "erledigt"), ("now", "als Nächstes"), ("milestone", "Meilenstein")):
        y = legend_y - 10
        if kind == "done":
            legend.append(_rect(lx, y, 12, 12, 3, ' fill="url(#sw)"'))
        elif kind == "now":
            legend.append(_rect(lx + 1, y + 1, 10, 10, 2.5, f' fill="none" stroke="{ORANGE}" stroke-width="2"'))
        else:
            legend.append(_rect(lx + .5, y + .5, 11, 11, 3,
                                f' fill="{t["track"]}" stroke="{t["track_text"]}" stroke-dasharray="2 2"'))
        legend.append(f'<text x="{lx + 19}" y="{_n(legend_y)}" class="s" fill="{t["muted"]}">{label}</text>')
        lx += L["legend_step"]

    chips, chip_gap = [], 10 if layout == "compact" else 12
    cw = (W - 2 * pad - (L["chip_cols"] - 1) * chip_gap) / L["chip_cols"]
    items = (("Swift-Grundlagen" if layout == "wide" else "Grundlagen", st["basics"]), ("Projekte", st["projects"]),
             ("Checkpoints", st["checkpoints"]), ("Meilensteine", st["milestones"]))
    for i, (label, (a, b)) in enumerate(items):
        r, c = divmod(i, L["chip_cols"])
        x, y = pad + c * (cw + chip_gap), chips_y + r * (L["chip_h"] + 10)
        mid = y + L["chip_h"] / 2
        chips.append(_rect(x, y, cw, L["chip_h"], 10, f' fill="{t["chip"]}"')
                     + f'<text x="{_n(x + 14)}" y="{_n(mid + L["small"] * .36)}" class="s" fill="{t["muted"]}">{label}</text>'
                     + f'<text x="{_n(x + cw - 14)}" y="{_n(mid + L["value"] * .36)}" class="v" fill="{t["text"]}" '
                       f'text-anchor="end">{a}/{b}</text>')

    n = st["done"]
    meta = " · ".join(x for x in (f'Start {fmt_date(st["started"])}' if st["started"] else "",
                                  f'zuletzt {fmt_date(st["updated"])}' if st["updated"] else "") if x)
    return f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {W} {_n(H)}" width="{W}" height="{_n(H)}" role="img" aria-labelledby="title">
<title id="title">Fortschritt: {n} von 100 Tagen</title>
<defs>
<linearGradient id="sw" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#FF9F43"/><stop offset=".55" stop-color="#F05138"/><stop offset="1" stop-color="#E5304F"/></linearGradient>
</defs>
<style>
text {{ font-family: {FONT}; font-variant-numeric: tabular-nums; }}
.n {{ font-size: {L['num']}px; font-weight: 600; text-anchor: middle; }}
.s {{ font-size: {L['small']}px; font-weight: 500; }}
.v {{ font-size: {L['value']}px; font-weight: 700; }}
.big {{ font-size: {L['big']}px; font-weight: 800; letter-spacing: -1px; }}
.on {{ animation: fade .5s ease-out both; }}
.now {{ animation: pulse 1.6s ease-in-out infinite; }}
@keyframes fade {{ from {{ opacity: 0; }} to {{ opacity: 1; }} }}
@keyframes pulse {{ 50% {{ opacity: .3; }} }}
@media (prefers-reduced-motion: reduce) {{ .on, .now {{ animation: none; }} }}
</style>
<rect x=".5" y=".5" width="{W - 1}" height="{_n(H - 1)}" rx="14" fill="{t['card']}" stroke="{t['border']}"/>
<text x="{pad}" y="{_n(big_y)}" fill="{t['text']}"><tspan class="big">{n}</tspan><tspan dx="10" fill="{t['muted']}" style="font-size:{L['label']}px;font-weight:500">{L['unit']}</tspan></text>
<text x="{W - pad}" y="{_n(big_y)}" class="big" fill="url(#sw)" text-anchor="end">{n} %</text>
<text x="{pad}" y="{_n(meta_y)}" style="font-size:{L['meta']}px" fill="{t['muted']}">{meta}</text>
{''.join(cells)}
{''.join(legend)}
{''.join(chips)}
</svg>
"""


# --------------------------------------------------------------------------- README-Blöcke


def link(path: Path) -> str:
    return quote(path.as_posix() + "/")


def progress_block(s: State) -> str:
    n, nxt = len(s.folders), s.next_day
    lines = [
        "<picture>",
        f'  <source media="(max-width: 600px) and (prefers-color-scheme: dark)" srcset="{ASSETS}/progress-dark-compact.svg">',
        f'  <source media="(max-width: 600px)" srcset="{ASSETS}/progress-light-compact.svg">',
        f'  <source media="(prefers-color-scheme: dark)" srcset="{ASSETS}/progress-dark.svg">',
        f'  <img src="{ASSETS}/progress-light.svg" width="100%" alt="Fortschritt: {n} von 100 Tagen geschafft">',
        "</picture>",
        "",
    ]
    if nxt:
        lines.append(f'<p align="center"><b>Als Nächstes:</b> Tag {nxt} · <a href="{s.url(nxt)}">{s.title(nxt)}</a></p>')
    else:
        lines.append('<p align="center"><b>🎉 Geschafft – alle 100 Tage abgeschlossen!</b></p>')
    return "\n".join(lines)


def status_cell(s: State, day: int) -> str:
    if day in s.folders:
        label = f"✅ {fmt_date(s.dates.get(day))}".strip()
        return f'[{label}]({link(s.folders[day])} "Code von Tag {day}")'
    return "🟠" if day == s.next_day else ""


def topic_cell(s: State, day: int) -> str:
    e = s.days[day]
    icon = ICON.get(e["kind"], "")
    text = f"[{s.title(day)}]({s.url(day)})"
    milestone = next((m for m in s.milestones if m["days"][0] == day), None)
    if milestone:
        text += f" · {milestone['about'].split(' – ')[0]}"
    return f"{icon} {text}".strip()


def tracker_block(s: State) -> str:
    out = []
    nxt = s.next_day
    for ph in s.phases:
        days = range(ph["from"], ph["to"] + 1)
        done = s.count(days)
        icon = "✅" if done == len(days) else ("🟠" if done or (nxt in days) else "⚪")
        names = [p["name"] for p in s.projects if ph["from"] <= p["from"] <= ph["to"]]
        detail = f" – {', '.join(names)}" if names else ""
        is_open = " open" if nxt in days or (nxt is None and ph is s.phases[-1]) else ""
        out += [
            f"<details{is_open}>",
            f"<summary>{icon} <b>{ph['title']}</b>{detail} · Tag {ph['from']}–{ph['to']} · {done}/{len(days)}</summary>",
            "",
            "| Tag | Thema | Erledigt |",
            "|:---:|:------|:------:|",
        ]
        for d in days:
            out.append(f"| {d} | {topic_cell(s, d)} | {status_cell(s, d)} |")
        out += ["", "</details>"]
    return "\n".join(out)


def projects_block(s: State) -> str:
    rows = []
    for p in s.projects:
        rows.append((p["from"], str(p["number"]), p["name"], p["about"], list(range(p["from"], p["to"] + 1))))
    for m in s.milestones:
        rows.append((m["days"][0], ICON[m["kind"]], m["title"], m["about"], m["days"]))
    out = ["| | Projekt | Worum es geht | Tage | Status |", "|:---:|:------|:------|:---:|:---:|"]
    for _, num, name, about, days in sorted(rows, key=lambda r: (r[0], r[1].isdigit())):
        done = s.count(days)
        status = "✅" if done == len(days) else (f"🟠 {done}/{len(days)}" if done else "")
        span = f"{days[0]}–{days[-1]}" if len(days) > 1 else str(days[0])
        out.append(f"| {num} | **{name}** | {about} | {span} | {status} |")
    return "\n".join(out)


def replace_block(text: str, name: str, body: str) -> str:
    pattern = re.compile(rf"(<!-- {name}:start -->).*?(<!-- {name}:end -->)", re.S)
    if not pattern.search(text):
        sys.exit(f"Markierung <!-- {name}:start --> / <!-- {name}:end --> fehlt in der README.")
    return pattern.sub(lambda m: f"{m.group(1)}\n{body}\n{m.group(2)}", text, count=1)


# --------------------------------------------------------------------------- Ablauf


def build(root: Path) -> tuple[State, dict, list]:
    s = load_curriculum()
    s.folders, notes = scan_folders(root)
    s.dates = git_dates(root)
    readme = (root / README).read_text(encoding="utf-8")
    for name, fn in (("progress", progress_block), ("tracker", tracker_block), ("projects", projects_block)):
        readme = replace_block(readme, name, fn(s))
    files = {root / README: readme}
    for theme in THEMES:
        files[root / ASSETS / f"progress-{theme}.svg"] = progress_svg(s, theme)
        files[root / ASSETS / f"progress-{theme}-compact.svg"] = progress_svg(s, theme, "compact")
    return s, files, notes


def update(root: Path = ROOT) -> int:
    s, files, notes = build(root)
    for note in notes:
        print("Hinweis:", note)
    changed = [p for p, content in files.items()
               if not p.exists() or p.read_text(encoding="utf-8") != content]
    for p in changed:
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(files[p], encoding="utf-8")
        print("Aktualisiert:", p.relative_to(root))
    if os.environ.get("GITHUB_OUTPUT"):  # für die Commit-Nachricht der GitHub Action
        with open(os.environ["GITHUB_OUTPUT"], "a", encoding="utf-8") as out:
            out.write(f"done={len(s.folders)}\n")
    nxt = f", als Nächstes Tag {s.next_day}" if s.next_day else ""
    print(f"Fortschritt: {len(s.folders)}/100 Tage{nxt}." + ("" if changed else " Alles war schon aktuell."))
    return 0


if __name__ == "__main__":
    sys.exit(update())
