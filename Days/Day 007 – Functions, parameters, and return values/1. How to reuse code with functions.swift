import Playgrounds

// Day 7 – Functions, parameters, and return values
// https://www.hackingwithswift.com/100/swiftui/7

#Playground {
    // How to reuse code with functions
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-reuse-code-with-functions
    
    // Funktionen, wie man sie auch aus anderen Sprachen kennt
    // Eine Methode ist in Swift eine Funktion, die zu einem Typ gehört (z. B. hasPrefix() bei String)
    
    // Beispiel
    
    // Funktion erstellen
    // func leitet die Funktion ein
    // showWelcome ist der Funktionsname
    // In den () kann man Parameter angeben
    // In den { } steht der Body der Funktion
    func showWelcome() {
        print("Welcome to my app!")
        print("By default This prints out a conversion")
        print("chart from centimeters to inches, but you")
        print("can also set a custom range if you want.")
    }
    
    // Funktion aufrufen
    showWelcome()
    
    // Weiteres Beispiel
    
    // number und end sind die Parameter der Funktion
    func printTimeTables(number: Int, end: Int) {
        for i in 1...end {
            print("\(i) * \(number) is \(i * number)")
        }
    }
    
    // Die Werte beim Aufruf (hier 5 und 20) nennt man Argumente
    // number: ZAHL ist Voraussetzung, es reicht nicht aus, einfach nur eine Zahl zu übergeben. Der Parametername muss so angegeben werden, wie er in der Funktion definiert ist
    // printTimeTables(5, 20) würde einen Fehler geben
    // Man muss die Argumente auch immer in derselben Reihenfolge wie in der Funktion übergeben. Hier also erst number und dann end
    printTimeTables(number: 5, end: 20)

}
