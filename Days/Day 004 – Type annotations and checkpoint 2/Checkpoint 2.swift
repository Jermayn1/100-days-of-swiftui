import Playgrounds

// Day 4 – Type annotations and checkpoint 2
// https://www.hackingwithswift.com/100/swiftui/4

#Playground {
    // Checkpoint 2
    // https://www.hackingwithswift.com/quick-start/beginners/checkpoint-2
    
    // Array erstellen und Werte hinzufügen
    var breeds = ["Husky", "Golden Retriever", "Labrador"]
    breeds.append("German Shepherd")
    // Zum Überprüfen der einzigartigen Elemente
    breeds.append("Husky")
    
    // Anzahl der Elemente im Array ausgeben
    print(breeds.count) // 5
    
    // Anzahl Einzigartige Items
    // In einem Set können keine Duplikate vorkommen
    let breedsSet = Set(breeds)
    print(breedsSet.count) // 4, weil Husky nicht doppelt gezählt wird
    
}
