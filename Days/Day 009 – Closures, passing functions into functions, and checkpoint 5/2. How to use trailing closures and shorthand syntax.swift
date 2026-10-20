import Playgrounds

// Day 9 – Closures, passing functions into functions, and checkpoint 5
// https://www.hackingwithswift.com/100/swiftui/9

#Playground {
    // How to use trailing closures and shorthand syntax
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-use-trailing-closures-and-shorthand-syntax
    
    // Beispiel aus dem vorherigen Teil
    
    let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

    let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
        if name1 == "Suzanne" {
            return true
        } else if name2 == "Suzanne" {
            return false
        }

        return name1 < name2
    })

    print(captainFirstTeam)
    
    // sorted(by:) nimmt jede Funktion entgegen, die zwei Strings bekommt und einen Bool zurückgibt
    // Swift kennt die Typen dadurch schon, das macht die Kurzformen unten möglich
    
    
    // Beispiel weiter kürzen
    
    // Trailing Closure: Ist der Closure der letzte Parameter, schreibt man ihn direkt hinter den Funktionsaufruf
    // Das by: und die runden Klammern fallen dann weg
    // Die Datentypen und -> Bool kann man auch weglassen, weil Swift sie schon kennt
    let captainFirstTeam2 = team.sorted { name1, name2 in
        if name1 == "Suzanne" {
            return true
        } else if name2 == "Suzanne" {
            return false
        }

        return name1 < name2
    }
    
    
    // Beispiel noch weiter kürzen
    
    // Lässt sich in meinen Augen etwas schwerer lesen
    // Die Parameterliste mit in fällt weg, man fängt direkt mit dem Code an
    // Swift stellt die Parameter automatisch als $0, $1 usw. bereit (Shorthand-Syntax)
    // $0 ist hier name1, $1 ist name2
    
    let captainFirstTeam3 = team.sorted {
        if $0 == "Suzanne" {
            return true
        } else if $1 == "Suzanne" {
            return false
        }

        return $0 < $1
    }
    
    
    // Beispiel: Rückwärts sortieren direkt mit einem Closure
    
    let reverseTeam = team.sorted {
        return $0 > $1
    }
    
    print(reverseTeam)
    
    // Besteht der Body nur aus einem Ausdruck, kann man return weglassen, wie bei Funktionen
    
    let reverseTeam2 = team.sorted { $0 > $1 }
    
    
    // Wann sich die Shorthand-Syntax lohnt
    // Wenn der Closure kurz ist
    // Wenn man $0, $1 usw. jeweils nur einmal braucht
    // Bei wenigen Parametern, ab drei ($0, $1, $2) wird es schnell unübersichtlich
    
    
    // Weiteres Beispiel
    // filter() behält nur die Elemente, für die der Closure true zurückgibt
    
    let tOnly = team.filter { $0.hasPrefix("T") }
    print(tOnly)
    
    
    // Weiteres Beispiel
    
    // map() wendet den Closure auf jedes Element an und gibt die Ergebnisse als neues Array zurück
    let uppercaseTeam = team.map { $0.uppercased() }
    print(uppercaseTeam)
    
    // In SwiftUI arbeitet man später oft mit Closures und der Shorthand-Syntax
    // Theoretisch könnte man jedes Mal eine extra Funktion schreiben, mit einem Closure ist es aber kürzer und sauberer
}
