import Playgrounds

// Day 6 – Loops, summary, and checkpoint 3
// https://www.hackingwithswift.com/100/swiftui/6

#Playground {
    // Checkpoint 3
    // https://www.hackingwithswift.com/quick-start/beginners/checkpoint-3
    
    // FizzBuzz Problem

    // 1. Mit einer Schleife von 1 bis 100 durch iterieren
    for i in 1...100 {
        if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
            print("FizzBuzz")
        } else if i.isMultiple(of: 3) {
            print("Fizz")
        } else if i.isMultiple(of: 5) {
            print("Buzz")
        } else {
            print(i)
        }
    }
}
