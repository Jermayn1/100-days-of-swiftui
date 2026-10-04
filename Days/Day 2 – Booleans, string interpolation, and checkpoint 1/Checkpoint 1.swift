import Playgrounds

// Day 2 – Booleans, string interpolation, and checkpoint 1
// https://www.hackingwithswift.com/100/swiftui/2

// Checkpoint 1
// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-1
// Erste kleine Prüfung: Ein Programm, das die Temperatur von Celsius in Fahrenheit umrechnet.

#Playground {    
    // 1. Create a constant holding any temperature in Celsius.
    // Sowohl Int als auch Double funktionieren hier (Double verhindert Datenverlust bei Kommastellen)
    let celsius = 21

    // 2. Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
    let fahrenheit = celsius * 9 / 5 + 32
    
    // 3. Prints the result for the user, showing both the Celsius and Fahrenheit values.
    print("\(celsius)°C sind \(fahrenheit)°F")
}
