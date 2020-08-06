class animal {
    init(name:String){
        self.name = name
    }
    var name : String 
    var ap = Int.random(in: 200 ... 800)
    var hp = Int.random(in: 10 ... 50)
    var power = Int.random(in: 10 ... 30)
    var death = false
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
    func beenAttack(_ p:Int) -> Int {
        if hp - p <= 0 {
            death = true
            return 0
        } else {
            hp -= p
            return hp
        }
    }
}


func war(_ team:[animal]) -> [animal]{
    var notRip = team
    var result : [animal] = []
    while notRip.count >= 2{
        var i = Int.random(in: 0 ... notRip.count-1)
        var j = Int.random(in: 0 ... notRip.count-1)
        while j == i {
            j = Int.random(in: 0 ... notRip.count-1)
        }
        show("\(i+1) -> \(j+1)")
        show("\(notRip[i].name) attack \(notRip[j].name). \(notRip[j].name) hp:\(notRip[j].beenAttack(notRip[i].attack())) \(notRip[i].name) ap:\(notRip[i].ap) ")
        if notRip[j].death == true {
            result.append(notRip[j])
            notRip.remove(at: j)
        }
    }
    result.append(notRip[0])
    return result
}


var team = [animal(name : "Noah"), animal(name : "Sicheng"), animal(name : "Sunny")]
for i in team {
    show("\(i.name) ap: \(i.ap) hp: \(i.hp) power: \(i.power) ifRip: \(i.death)")
}
var final = war(team)
for i in 0 ... final.count - 1 {
    show("第\(team.count-i)名是\(final[i].name)")
}
