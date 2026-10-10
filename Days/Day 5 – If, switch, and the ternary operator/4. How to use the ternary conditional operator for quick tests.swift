import Playgrounds

// Day 5 – If, switch, and the ternary operator
// https://www.hackingwithswift.com/100/swiftui

#Playground {
    // How to use the ternary conditional operator for quick tests
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-use-the-ternary-conditional-operator-for-quick-tests
    
    
    // Beispiel
    
    let age = 18
    // What? = age >= 18 (unsere Condition=
    // True "Yes"
    // False "No"
    // WTF
    let canVote = age >= 18 ? "Yes" : "No"
    
    // Weiteres Beispiel
    
    let hour = 23
    print(hour < 12 ? "It's before noon" : "It's after noon")
    
    // Weiteres Beispiel
    
    let names = ["Jayne", "Kaylee", "Mal"]
    let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
    print(crewCount)
    
    // Weiteres Beispiel
    
    enum Theme {
        case light, dark
    }
    
    let theme = Theme.dark
    
    let background = theme == .dark ? "dark" : "white"
    print(background)
        
}
