import Playgrounds

// Day 7 – Functions, parameters, and return values
// https://www.hackingwithswift.com/100/swiftui/7

#Playground {
    // How to customize parameter labels
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-customize-parameter-labels
    
    // Beispiel
    
    func rollDice(sides: Int, count: Int) -> [Int] {
        // Leeres Array anlegen
        var rolls = [Int]()

        // Die Anzahl (count) durchlaufen
        for _ in 1...count {
            // Jeden Wurf im Array speichern
            let roll = Int.random(in: 1...sides)
            rolls.append(roll)
        }

        // Gibt das Array mit den Würfen zurück
        return rolls
    }

    let rolls = rollDice(sides: 6, count: 4)
    print(rolls)
    
    
    // Weiteres Beispiel
    
    // Alle drei Funktionen sind erlaubt und funktionieren
    // Die Parameternamen gehören zum Funktionsnamen dazu, deshalb sind es drei verschiedene Funktionen
    // Swift erkennt am Parameternamen beim Aufruf, welche Funktion gemeint ist
    // In C# ginge das nicht, dort zählen nur Anzahl und Typen der Parameter, nicht die Namen
    func hireEmployee(name: String) { }
    func hireEmployee(title: String) { }
    func hireEmployee(location: String) { }
    
    
    // Die Methode hasPrefix() von String anschauen
    
    let lyric = "I see a red door and I want it painted black"
    
    // Hier wird kein Parametername angegeben
    // Das geht, weil Apple den externen Namen mit _ weggelassen hat: func hasPrefix(_ prefix: String) -> Bool
    print(lyric.hasPrefix("I see"))
    
    
    // Weiteres Beispiel
    
    // _ = externer Name: beim Aufruf schreibt man kein Label
    // string = interner Name: den benutzt man im Body
    func isUppercase(_ string: String) -> Bool {
        string == string.uppercased()
    }
    
    let string = "HELLO, WORLD"
    // Jetzt muss kein Parametername angegeben werden
    // Hier ist es offensichtlich, dass man einen String übergibt
    let result = isUppercase(string)
    print(result)
    
    
    // Weiteres Beispiel
    
    func printTimesTable(numbers: Int) {
        for i in 1...12 {
            print("\(i) * \(numbers) is \(i * numbers)")
        }
    }
    
    printTimesTable(numbers: 5)
    
    // Was besser wäre
    // Zwei Namen für einen Parameter: einen externen und einen internen
    
    // for ist der externe Name für Aufrufe, numbers der interne Name im Body
    // Der Aufruf liest sich dann wie ein englischer Satz: "print times table for 6"
    // for allein ginge im Body nicht, weil for ein Schlüsselwort ist
    func printTimesTable2(for numbers: Int) {
        for i in 1...12 {
            print("\(i) * \(numbers) is \(i * numbers)")
        }
    }
    
    printTimesTable2(for: 6)

}
