class Animals {
    // 血是在50到100间自动生成
    var hp = Int.random(in: 50 ... 100)
    // 基础攻击力是在1到10之间自动生成
    var power = Int.random(in: 10 ... 20)
    // 攻击方式会有所有的攻击方式和对应的攻击力
    // var Attacks : [String : Int] = [:]
    // 名字，给你的角色起一个名字吧
    var name = ""
    
    init(_ name : String){
        self.name = name
    }
}
class god {
var godPower = 10000000
var godHp = 10000000000
    var name = ""
    
    init(_ name : String){
        self.name = name
}
}
class Human : Animals{
}

class Dog : Animals {
}

class Snipro : god {
}

extension Animals:Equatable{
    static func == (lhs: Animals, rhs: Animals) -> Bool {
        return lhs.name == rhs.name && 
            lhs.hp == rhs.hp && 
            lhs.power == rhs.power
    }
}

extension god:Equatable{
    static func == (lhs: god, rhs: god) -> Bool {
        return lhs.name == rhs.name && 
            lhs.godHp == rhs.godHp && 
            lhs.godPower == rhs.godPower
    }
}

var humans = [Human("Sunny"),Human("Anjie")]
var dogs = [Dog("Mr.SichengBlahBlahBlah"),Dog("oldyellow")]
var gods = [god("Noah")]

for i in humans {
    show("Human \(i.name) came out of the barracks！ hp:\(i.hp) power:\(i.power)")
}
for i in dogs {
    show("A puppy \(i.name) was borned！ hp:\(i.hp) power:\(i.power)")
}
for i in gods {
    show("After 10 years, Super \(i.name) trained himself to be a true god！ hp:\(i.godHp) power:\(i.godPower)")
}

while !(humans.isEmpty || dogs.isEmpty || gods.isEmpty) {
    let rHuman = humans.randomElement()!
    let rDog = dogs.randomElement()!
    let rGod = gods.randomElement()!
    
    show ("\(rHuman.name)(hp:\(rHuman.hp) power:\(rHuman.power)) VS \(rDog.name)(hp:\(rDog.hp) power:\(rDog.power))battle！")
    
    
    
    rHuman.hp = rHuman.hp - rDog.power
    if rHuman.hp <= 0 {
        show("\(rHuman.name) was eliminated by \(rDog.name)!")
        if let i = humans.firstIndex(of: rHuman) {
            humans.remove(at: i)
        }
    }
    
rDog.hp = rDog.hp - rHuman.power
if rDog.hp <= 0 {
    show("\(rDog.name) was eliminated by \(rHuman.name)！")
    if let i = dogs.firstIndex(of: rDog) {
        dogs.remove(at: i)
    }
}
rGod.godHp = rGod.godHp - rHuman.power
if rGod.godHp <= 0 {
    show("\(rGod.name) was eliminated by \(rHuman.name)！")
    if let i = gods.firstIndex(of: rGod) {
        gods.remove(at: i)
    }
}
    rDog.hp = rDog.hp - rGod.godPower
    if rDog.hp <= 0 {
        show("\(rDog.name) was eliminated by \(rGod.name)！")
        if let i = dogs.firstIndex(of: rDog) {
            dogs.remove(at: i)
        }
    }
    rHuman.hp = rHuman.hp - rGod.godPower
    if rHuman.hp <= 0 {
        show("\(rHuman.name) was eliminated by \(rGod.name)！")
        if let i = humans.firstIndex(of: rHuman) {
            humans.remove(at: i)
        }
    }
    
    rGod.godHp = rGod.godHp - rDog.power
    if rGod.godHp <= 0 {
        show("\(rGod.name) was eliminated by \(rDog.name)！")
        if let i = gods.firstIndex(of: rGod) {
            gods.remove(at: i)
        }
    }
    
    
show ("After the fight \(rHuman.name)(hp:\(rHuman.hp) power:\(rHuman.power)) VS \(rDog.name)(hp:\(rDog.hp) power:\(rDog.power))")
}

if dogs.isEmpty && gods.isEmpty {
    show("The Humans secured their final victory! Humans remaining：")
}else if dogs.isEmpty && humans.isEmpty {
    show("Noah is the best！Hahahahahaha：")
} else if gods.isEmpty {
    show ("Noah was beaten up by dogs")
}

for i in humans {
    show("\(i.name) hp:\(i.hp) power:\(i.power)")
}
for i in dogs {
    show("\(i.name) hp:\(i.hp) power:\(i.power)")
}
for i in gods {
    show("\(i.name) hp:\(i.godHp) power:\(i.godPower)")
}
