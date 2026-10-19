import Playgrounds

// Day 8 – Default values, throwing functions, and checkpoint 4
// https://www.hackingwithswift.com/100/swiftui/8

#Playground {
    // How to handle errors in functions
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-errors-in-functions
    
    // So behandelt man Fehler in Swift
    // 1. Mögliche Fehler festlegen, damit Swift sie kennt
    // 2. Eine Funktion schreiben, die diese Fehler werfen kann
    // 3. Die Funktion aufrufen und auftretende Fehler behandeln
    
    
    // Beispiel
    
    // Error ist in Swift ein Protokoll, ähnlich wie ein Interface in C#
    // Durch : Error wird das Enum zu einem Fehlertyp, den man werfen kann
    enum PasswordError: Error {
        case short, obvious
    }
    
    // throws steht vor dem Rückgabetyp, wenn die Funktion Fehler werfen kann, sie aber nicht selbst behandelt
    // throws legt nicht fest, welche Fehler kommen können
    // Es sagt nur aus, dass die Funktion Fehler werfen kann, aber nicht muss
    // Läuft alles glatt, gibt die Funktion ganz normal mit return einen Wert zurück
    func checkPassword(_ password: String) throws -> String {
        // Schwaches Passwort unter 5 Zeichen
        if password.count < 5 {
            throw PasswordError.short
        }
        
        // Zu offensichtliches Passwort
        if password == "12345" {
            throw PasswordError.obvious
        }
        
        if password.count < 8 {
            return "OK"
        } else if password.count < 10 {
            return "Gutes Passwort"
        } else {
            return "Sehr gutes Passwort"
        }
        
    }
    
    
    // Fehler mit do/catch behandeln
    
    /*
     Pseudocode-Beispiel
     
     do {
         try someRiskyWork()
     } catch {
         print("Handle errors here")
     }
     
     Im Prinzip wie try/catch bei Exceptions in anderen Sprachen
     In Swift heißen sie aber Errors und nicht Exceptions
     Unterschiede zu C#: throws muss in der Signatur stehen und vor jedem Aufruf steht try
     Außerdem ist ein throw in Swift ungefähr so schnell wie ein return
     */
    
    // Beispiel
    
    let string = "12345"
    
    // Mit do beginnt ein Block, in dem Fehler auftreten können
    do {
        // Mit try ruft man eine Funktion auf, die einen Fehler werfen kann
        let result = try checkPassword(string)
        print("Password rating: \(result)")
    } catch {
        // Im catch-Block fängt man Fehler ab und behandelt sie
        // Hier landen alle Fehler im selben catch-Block
        // Sobald im do-Block ein Fehler geworfen wird, überspringt Swift den Rest vom do-Block und macht direkt hier weiter
        print("There was an error.")
    }
    
    // Mit try! braucht man kein do/catch
    // Man verspricht Swift damit, dass hier kein Fehler kommt, obwohl die Funktion einen werfen könnte
    // Kommt doch ein Fehler, stürzt das Programm ab
    // try! deshalb nur nutzen, wenn man sicher ist, dass kein Fehler kommt
    let validString = "SuperSicheresPasswort123!"
    let result = try! checkPassword(validString)
    print(result)
    
    
    // Einzelne Fehler gezielt mit eigenen catch-Blöcken behandeln
    
    do {
        let result = try checkPassword("12345")
        print("Password rating: \(result)")
    } catch PasswordError.short {
        // Hier landet man, wenn checkPassword PasswordError.short wirft
        print("Bitte verwende ein längeres Passwort")
    } catch PasswordError.obvious {
        // Genauso hier für PasswordError.obvious, also ein zu offensichtliches Passwort
        print("Bitte verwende ein stärkeres Passwort")
    } catch {
        // catch ohne bestimmten Fehler fängt alle übrigen Fehler ab, ähnlich wie default bei switch
        // In einer normalen Funktion verlangt Swift diesen Block, weil throws nicht festlegt, welche Fehler kommen können
        // Direkt im #Playground ginge es auch ohne, weil der Playground Fehler selbst weiterwerfen darf
        // Den geworfenen Fehler gibt es im Block automatisch als error
        // localizedDescription kommt aus Foundation und liefert eine Beschreibung des Fehlers
        // Die kann man anzeigen oder ins Log schreiben, bei eigenen Enums ist sie aber eher nichtssagend
        print("Ein Fehler ist aufgetreten: \(error.localizedDescription)")
    }
    
}
