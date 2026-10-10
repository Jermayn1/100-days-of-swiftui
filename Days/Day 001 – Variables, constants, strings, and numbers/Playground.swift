import Playgrounds

// Day 1 – Variables, constants, strings, and numbers
// https://www.hackingwithswift.com/100/swiftui/1

#Playground {
    // How to create variables and constants
    // https://www.hackingwithswift.com/100/swiftui/1
    
    // ---------------------------
    // Variable deklarieren und setzen
    // ---------------------------
    var greeting = "Hello, playground"
    print(greeting)
    
    greeting = "Finn der Husky"
    print(greeting)
    
    greeting = "Jermayn"
    print(greeting)
    
    // --------------------------- 
    // Konstante erstellen
    // ---------------------------
    let character = "Daphne"
    
    // Wie in allen anderen Sprachen kann man eine Konstante nicht verändern
    // character = "Howdy"
    
    
    
    
    // How to create strings
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-create-strings
    
    let actor = "Denzel Washington"
    let filename = "paris.jpg"
    let result = "⭐️ You win! ⭐️"
    
    // Zeichen wie " im String anzeigen, identisch wie bei den meisten Sprachen
    let quote = "Then he tapped a sign saying \"Believe\" and walked away."
    print(quote)
    
    // In Swift selber gibt es kein wirkliches Limit für die Länge von Strings
    
    // Multiline String, String über mehreren Zeilen
    // Syntax ist """ Text über mehrere Zeilen """
    let movie = """
        A day in
        the life of an
        Apple engineer
        """
    print(movie)
    
    // Nützliche String Methoden
    
    // Zeichenlänge .count
    print(actor.count)
    
    // Oder auch möglich
    let nameLength = actor.count
    print(nameLength)
    
    
    // Alles in CAPS .uppercased()
    print(result.uppercased())
    
    // String startet mit etwas .hasPrefix("Start")
    print(movie.hasPrefix("A day")) // true
    print(movie.hasPrefix("Howdy")) // false
    
    // String endet mit etwas .hasSuffix("Ende")
    print(filename.hasSuffix(".jpg")) // true
    
    // Swift ist bei den Methoden case sensitive
    
    
    
    
    // How to store whole numbers
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-store-whole-numbers
    
    // Ganze Zahlen sind in Swift Integer
    
    let score = 10
    
    // Ganze Zahlen im Code lesbarer machen mit _
    // _ hat keinen Einfluss wie Swift die Zahl behandelt, Swift ignoriert sie
    // Es macht die Zahl nur lesbarer für Menschen
    // Die Anzahl und Position der Unterstriche sind egal
    
    let reallyBig = 100_00____0_000___000
    
    // Mathematische Operatoren
    
    let lowerScore = score - 2
    let higherScore = score + 10
    let doubleScore = score * 2
    let squaredScore = score * score
    let halvedScore = score / 2
    
    // Short Hand Operator
    
    var counter = 10
    counter += 5
    print(counter)
    
    counter *= 2
    counter -= 10
    counter /= 2
    
    
    // Nützliche Integer Methoden
    
    // .isMultiple(of: 3)
    let number = 128
    print(number.isMultiple(of: 3))
    
    // Das ganze geht auch direkt ohne Variable
    print(120.isMultiple(of: 3))
    
    
    
    
    // How to store decimal numbers
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-store-decimal-numbers
    
    // floating-point numbers (Gleitkommazahlen)
    
    // Minimale Abweichung
    // Wie in vielen Programmiersprachen auch
    let numberFloat = 0.1 + 0.2
    print(numberFloat) // 0.30000000000000004
    
    
    // Integer mit einer Dezimalzahl aufzurechnen geht nicht
    let a = 1
    let b = 2.1
    // Das geht nicht!
    // let c = a + b
    
    // Um das zu machen muss man Swift sagen wie mit den Zahlen umgegangen werden soll.
    // Wie das Casten in anderen Sprachen, bzw. nicht wirkliches automatisch Typecasting. Es wird eine neue Instanz/Struktur des jeweiligen Typs erstellt und wandelt den Wert mit um (Type Conversion)
    // In diesem Fall gibt es zwei Möglichkeiten
    let cOptionA = a + Int(b)
    let cOptionB = Double(a) + b
    print(cOptionA) // Hier geht die Kommazahl verloren!
    print(cOptionB)
    
    
    // Beim Deklarieren entscheidet Swift automatisch welcher Datentyp passt
    let double1 = 3.1
    let double2 = 3131.3131
    let double3 = 3.0
    let int1 = 3
    
    
    // Type safety die Variable hält den Datentypen und man kann den Datentyp der Variable nicht mehr ändern
    var name1 = "Finn der Husky"
    // name1 = 2 GEHT NICHT! 2 ist ein INTEGER und kein STRING
    
    
    // Dezimalzahlen haben die selben Operatoren wie Integer
    var rating = 5.0
    rating += 5
    rating -= 2.5
    rating *= 2.2
    rating /= 1.1
    
    // In älteren APIs werden Dezimalzahlen anders gespeichert (in  CGFloat)
    // MERKEN CGFloat ignorieren und immer Double nutzen, Swift lässt das zu
}
