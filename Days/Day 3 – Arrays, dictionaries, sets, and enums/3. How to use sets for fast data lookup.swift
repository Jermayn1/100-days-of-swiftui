import Playgrounds

// Day 3 – Arrays, dictionaries, sets, and enums
// https://www.hackingwithswift.com/100/swiftui/3

#Playground {
    // How to use sets for fast data lookup
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-use-sets-for-fast-data-lookup
    
    // Sets sind die 3. Methode (neben Arrays und Dictionaries), um in Swift Daten zu sammeln.
    // Sets erlauben keine doppelten Elemente.
    
    // So erstellt man ein Set (aus einem Array, aus dem doppelte Werte automatisch entfernt werden)
    // Die Reihenfolge der Elemente ist dabei nicht festgelegt
    let actors = Set([
        "Denzel Washington",
        "Tom Cruise",
        "Nicolas Cage",
        "Samuel L Jackson"
    ])
    
    print(actors)
    
    // Um weitere Werte hinzuzufügen, nutzt man nicht .append(), sondern .insert()
    // Da ein Set keine feste Reihenfolge hat, macht .append() ("hinten anhängen") logisch keinen Sinn
    var breeds = Set<String>()
    breeds.insert("Husky")
    breeds.insert("Golden Retriever")
    breeds.insert("German Shepherd")
    breeds.insert("Husky") // Doppelt!
    
    // Man sieht hier, dass die Reihenfolge nicht der entspricht, wie sie eingefügt wurde
    // Sie kann bei jedem Ausführen anders sein. Sets speichern Werte ungeordnet über Hashing, wodurch das Suchen mit der .contains() Methode extrem schnell ist ist Swift
    print(breeds)
    
    print(breeds.contains("Husky")) // true
    
}
