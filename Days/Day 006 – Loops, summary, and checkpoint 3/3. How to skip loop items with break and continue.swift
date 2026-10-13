import Playgrounds

// Day 6 – Loops, summary, and checkpoint 3
// https://www.hackingwithswift.com/100/swiftui/6

#Playground {
    // How to skip loop items with break and continue
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-skip-loop-items-with-break-and-continue
    
    // continue und break funktionieren wie in anderen Programmiersprachen wie C#
    
    // Beispiel für continue
    
    let filenames = ["me.jpg", "work.txt", "husky.jpg"]
    
    for filename in filenames {
        if !filename.hasSuffix(".jpg") {
            continue
        }
        
        print("Bild: \(filename)")
    }
    
    // Beispiel für break
    
    let number1 = 4
    let number2 = 14
    var multiples = [Int]()
    
    for i in 1...100_000 {
        if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
            multiples.append(i)
            
            if multiples.count == 10 {
                break
            }
        }
    }
    
    print(multiples)
    
}
