import Playgrounds

// Day 2 – Booleans, string interpolation, and checkpoint 1
// https://www.hackingwithswift.com/100/swiftui/2

#Playground {
    // How to store truth with Booleans
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-store-truth-with-booleans
    
    // Booleans (Wahrheitswerte: true oder false) kennt man bereits aus anderen Programmiersprachen und aus Day 1 vom Swift Kurs
    
    // Beispiel für Booleans aus Day 1
    let filename = "paris.jpg"
    print(filename.hasSuffix(".jpg"))
    
    let number = 120
    print(number.isMultiple(of: 3))
    
    
    // Booleans in einer Variable speichern
    let goodDogs = true
    var gameOver = false
    let isMultiple = 120.isMultiple(of: 3)
    
    
    // Booleans haben keine Rechenoperatoren (macht auch keinen Sinn)
    // Boolean flippen (negieren mit ! Operator bzw. den "not" Operator)
    var isAuthenticated = false
    isAuthenticated = !isAuthenticated
    print(isAuthenticated)
    isAuthenticated = !isAuthenticated
    print(isAuthenticated)
    
    
    // toggle() Methode
    // Dasselbe wie der NOT-Operator, ist etwas kürzer und sauberer
    print(gameOver)
    gameOver.toggle()
    print(gameOver)
    
    
    
    
    // How to join strings together
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-join-strings-together
    
    // + verwenden, um Strings zusammenzufügen (string interpolation)
    let firstPart = "Hello, "
    let secondPart = "world!"
    let greeting = firstPart + secondPart
    print(greeting)
    
    let people = "Haters"
    let action = "hate"
    let lyric = people + " gonna " + action
    print(lyric)
    
    // operator overloading, der Grund warum man mit + Text zusammenfügen kann und mit Zahlen rechnen kann
    // // += funktioniert auch bei Strings
    var howdy = "How"
    howdy += "dy!"
    print(howdy)
    
    // Viele String zusammenführen
    let luggageCode = "1" + "2" + "3" + "4" + "5"
    // Swift erstellt beim zusammenfügen von vielen String temporäre String
    // Swift arbeitet dabei so:
    /*
     "12" + "3" + "4" + "5"
     "123" + "4" + "5"
     "1234" + "5"
     "12345"
    */
    
    // Swift hat dazu eine bessere Lösung (String-Interpolation)
    let name = "Finn"
    let age = 1
    let message = "Hello, my name is \(name) and I'm \(age) years old."
    print(message)
    
    // Fall: Integer mit + in String hinzufügen
    let number2 = 11
    // direkt mit + funktionert es nicht
    // let missionMessage = "Apollo " + number2 + " landed on the moon."
    
    // Man kann Swift sagen, dass er die Zahl wie ein String behandeln soll und so würde es funktioneren
    let missionMessage1 = "Apollo " + String(number2) + " landed on the moon."
    print(missionMessage1)
    
    // Am schnellsten geht es aber mit String-Interpolation
    let missionMessage2 = "Apollo \(number2) landed on the moon."
    print(missionMessage2)
    
    
    // Rechnen innerhalb eines String
    print("5 x 5 is \(5 * 5)")
}
