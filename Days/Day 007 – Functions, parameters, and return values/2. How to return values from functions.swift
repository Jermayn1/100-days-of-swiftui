import Playgrounds
// Cocoa bringt viele mathematische Funktionen mit sich, z. B. sqrt()
import Cocoa

// Day 7 – Functions, parameters, and return values
// https://www.hackingwithswift.com/100/swiftui/7

#Playground {
    // How to return values from functions
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-return-values-from-functions
    
    
    // sqrt() gibt einen Wert zurück, den wir in root speichern
    let root = sqrt(169)
    print(root)
    
    // Beispiel: Funktion mit einem Rückgabewert
    
    // Hier wird ein Int als Rückgabewert erwartet
    // Es kann nur ein Int zurückgegeben werden
    // Mit -> DATENTYP wird festgelegt, welcher Datentyp als Rückgabewert erwartet wird
    
    func rollDice() -> Int {
        return Int.random(in: 1...6)
    }
    
    let result = rollDice()
    print(result)
    
    
    // Weiteres Beispiel
    
    func areLettersIdentical(string1: String, string2: String) -> Bool {
        let first = string1.sorted()
        let second = string2.sorted()
        return first == second
    }
    
    
    // Weiteres Beispiel
    
    // Besteht der Body nur aus einem einzigen Ausdruck, kann man return weglassen
    // Swift gibt das Ergebnis dieses Ausdrucks automatisch zurück
    func pythagoras(a: Double, b: Double) -> Double {
        sqrt(a * a + b * b)
    }

    let c = pythagoras(a: 3, b: 4)
    print(c)

    // Sobald mehr als eine Zeile im Body steht, braucht man return wieder
    func pythagoras2(a: Double, b: Double) -> Double {
        let input = a * a + b * b
        return sqrt(input)
    }

}
