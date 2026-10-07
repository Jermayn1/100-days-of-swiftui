import Playgrounds

// Day 3 – Arrays, dictionaries, sets, and enums
// https://www.hackingwithswift.com/100/swiftui/3

#Playground {
    // How to create and use enums
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-enums
    
    // Enumerations (Enums) sind eine definierte Menge von festen Werten in Swift
    // Sie machen den Code typsicher, verhindern Tippfehler und sind extrem effizient in Swift
    // Vom Umgang her ähnlich wie in C#, aber in Swift sind Enums mächtige, eigenständige Typen
    
    // Problem darstellen
    // Ein Nutzer soll ein Wochentag auswählen
    // Ohne Enums würde es so aussehen
    var selected = "Monday"
    selected = "Tuesday"
    selected = "January" // Monat
    selected = "Friday " // Leerzeichen am Ende
    
    // Solche Fehler gehen schnell unter, da man sie nicht direkt sieht und lange nach Bugursachen suchen müsste
    // Wenn man an einer anderen Stelle Vergleiche anstellt und Strings wegen Leerzeichen nicht übereinstimmen, schlägt die Prüfung fehl
    // Daher kommen Enums zum Einsatz: Mit ihnen legt man exakt fest, welche Werte möglich sind
    
    // So erstellt man ein Enum
    enum Weekday {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
    }
    
    // Kurzschreibweise
    enum WeekdayShort {
        case monday, tuesday, wednesday, thursday, friday
    }
    
    // Enums verwenden, Wert einer Variable setzen
    // Der Typ wäre jetzt Weekday
    var day = Weekday.monday
    day = Weekday.tuesday
    
    // Da der Typ der Variable bereits als Weekday feststeht, nutzt man in Swift die Kurzschreibweise mit führendem Punkt: .friday
    day = .friday
    
}
