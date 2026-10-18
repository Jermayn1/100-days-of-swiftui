import Playgrounds

// Day 7 – Functions, parameters, and return values
// https://www.hackingwithswift.com/100/swiftui/7

#Playground {
    // How to return multiple values from functions
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-return-multiple-values-from-functions

    // Beispiel: Einen Wert aus einer Funktion zurückgeben
    
    func isUppercase(string: String) -> Bool {
        string == string.uppercased()
    }
    
    
    // Beispiel: Mehrere Werte aus einer Funktion mit einem Array zurückgeben
    
    // Das Beispiel würde technisch funktionieren, es ist aber nicht optimal, da man nicht weiß, was an Index 0 und 1 steht
    // Bei einem falschen Index, z. B. user[2], stürzt das Programm ab
    func getUser() -> [String] {
        ["Taylor", "Swift"]
    }

    let user = getUser()
    print("Name: \(user[0]) \(user[1])")
    
    // Alternativ ein Dictionary returnen
    // Auch nicht optimal, aber besser, weil die Werte jetzt einen Namen haben
    
    func getUser2() -> [String: String] {
        [
            "firstName": "Taylor",
            "lastName": "Swift"
        ]
    }

    let user2 = getUser2()
    print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")
    
    
    // Am besten sind Tupel, ähnlich wie in C#
    // Hier weiß Swift genau, was zurückkommt: Im Rückgabetyp steht, welche Werte es gibt und welchen Typ sie haben
    // Bei einem Dictionary weiß Swift nicht, ob ein Key wirklich existiert, man braucht dort also einen default-Wert
    // Deshalb sind Tupel sauberer als Dictionaries
    
    func getUser3() -> (firstName: String, lastName: String) {
        (firstName: "Finn", lastName: "der Husky")
        // Würde auch gehen, weil die Namen schon im Rückgabetyp stehen:
        // ("Finn", "der Husky")
    }
    
    let user3 = getUser3()
    print("Name: \(user3.firstName) \(user3.lastName)")
    
    // Beispiel, wenn die Elemente im Tupel keinen Namen haben
    
    func getUser4() -> (String, String) {
        ("Finno", "der Husky")
    }
    let user4 = getUser4()
    
    // Jetzt greift man über die Position mit .0 und .1 zu
    print("Name \(user4.0) \(user4.1)")
    
    
    // Werte einzeln aus dem Tupel holen und in eigene Konstanten speichern
    let firstName = user3.firstName
    let lastName = user3.lastName
    
    print("Name: \(firstName) \(lastName)")
    
    // Kürzer mit Destructuring: Das Tupel wird in einer Zeile auf zwei Konstanten aufgeteilt
    let (firstName2, lastName2) = getUser3()
    
    // Braucht man nur einen Wert, ignoriert man den anderen mit _
    let (firstName3, _) = getUser3()
    print("Vorname: \(firstName3)")
    
}
