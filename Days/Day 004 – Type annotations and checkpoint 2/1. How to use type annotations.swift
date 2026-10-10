import Playgrounds

// Day 4 – Type annotations and checkpoint 2
// https://www.hackingwithswift.com/100/swiftui/4

#Playground {
    // How to use type annotations
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-use-type-annotations
    
    // Swift setzt automatisch den richtigen Datentyp je nach Zuweisung eines Wertes
    
    // Bisher haben wir Variablen und Konstanten so erstellt:
    // Hier nutzt Swift "Type Inference" (Typableitung)
    // surname muss ein String sein, weil wir einen Text setzen
    // score muss ein Integer sein, weil wir eine ganze Zahl setzen
    let surname = "Lasso"
    var score = 0
    
    // Mit "Type Annotations" können wir explizit angeben, welchen Datentyp wir haben wollen
    let surname2: String = "Lasse"
    var score2: Int = 0
    
    // Hier erzwingen wir den Typ Double, obwohl wir nur eine 0 zuweisen (ohne Annotation wäre es Int)
    var score3: Double = 0
    
    let playerName: String = "Roy"
    let luckyNumber: Int = 13
    let pi: Double = 3.141
    var isAuthenticated: Bool = true
    
    // Dasselbe geht auch mit komplexen Typen wie Arrays, Dictionaries und Sets
    var albums: [String] = ["Red", "Fearless"]
    var users: [String: String] = ["id": "@twostraws"]
    var books: Set<String> = Set([
        "The Bluest Eye",
        "Foundation",
        "Girl, Woman, Other"
    ])
    
    // Swift würde bei diesem Beispiel automatisch erkennen, dass es sich um Strings handelt
    var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
    
    // Wenn man ein leeres Array erstellt, sind Type Annotations oder explizite Initialisierer wichtig, damit Swift weiß, was im Array gespeichert werden soll
    var teams: [String] = [String]()
    
    // Auch möglich, diese Schreibweise wird von vielen bevorzugt:
    // Es macht dasselbe wie oben
    // Hier kann man aussuchen, was einem am besten gefällt
    var cities: [String] = []
    var clues = [String]()
    
    
    // Man kann es auch mit eigenen Datentypen machen wie eigene Enums
    enum UIStyle {
        case light, dark, system
    }
    
    // Hier wäre es klar, da Swift automatisch weiß, dass es vom Typen UIStyle ist
    var style = UIStyle.light
    style = .dark
    
    // Hier mit UIStyle verwendet mit Type annotations
    var styles: [UIStyle] = []
    
    
    // Beispiel
    // String muss ein Username sein (Konstante)
    let username: String
    // weitere Logik
    // Hier kann man jetzt einen Wert setzen, weil die Konstante bisher keinen hat. Das geht nur mit Type Annotation, weil Swift vorher nicht weiß, welchen Datentyp sie erhalten wird
    username = "Howdy"
    // Überschreiben geht nicht, da bereits ein Wert gesetzt worden ist und Konstanten nicht veränderbar sind
    // username = "Finn der Husky"
    // weitere Logik
    print(username)
    
    
    // Das geht natürlich nicht (Kompilerfehler)
    // Swift kann einen String nicht automatisch in einen Integer umwandeln
    // let scores: Int = "Zero"
    
}
