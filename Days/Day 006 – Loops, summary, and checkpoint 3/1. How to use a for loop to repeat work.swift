import Playgrounds

// Day 6 – Loops, summary, and checkpoint 3
// https://www.hackingwithswift.com/100/swiftui/6

#Playground {
    // How to use a for loop to repeat work
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-use-a-for-loop-to-repeat-work
    
    // Beispiel
    
    let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
    
    // Foreach Schleife wie in anderen Programmiersprachen
    // bzw. Swift hat streng genommen keine richtige Foreachschleife sondern nennt sie for-in. Im Prinzip aber ähnlich wie die Foreach in anderen Sprachen
    // Swift ist dabei schlau und würde platform als Loop Variable vorschlagen, da platforms im Plural ist
    for os in platforms {
        // 4 Loop Iteration, 4 Werte in der Array
        // Loop Body
        print("Swift works great on \(os)")
    }
    
    // Weiteres Beispiel
    
    // 1...12 ist eine fixed Range von Zahlen
    for i in 1...12 {
        print("5 x \(i) is \(5 * i)")
    }
    
    // Weiteres Beispiel
    
    // Nested Loops bzw. verschachtelte Schleifen
    for i in 1...12 {
        print("The \(i) times table")
        
        for j in 1...12 {
            print("   \(j) * \(i) is \(i * j)")
        }
        
        // Leeren Print als Zeilenumbruch
        print()
    }
    
    // Weiteres Beispiel
    
    for i in 1...5 {
        print("Von 1 bis 5 (einschließlich der 5) zählen: \(i)")
    }
    
    
    // Das wird nützlich bei Arrays
    // dort zählen von 0 bis < array.count
    for i in 1..<5 {
        print("Von 1 bis zu 5 (5 nicht inbegriffen) zählen: \(i)")
    }
    
    // Weiteres Beispiel
    
    var lyric = "Haters gonna"
    
    // _ wenn man keine Loop Variable braucht
    for _ in 1...5 {
        lyric += " hate"
    }
    
    print(lyric)

}
