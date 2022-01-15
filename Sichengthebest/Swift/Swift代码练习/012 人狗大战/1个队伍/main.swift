class Animals {
    init(name : String) {
        self.name = name
    }
    var name : String 
    var ap = Int.random(in: 300 ... 450)
    var hp = Int.random(in: 50 ... 100)
    var power = Int.random(in: 10 ... 20)
    var ifRip = false
    
    func attack() -> Int {
        if ap > power {
            ap -= power
            return power
        }else if 0 < ap && ap < power {
            var ap01 = ap
            ap = 0
            return ap01
        }else {
            return 0
        }
    }
    
    func wasAttacked(by : Int) -> Bool {
        if hp - by > 0 {
            hp -= by
            return true
        } else {
            hp = 0
            ifRip = true
            return false
        }
    }
}

func randomOtherElement(otherPlayer: Animals, team: [Animals], name: String) -> Animals {
    var otherNames = team
    for i in 0...otherNames.count-1 {
        if team[i].name == otherPlayer.name {
            otherNames.remove(at: i)
        }
    }
    return otherNames.randomElement()!
}

func war(team:[Animals]) -> [Animals] {
    var deadPeople: [Animals] = []
    var teamm = team
    while teamm.count > 1 {
        var a = teamm.randomElement()!
        var aa = teamm.randomElement()!
        if a.name == aa.name && teamm.count > 1 {
            a = randomOtherElement(otherPlayer: aa, team: teamm, name: a.name)
        }
        a.wasAttacked(by: aa.attack() ?? 0)
        show("\(a.name) has suffered a terrible blow from his/her enemy, \(aa.name)! \(a.name) has lost \(aa.attack())hp! \(a.name) now only has \(a.hp)hp! Is \(a.name) dead? Totally \(a.ifRip)!")
        for i in 0...teamm.count-1 {
            if teamm[i].ifRip == true {
                deadPeople.append(teamm[i])
                show("someone died")
                show(teamm[i].name)
                teamm.remove(at: i)
                break
            }
        }
    }
    show("\(teamm[0].name) is the SURVIVOR!!!")
    for i in 0 ... deadPeople.count - 1 {
        teamm.append(deadPeople[deadPeople.count - 1 - i])
    }
    return teamm
}

var Team = [Animals(name: "Noah"), Animals(name: "Angie"), Animals(name: "Parker"), Animals(name: "Sunny"), Animals(name: "Sicheng")]
for i in Team {
    show("\(i.name): \(i.hp)hp, \(i.ap)ap, \(i.power) power.")
}
var final = war(team: Team)
var names = ["st","nd","rd","th","th"]
for i in 0 ... final.count - 1 {
    show("The \(i + 1)\(names[i]) place is \(final[i].name)!!!")
}
