import Playgrounds

// Day 5 – If, switch, and the ternary operator
// https://www.hackingwithswift.com/100/swiftui

#Playground {
    // How to use switch statements to check multiple conditions
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-use-switch-statements-to-check-multiple-conditions
    
    
    // Anders als in C# und co gibt es kein break
    // Swift stoppt nach jedem Case automatisch
    // Switch Statements sind "Exhaustive", es müssen alle möglichen Fälle berücksichtigt werden
    // default ist wie in jeder anderen Sprache gleich
    // es gibt Fallthrough siehe Beispiel
    // Eignen sich perfekt für Enums
    
    enum Weather {
        case sun, rain, wind, snow, unknown
    }
    
    let forecast = Weather.sun
    
    // Vergleich mit if, else if und else
    if forecast == .sun {
        print("It should be a nice day.")
    } else if forecast == .rain {
        print("Pack an umbrella.")
    } else if forecast == .wind {
        print("Wear something warm")
    } else {
        print("Our forecast generator is broken!")
    }
    
    // Mit Switch case
    // Kein break wie in älteren Sprachen
    // Swift nimmt nur die Optionen die Eintreffen
    switch forecast {
    case .sun:
        print("Sonnig")
    case .rain:
        print("Regen")
    case .wind:
        print("Windig")
    case .snow:
        print("Schnee")
    case .unknown:
        print("Nicht bekannt")
    }
    
    // Weiteres Beispiel
    
    let place = "Metropolis"

    // Default ist wie in jeder anderen Sprache gleich
    switch place {
    case "Gotham":
        print("You're Batman!")
    case "Mega-City One":
        print("You're Judge Dredd!")
    case "Wakanda":
        print("You're Black Panther!")
    default:
        print("Who are you?")
    }
    
    // Weiteres Beispiel
    
    // Fallthrough geht auch nach unten in den nächsten Case, wie als würde man es bei bspw. C# kennen, wenn man keine breaks gesetzt hat
    
    let day = 5
    print("My true love gave to me…")

    switch day {
    case 5:
        print("5 golden rings")
        fallthrough
    case 4:
        print("4 calling birds")
        fallthrough
    case 3:
        print("3 French hens")
        fallthrough
    case 2:
        print("2 turtle doves")
        fallthrough
    default:
        print("A partridge in a pear tree")
    }
}
