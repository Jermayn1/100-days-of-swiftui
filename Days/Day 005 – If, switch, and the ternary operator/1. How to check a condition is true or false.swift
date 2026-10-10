import Playgrounds

// Day 5 – If, switch, and the ternary operator
// https://www.hackingwithswift.com/100/swiftui

#Playground {
    // How to check a condition is true or false
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-check-a-condition-is-true-or-false
    
    let score = 85
    
    if score > 80 {
        print("Great job!")
    }
    
    // Wie in jeder anderen Programmiersprache C#, Java, JS und Co.
    
    // Weitere Beispiele
    
    let speed = 89
    let percentage = 85
    let age = 18
    
    if speed >= 89 {
        print("Geschwindigkeit ist größer oder gleich 89")
    }
    
    if percentage < 85 {
        print("Du hast den Test nicht bestanden")
    }
    
    if age >= 18 {
        print("Volljährig")
    }
    
    
    // Strings kann man direkt vergleichen
    let ourName = "Jermayn"
    let friendName = "Finn der Husky"
    
    // Bei < und > wird alphabetisch geprüft bei Strings
    if ourName < friendName {
        print("\(ourName) vs \(friendName)")
    }
    
    if ourName > friendName {
        print("\(friendName) vs \(ourName)")
    }
    
    // Weitere Beispiele
    
    var numbers = [1, 2, 3]
    numbers.append(4)
    
    if numbers.count > 3 {
        numbers.remove(at: 0)
    }
    
    // Letztes Element gelöscht
    print(numbers)
    
    // Weitere Beispiele
    
    let country = "Germany"
    
    if (country == "Canada") {
        print("Howdy!")
    }
    
    // Weitere Beispiele
    
    let name = "Finn"
    
    if name != "Anonymous" {
        print("Howdy, \(name)")
    }
    
    // Weitere Beispiele
    
    var username = "jermayn611"
    
    if username == "" {
        username = "Anonymous"
    }
    
    print("Howdy, \(username)")
    
    // Weitere Möglichkeiten einen Leeren String zu prüfen
    // Strings mit einen anderen String zu vergleichen ist nicht der schnellste Weg (nicht schnell)
    
    // Zeichenanzahl als Integer prüfen
    // Bei langen Strings nicht performant, Swift zählt jedes Zeichen
    if username.count == 0 {
        username = "Anonymous"
    }
    
    // isEmpty Eigenschaft (Boolean)
    if username.isEmpty {
        username = "Anonymous"
    }
    
}
