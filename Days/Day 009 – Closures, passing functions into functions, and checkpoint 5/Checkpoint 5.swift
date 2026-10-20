import Playgrounds

// Day 9 – Closures, passing functions into functions, and checkpoint 5
// https://www.hackingwithswift.com/100/swiftui/9

#Playground {
    // Checkpoint 5
    // https://www.hackingwithswift.com/quick-start/beginners/checkpoint-5
    
    /*
     Aufgabe:
     1. Alle geraden Zahlen aussortieren
     2. Array aufsteigend sortieren
     3. In Strings mappen im folgenden Format: "7 is a lucky number"
     4. Array ausgeben, ein Element pro Zeile
     Alles ohne temporäre Variablen
     */
    
    // Gegeben
    let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
    
    
    // filter, um die geraden Zahlen auszusortieren
    // sorted, um das Array aufsteigend zu sortieren
    // map, um jede Zahl in einen String im oben angegebenen Format umzuwandeln
    // Die Aufrufe hängen direkt hintereinander, deshalb braucht man keine Zwischenvariablen, wie die Aufgabe es verlangt
    let result = luckyNumbers
        .filter { !$0.isMultiple(of: 2) }
        .sorted { $0 < $1 }
        .map { "\($0) is a lucky Number" }
    
    // Ausgabe der Array result, ein Element pro Zeile
    for name in result {
        print(name)
    }
    
}
