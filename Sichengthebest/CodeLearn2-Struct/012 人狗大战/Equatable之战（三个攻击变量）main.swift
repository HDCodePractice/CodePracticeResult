class animal {
    var hp = Int.random(in: 100...120)
    var attackPower : [attack] = []
    var name = ""
}
extension animal : Equatable {
    static func == (lhs: animal, rhs: animal) -> Bool {
        return lhs.name == rhs.name && lhs.hp == rhs.hp
    }
}

struct attack {
    var name : String
    var power : Int
}

class Human : animal {
    init(_ name : String) {
        super.init()
        self.name = name
        self.attackPower.append(attack(name: "打", power: Int.random(in: 3...10)))
        self.attackPower.append(attack(name: "踹", power: Int.random(in: 7...16)))
        self.attackPower.append(attack(name: "棍", power: Int.random(in: 8...19)))
    }
}

class Dog : animal {
    init(_ name : String) {
        super.init()
        self.name = name
        self.attackPower.append(attack(name: "咬", power: Int.random(in: 5...18)))
        self.attackPower.append(attack(name: "扑", power: Int.random(in: 2...16)))
        self.attackPower.append(attack(name: "撞", power: Int.random(in: 4...27)))
    }
}

var humans = [Human("SichengTheLearningSpikes"),Human("NoahAKASnipeNoob"),Human("hdcola")]
var dogs = [Dog("DonaldTrump"),Dog("Corona"),Dog("Fido")]

for i in humans { 
    show("\(i.name)\nhp: \(i.hp)\n打: \(i.attackPower[0].power)\n踹: \(i.attackPower[1].power)\n棍: \(i.attackPower[2].power)")
}

for i in dogs {
    show("\(i.name)\nhp: \(i.hp)\n咬: \(i.attackPower[0].power)\n扑: \(i.attackPower[1].power)\n撞: \(i.attackPower[2].power)")
}

while dogs.count > 0 && humans.count > 0 {
    var humanFighter = humans.randomElement()!
    var dogFighter = dogs.randomElement()!
    let dogPower = dogFighter.attackPower.randomElement()!.power
    let humanPower = humanFighter.attackPower.randomElement()!.power
    show("\(humanFighter.name): \(humanFighter.hp)hp VS \(dogFighter.name): \(dogFighter.hp)hp!")
    
    humanFighter.hp -= dogPower
    if humanFighter.hp < 1 {
        if let i = humans.firstIndex(of: humanFighter) {
            humans.remove(at: i)
        }
        show(humanFighter.name + " is killed by \(dogFighter.name)!")
    } else {
        if dogFighter.hp < 1 {
            if let i = dogs.firstIndex(of: dogFighter) {
                dogs.remove(at: i)
            }
            show(dogFighter.name + " is killed by \(humanFighter.name)!")
        }
        dogFighter.hp -= humanPower
    }
    show("\(dogFighter.name) has lost \(humanPower)hp! He now has \(dogFighter.hp)hp.\n\(humanFighter.name) lost \(dogPower)hp! He now has \(humanFighter.hp)hp.")
}

if dogs.count == 0 {
    show("The humans still control the entire planet!")
} else if humans.count == 0 {
    show("The dogs now control the entire planet!")
} else {
    show("There is a bug, hidden in the woods!!!")
}

for i in dogs {
    show("\(i.name): \(i.hp)hp left.")
}

for i in humans {
    show("\(i.name): \(i.hp)hp left.")
}
