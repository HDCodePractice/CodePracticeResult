class Animals {
    var hp = Int.random(in: 50 ... 1000)
    var power = Int.random(in: 5 ... 100)
    var name = ""
    
    init(_ name : String){
        self.name = name
    }
}

class Human : Animals{
}

class Dog : Animals {
}

extension Animals:Equatable{
    static func == (lhs: Animals, rhs: Animals) -> Bool {
        return lhs.name == rhs.name && 
            lhs.hp == rhs.hp && 
            lhs.power == rhs.power
    }
}

var humans = [Human("Sunny"),Human("MengMeng"),Human("Noah")]
var dogs = [Dog("SiCheng"),Dog("hdcola"),Dog("Bell")]

for i in humans {
    show("Human\(i.name) Spawn！ hp:\(i.hp) power:\(i.power)")
}
for i in dogs {
    show("Dog\(i.name) Spawn！ hp:\(i.hp) power:\(i.power)")
}

while !(humans.isEmpty || dogs.isEmpty) {
    let rHuman = humans.randomElement()!
    let rDog = dogs.randomElement()!
    
    show ("\(rHuman.name)(hp:\(rHuman.hp) power:\(rHuman.power)) VS \(rDog.name)(hp:\(rDog.hp) power:\(rDog.power))Start！")
    
    rHuman.hp = rHuman.hp - rDog.power
    if rHuman.hp <= 0 {
        show("\(rHuman.name)Killed\(rDog.name)One shot death！")
        if let i = humans.firstIndex(of: rHuman) {
            humans.remove(at: i)
        }
    }else{
        rDog.hp = rDog.hp - rHuman.power
        if rDog.hp <= 0 {
            show("\(rDog.name)Killed\(rHuman.name)Bite to death！")
            if let i = dogs.firstIndex(of: rDog) {
                dogs.remove(at: i)
            }
        }
    }
    show ("After th fierce battle\(rHuman.name)(hp:\(rHuman.hp) power:\(rHuman.power)) VS \(rDog.name)(hp:\(rDog.hp) power:\(rDog.power))")
}

if dogs.isEmpty {
    show("Humans win, survivors stats are：")
}else{
    show("Dogs win, survivors stats are：")
}

for i in humans {
    show("\(i.name) hp:\(i.hp) power:\(i.power)")
}
for i in dogs {
    show("\(i.name) hp:\(i.hp) power:\(i.power)")
}
