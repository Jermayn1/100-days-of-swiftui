import Playgrounds

// Day 8 – Default values, throwing functions, and checkpoint 4
// https://www.hackingwithswift.com/100/swiftui/8

#Playground {
    // How to provide default values for parameters
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-provide-default-values-for-parameters
    
    // Beispiel
    
    // Wird end nicht übergeben, nimmt Swift 12 als Standardwert
    // Standardwerte für Parameter nennt man Default Values
    func printTimesTables(for number: Int, end: Int = 12) {
        for i in 1...end {
            print("\(i) x \(number) is \(i * number)")
        }
    }

    printTimesTables(for: 5, end: 20)
    // 12 wird für end als Standardwert genommen
    printTimesTables(for: 8)
    
    
    // Weiteres Beispiel
    
    var characters = ["Lana", "Pam", "Ray", "Sterling"]
    print(characters.count)
    // Mit keepingCapacity: true behält das Array seinen reservierten Speicher, obwohl es danach leer ist
    // Der Standardwert für keepingCapacity ist false, removeAll() nutzt also selbst einen Default Value
    characters.removeAll(keepingCapacity: true)
    print(characters.count)
    
    // Swift gibt Arrays so viel Speicher, wie sie brauchen
    // Kommen neue Elemente dazu, vergrößert Swift den Speicher des Arrays
    // removeAll() gibt den Speicher standardmäßig wieder frei
    // Will man das Array danach wieder befüllen, lohnt sich keepingCapacity: true, weil Swift den Speicher dann nicht neu reservieren muss
    
}
