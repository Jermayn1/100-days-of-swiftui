import Playgrounds

// Day 3 – Arrays, dictionaries, sets, and enums
// https://www.hackingwithswift.com/100/swiftui/3

#Playground {
    // How to store and find data in dictionaries
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-store-and-find-data-in-dictionaries
    
    // Beispiel Array als Einleitung zum Dictionary
    var employee = ["Taylor Swift", "Singer", "Nashville"]
    
    print("Name: \(employee[0])")
    print("Job title: \(employee[1])")
    print("Location: \(employee[2])")
    
    // Man kann hier nicht sicher sein, dass Index 2 die Location von Employee ist bzw. ob das Element überhaupt vorhanden ist
    
    print("Name: \(employee[0])")
    employee.remove(at: 1)
    print("Job title: \(employee[1])")
    // print("Location: \(employee[2])") Geht nicht, da wir ein Index gelöscht haben
    
    // Wenn man wie hier oben jetzt noch etwas aus dem Array löscht, verschiebt sich alles ab da nach links und es ist weiterhin nicht garantiert, dass der Index 1 weiterhin der Job-Titel ist
    
    // Die Lösung in Swift sind Dictionarys
    // so erstellt man ein Dictionary in Swift
    let employee2 = [
        "name": "Taylor Swift",
        "job": "Singer",
        "location": "Nashville"
    ]
    
    // Ab jetzt greift man über klare Schlüssel (Keys) wie "job" oder "location" auf die Werte zu. Jedem Key ist genau ein Value zugeordnet
    // Swift sagt jetzt das die Expression implicitly coerced from String? to Any ist
    // Der Code ist richtig geschrieben in diesem Dokument
    // Es bedeutet man bekommt evtl. ein Wert zurück, eventuell gibt es aber auch keinen
    // Deshalb kann man einen Default-Wert als Fallback hinzufügen. Wenn der Key nicht existiert, wird dieser Wert genutzt – und die IDE-Warnung verschwindet
    // Wie nullable in C#, String? ist in Swift ein "Optional String", wenn es keinen Wert gibt wandelt Swift es automatisch zu Any um (implizit)
    print(employee2["name", default: "Unknown"])
    print(employee2["job", default: "Unknown"])
    print(employee2["location", default: "Unknown"])
    
    // Weitere Beispiele
    //String Boolean Dictionary
    let hasGraduated = [
        "Eric": false,
        "Maeve": false,
        "Otis": false
    ]
    
    // Integer String Dictionary
    let olympics = [
        2012: "London",
        2016: "Rio de Janeiro",
        2021: "Tokyo"
    ]
    
    // Hier kann man jetzt einen Integer als Key verwenden
    print(olympics[2012, default: "Unknown"])
    
    
    // Leeres Dictionary anlegen (String Integer Dictionary)
    var heights = [String: Int]()
    // Werte einem Dictionary hinzufügen
    heights["Yao Ming"] = 229
    heights["Shaquille O'Neal"] = 216
    heights["LeBron James"] = 206
    
    // String String Dicitonary erstellen
    var archEnemies = [String: String]()
    archEnemies["Batman"] = "The Joker"
    archEnemies["Superman"] = "Lex Luthor"
    // Ab hier wird für den Key Batman der Wert Penguin gesetzt (überschrieben)
    archEnemies["Batman"] = "Penguin"
    
    
    // Eigenschaften wie .count oder .isEmpty gibt es auch bei Dictionaries. Aber Vorsicht: Dictionaries sind ungeordnet, weshalb indexbasierte Methoden wie .remove(at:) hier nicht funktionieren.
}
