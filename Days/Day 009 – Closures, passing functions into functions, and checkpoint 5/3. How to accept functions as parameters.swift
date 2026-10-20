import Playgrounds

// Day 9 – Closures, passing functions into functions, and checkpoint 5
// https://www.hackingwithswift.com/100/swiftui/9

#Playground {
    // How to accept functions as parameters
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-accept-functions-as-parameters
    
    // Beispiel
    
    // Eine Funktion, die ein Int-Array in der gewünschten Größe erstellt und mit Zahlen befüllt
    // Welche Zahlen reinkommen, entscheidet die übergebene Funktion generator
    
    // size ist die Anzahl der Elemente
    // using ist der externe Name, generator der interne
    // () -> Int ist der Typ von generator: eine Funktion ohne Parameter, die einen Int zurückgibt
    // makeArray gibt ein Int-Array zurück
    func makeArray(size: Int, using generator: () -> Int) -> [Int] {
        var numbers = [Int]()
        
        for _ in 0..<size {
            // Ruft die übergebene Funktion auf, die eine neue Zahl erzeugt
            let newNumber = generator()
            numbers.append(newNumber)
        }
        
        return numbers
    }
    
    // Aufruf mit Trailing Closure, das using: fällt weg
    let rolls = makeArray(size: 50) {
        Int.random(in: 1...20)
    }
    
    print(rolls)
    
    // Alternativ kann man die Funktion vorher erstellen und dann übergeben
    func generateNumber() -> Int {
        Int.random(in: 1...20)
    }
    
    let newRolls = makeArray(size: 50, using: generateNumber)
    print(newRolls)
    
    // Diese Syntax ist in Swift wichtig und kommt oft vor, z. B. bei Buttons in SwiftUI, daher gut einprägen
    
    
    // Weiteres Beispiel: Eine Funktion, die drei verschiedene Funktionen entgegennimmt
    
    func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
        print("Erste Funktion!")
        first()
        print("Zweite Funktion!")
        second()
        print("Dritte Funktion!")
        third()
        print("Fertig")
    }
    
    // Funktionsaufruf mit drei Trailing Closures für first, second und third
    // Beim ersten Closure fällt das Label first: weg, die anderen schreibt man mit Label dahinter
    doImportantWork {
        print("Ich bin die erste Funktion!")
    } second: {
        print("Ich bin die zweite Funktion!")
    } third: {
        print("Ich bin die dritte Funktion!")
    }
}
