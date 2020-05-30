class animal {
    var hp = Int.random(in: 100...120)
    var attackPower = [0,0,0]
    init() {
        for i in 0...2 {
            attackPower[i] += Int.random(in: 5...15)
        }
    }
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
        self.attackPower[2] += Int.random(in: -4...5)
    }
}

class Dog : animal {
    init(_ name : String) {
        super.init()
        self.name = name
    }
}

var humans = [Human("SichengTheLearningSpikes"),Human("NoahAKASnipeNoob"),Human("hdcola")]
var dogs = [Dog("DonaldTrump"),Dog("Corona"),Dog("Fido")]

for i in humans { 
    show("\(i.name)\nhp: \(i.hp)\n打: \(i.attackPower[0])\n踹: \(i.attackPower[1])\n棍: \(i.attackPower[2])")
}

for i in dogs {
    show("\(i.name)\nhp: \(i.hp)\n咬: \(i.attackPower[0])\n扑: \(i.attackPower[1])\n撞: \(i.attackPower[2])")
}

while dogs.count > 0 && humans.count > 0 {
    var humanFighter = humans.randomElement()!
    var dogFighter = dogs.randomElement()!
    let dogPower = dogFighter.attackPower.randomElement()!
    let humanPower = humanFighter.attackPower.randomElement()!
    show("\(humanFighter.name): \(humanFighter.hp)hp VS \(dogFighter.name): \(dogFighter.hp)hp!")
    
    humanFighter.hp -= dogPower
    if humanFighter.hp < 1 {
        if let i = humans.firstIndex(of: humanFighter) {
            humans.remove(at: i)
        }
        show(humanFighter.name + " is killed by \(dogFighter.name)!")
    } else {
        dogFighter.hp -= humanPower
        if dogFighter.hp < 1 {
            if let i = dogs.firstIndex(of: dogFighter) {
                dogs.remove(at: i)
            }
            show(dogFighter.name + " is killed by \(humanFighter.name)!")
        }
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
