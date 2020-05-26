class animal {
    var hp = Int.random(in: 100...120)
    var attackPower = Int.random(in: 5...15)
    var name = ""
}
extension animal : Equatable {
    static func == (lhs: animal, rhs: animal) -> Bool {
        return lhs.name == rhs.name && lhs.hp == rhs.hp && lhs.attackPower == rhs.attackPower
    }
}

class Human : animal {
    init(_ name : String) {
        super.init()
        self.name = name
    }
}

class Dog : animal {
    init(_ name : String) {
        super.init()
        self.name = name
    }
}

var humans = [Human("SichengTheLearningSpikes"),Human("ParkerTheSpeedy"),Human("hdcolaTheExperienced")]
var dogs = [Dog("DonaldTrump"),Dog("Covvvviiiidddd_19"),Dog("NoBrainPup")]

for i in humans { 
    show("\(i.name)\nhp: \(i.hp)\nattackPower: \(i.attackPower)")
}

for i in dogs {
    show("\(i.name)\nhp: \(i.hp)\nattackPower: \(i.attackPower)")
}

while dogs.count > 0 && humans.count > 0 {
    let humanFighter = humans.randomElement()!
    let dogFighter = dogs.randomElement()!
    show("\(humanFighter.name): \(humanFighter.hp)hp VS \(dogFighter.name): \(dogFighter.hp)hp!")
    dogFighter.hp -= humanFighter.attackPower
    humanFighter.hp -= dogFighter.attackPower
    show("\(dogFighter.name) lost \(humanFighter.attackPower)hp! He now has \(dogFighter.hp)hp.\n\(humanFighter.name) lost \(dogFighter.attackPower)hp! He now has \(humanFighter.hp)hp.")
    if dogFighter.hp < 1 {
        if let i = dogs.firstIndex(of: dogFighter) {
            dogs.remove(at: i)
        }
        show(dogFighter.name + " is dead!")
    }
    if humanFighter.hp < 1 {
        if let i = humans.firstIndex(of: humanFighter) {
            humans.remove(at: i)
        }
        show(humanFighter.name + " is dead!")
    }
}
if dogs.count == 0 {
    show("The humans win!")
} else if humans.count == 0 {
    show("The dogs win!")
} else {
    show("It's a tie!!!")
}
