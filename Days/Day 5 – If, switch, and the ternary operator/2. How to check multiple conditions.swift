import Playgrounds

// Day 5 – If, switch, and the ternary operator
// https://www.hackingwithswift.com/100/swiftui

#Playground {
    // How to check multiple conditions
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-check-multiple-conditions
    
    // else if und else funktioneren hier in der Logik identisch wie in anderen Sprachen
    // Genauso wie UND (&&) und ODER (||)
    
    // Beispiel
    
    let age = 17
    
    if age >= 18 {
        print("Volljährig")
    } else {
        print("Nicht Volljährig")
    }
    
    // Weiteres Beispiel
    
    let a = false
    let b = true

    if a {
        print("Code to run if a is true")
    } else if b {
        print("Code to run if a is false but b is true")
    } else {
        print("Code to run if both a and b are false")
    }
    
    // Weiteres Beispiel
    
    let temp = 25
    
    // Verschachtelt
    if temp > 20 {
        if temp < 30 {
            print("Gutes Wetter!")
        }
    }
    
    // Mit logischen Operatoren
    if temp > 20 && temp < 30 {
        print("Gutes Wetter!")
    }
    
    // Weiteres Beispiel
    
    let userAge = 15
    let hasAgeParentalConsent = true
    
    if userAge >= 18 || hasAgeParentalConsent {
        print("You can buy the game")
    }
    
    // Weiteres Beispiel
    
    enum TransportOption {
        case airplane, helicopter, bicycle, car, scooter
    }
    
    let transport = TransportOption.airplane
    
    // Swift erkennt automatisch, dass man hier mit TransportOption vergleicht, daher reicht ein .CASE aus
    if transport == .airplane || transport == .helicopter {
        print("Fliegen")
    } else if transport == .bicycle {
        print("Drahtesel")
    } else if transport == .car {
        print("Stau")
    } else {
        print("Fußgänger")
    }
        
}
