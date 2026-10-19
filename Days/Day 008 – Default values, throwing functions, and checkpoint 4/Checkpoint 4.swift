import Playgrounds

// Day 8 – Default values, throwing functions, and checkpoint 4
// https://www.hackingwithswift.com/100/swiftui/8

#Playground {
    // Checkpoint 4
    // https://www.hackingwithswift.com/quick-start/beginners/checkpoint-4
    
    /*
     Aufgabe
     
     Schreibe eine Funktion, die ganze Zahlen von 1 bis 10.000 entgegennimmt und ihre Wurzel zurückgibt
     
     Die eingebaute Funktion sqrt() darf nicht verwendet werden
     
     Liegt die Zahl außerhalb von 1 bis 10.000, soll der Fehler "out of bounds" geworfen werden
     
     Nur ganzzahlige Wurzeln zählen, also keine Kommazahlen (die Wurzel aus 3 wäre z. B. etwa 1,732)
     
     Findet man keine ganzzahlige Wurzel, soll der Fehler "no root" geworfen werden
     */
    
    
    // Meine Lösung
    
    enum WurzelError: Error {
        case outOfBounds, noRoot
    }
    
    func gibWurzel(_ zahl: Int) throws -> Int {
        // Außerhalb des Wertebereichs
        if zahl < 1 || zahl > 10_000 {
            throw WurzelError.outOfBounds
        }
        
        // Schleife, die die Wurzel sucht
        // 1 bis 100 reicht, weil 100 * 100 = 10.000 der größte erlaubte Wert ist
        for i in 1...100 {
            if i * i == zahl {
                return i
            }
        }
        
        // Keine passende ganzzahlige Wurzel gefunden
        throw WurzelError.noRoot
    }
    
    // Beispiele zum Testen
    
    // Diese Zahlen haben eine ganzzahlige Wurzel und sollten funktionieren
    let validZahlen = [9, 25, 10_000]
    
    for zahl in validZahlen {
        do {
            let wurzel = try gibWurzel(zahl)
            print(wurzel)
        } catch WurzelError.outOfBounds {
            print("Zahl außerhalb des Wertebereiches (1 bis 10.000)")
        } catch WurzelError.noRoot {
            print("Zahl hat keine ganzzahlige Wurzel")
        } catch {
            print("Es ist ein Fehler aufgetreten")
        }
    }
    
    
    // Diese Zahlen haben keine ganzzahlige Wurzel (Fehler noRoot)
    let invalidZahlen = [3, 9_090]
    
    for zahl in invalidZahlen {
        do {
            let wurzel = try gibWurzel(zahl)
            print(wurzel)
        } catch WurzelError.outOfBounds {
            print("Zahl außerhalb des Wertebereiches (1 bis 10.000)")
        } catch WurzelError.noRoot {
            print("Zahl hat keine ganzzahlige Wurzel")
        } catch {
            print("Es ist ein Fehler aufgetreten")
        }
    }

    
    // Diese Zahlen liegen außerhalb des Wertebereichs (Fehler outOfBounds)
    let outOfBoundsZahlen = [0, 10_001, -2]
    
    for zahl in outOfBoundsZahlen {
        do {
            let wurzel = try gibWurzel(zahl)
            print(wurzel)
        } catch WurzelError.outOfBounds {
            print("Zahl außerhalb des Wertebereiches (1 bis 10.000)")
        } catch WurzelError.noRoot {
            print("Zahl hat keine ganzzahlige Wurzel")
        } catch {
            print("Es ist ein Fehler aufgetreten")
        }
    }
    
}
