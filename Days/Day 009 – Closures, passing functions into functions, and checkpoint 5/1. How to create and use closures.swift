import Playgrounds

// Day 9 – Closures, passing functions into functions, and checkpoint 5
// https://www.hackingwithswift.com/100/swiftui/9

#Playground {
    // How to create and use closures
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-closures
    
    // Ein Closure ist ein namenloser Codeblock, den man wie eine Funktion aufrufen, aber auch in einer Variable speichern oder an andere Funktionen übergeben kann
    // In C# entspricht das ungefähr einem Lambda
    
    // Beispiel
    
    func greetUser() {
        print("Hi there!")
    }
    
    greetUser()
    
    // Eine Funktion kopieren
    // Hierbei lässt man die runden Klammern weg
    // Mit () würde man greetUser aufrufen, ohne () speichert man die Funktion selbst in greetCopy
    var greetCopy = greetUser
    
    greetCopy()
    
    
    // Weiteres Beispiel
    
    // Das ist in Swift ein Closure (auf Deutsch sagt man meistens auch einfach Closure)
    // Es ist eine Art Codeblock, den man weitergeben und aufrufen kann, wann man will
    // Dieser Closure hat keine Parameter und keinen Rückgabewert
    let sayHello = {
        print("Howdy")
    }
    
    sayHello()
    
    
    // Weiteres Beispiel: Closure mit Parameter
    
    // Bei einem Closure stehen Parameter und Rückgabetyp innerhalb der { }
    // Das Schlüsselwort in trennt sie vom Body: Davor stehen Parameter und Rückgabetyp, danach kommt der Code
    // Bei einer Funktion steht das alles vor der {, deshalb braucht sie kein in
    // Wie bei Funktionen kann man return weglassen, weil der Body nur aus einem Ausdruck besteht
    // In C# würde man ungefähr (string name) => $"Hi {name}" schreiben
    let sayHello2 = { (name: String) -> String in
        "Hi \(name)"
    }
    
    // Beim Aufruf schreibt man kein Label, also nicht sayHello2(name: "Finn")
    sayHello2("Finn")
    
    
    // Weitere Erklärung zu Funktionen ohne Parameter
    
    // () -> Void ist der Typ von greetUser, damit sagen wir Swift, was in greetCopy2 gespeichert wird
    // Leere Klammern: Die Funktion hat keine Parameter
    // -> Void: Die Funktion gibt nichts zurück
    // Void heißt kein Rückgabewert, wie void in C# (dort wäre der ganze Typ ein Action)
    var greetCopy2: () -> Void = greetUser
    
    
    // Weiteres Beispiel
    
    // for ist der externe Name, id der interne, String der Rückgabetyp
    func getUserData(for id: Int) -> String {
        if id == 1989 {
            return "Taylor Swift"
        } else {
            return "Anonymous"
        }
    }

    let data: (Int) -> String = getUserData
    // Im Typ (Int) -> String stehen keine Parameternamen, auch das for fällt weg
    // Rein geht ein Int, zurück kommt ein String, in C# wäre das ein Func<int, string>
    // Deshalb ruft man data(1989) ohne Label auf, data(for: 1989) würde nicht funktionieren
    let user = data(1989)
    print(user)
    
    
    let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
    let sortedTeam = team.sorted()
    print(sortedTeam)
    
    
    // Um das Ganze besser zu verstehen, kann man bspw. sorted(by:) nehmen und dafür sorgen, dass der Captain vorne steht
    // sorted(by:) nimmt eine Funktion entgegen, die immer zwei Namen vergleicht
    // Gibt sie true zurück, kommt name1 vor name2
    
    func canptainFirstSorted(name1: String, name2: String) -> Bool {
        if name1 == "Suzanne" {
            return true
        } else if name2 == "Suzanne"{
            return false
        }
        
        return name1 < name2
    }
    
    // Man übergibt nur den Funktionsnamen ohne (), wie oben bei greetCopy
    // Suzanne steht jetzt vorne
    let captainFirstTeam = team.sorted(by: canptainFirstSorted)
    print(captainFirstTeam)
    
    // Man kann einer Funktion also eine andere Funktion übergeben und so ihr Verhalten anpassen
    
    
    // sorted(by:) direkt mit einem Closure nutzen
    // So braucht man keine extra Funktion, der Code steht direkt im Aufruf
    
    let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
        if name1 == "Suzanne" {
            return true
        } else if name2 == "Suzanne" {
            return false
        }

        return name1 < name2
    })
    
    print(captainFirstTeam2)
    
}
