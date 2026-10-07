import Playgrounds

// Day 3 – Arrays, dictionaries, sets, and enums
// https://www.hackingwithswift.com/100/swiftui/3

#Playground {
    // How to store ordered data in arrays
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-store-ordered-data-in-arrays
    
    // Mehrere Werte in einer Array speichern
    // String Array
    var beatles = ["John", "Paul", "George", "Ringo"]
    // Integer Array
    let numbers = [4, 8, 15, 16, 23,42]
    // Double Array
    var temperatures = [25.3, 28.2, 26.4]
    
    // Der Index startet auch wie bei anderen Programmiersprachen bei 0 bis n
    
    // Wert in Array zugreifen
    print(beatles[0])
    print(numbers[1])
    print(temperatures[2])
    
    // Array einen Wert hinzufügen .append()
    beatles.append("Finn der Husky")
    
    // In einer Array können mehrere Werte gleichzeitig vorkommen
    beatles.append("John")
    beatles.append("Finn der Husky")
    
    // Arrays können nur einen Datentypen halten in Swift (Type Safety)
    // numbers.append("Welpe") geht nicht!
    
    
    // Leere Array anlegen von einen Datentypen
    // Den Typen in die <>
    // () kann man die Array noch Sachen festlegen wie platzhalter für n plätze
    var scores = Array<Int>()
    scores.append(100)
    scores.append(80)
    scores.append(85)
    print(scores[1])
    
    
    // Mehre Möglichkeiten wie man Arrays anlegt
    var albums1 = Array<String>()
    // Man kann auch direkt ein Startwert geben und Swift nimmt dann diesen Datentypen
    var albums2 = ["Folklore"]
    var albums3 = [String]()
    albums3.append("Folklore")
    albums3.append("Fearless")
    albums3.append("Red")
    
    
    // Nützliche Array Methoden
    
    // .count() Länge der Array
    print(albums3.count)

    var characters = ["Lana", "Pam", "Ray", "Sterling"]
    print(characters.count)
    
    // .remove() an bestimmten Index ein Wert aus der Array entfernen
    characters.remove(at: 2)
    print(characters.count)
    
    // .removeAll() entfernt alles aus einer Array
    characters.removeAll()
    print(characters.count)
    
    let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
    // .contains() prüft ob ein Wert in dieser Array exisister
    print(bondMovies.contains("Frozen"))
    
    let cities = ["London", "Tokyo", "Rome", "Budapest"]
    // .sorted() Array sortieren (Nur in Ausgabe)
    print(cities.sorted())
    
    let presidents = ["Bush", "Obama", "Trump", "Biden"]
    // .reversed() Eine Array rückwärts geben
    let reversedPresidents = presidents.reversed()
    print(reversedPresidents)
    // Swift macht hier raus einen neuen Typen, die originale Array bleibt innendrinenn normal
    // Ist eine Optimisierung von Swift selbest
    // ReversedCollection<Array<String>>(_base: ["Bush", "Obama", "Trump", "Biden"])
    
    
    // Viele dieser Methoden gibt es auch beim String
    // Praktisch, man lernt es einmal und kann es an vielen Stellen anwenden
    
    
    
    
    
    
}
