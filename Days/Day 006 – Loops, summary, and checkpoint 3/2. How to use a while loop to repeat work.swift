import Playgrounds

// Day 6 – Loops, summary, and checkpoint 3
// https://www.hackingwithswift.com/100/swiftui/6

#Playground {
    // How to use a while loop to repeat work
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-use-a-while-loop-to-repeat-work
    
    // Ähnlich wie in anderen Sprachen wie C#, Python etc.
    
    // Beispiel
    
    var countdown = 10
    
    while countdown > 0 {
        print("\(countdown)...")
        countdown -= 1
    }
    
    print("Los!")
    
    // Weiteres Beispiel
    
    // NEU: Zufallszahlen
    // Randomzahl in der Range von 1 bis 1000
    let id = Int.random(in: 1...1000)
    // Randomzahl Kommazahl zwischen 0 bis 1
    let amount = Double.random(in: 0...1)
    
    var roll = 0
    
    while roll != 20 {
        roll = Int.random(in: 1...20)
        print("Gewürfelt: \(roll)")
    }
    
    print("Critical Hit!")
    
}
