class Animals {
    // 血是在50到100间自动生成
    var hp = Int.random(in: 50 ... 100)
    // 基础攻击力是在1到10之间自动生成
    var power = Int.random(in: 1 ... 10)
    // 攻击方式会有所有的攻击方式和对应的攻击力
    // var Attacks : [String : Int] = [:]
    // 名字，给你的角色起一个名字吧
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
var dogs = [Dog("SiCheng"),Dog("hdcola"),Dog("Fizz")]

for i in humans {
    show("人类\(i.name) 诞生！ hp:\(i.hp) power:\(i.power)")
}
for i in dogs {
    show("狗类\(i.name) 诞生！ hp:\(i.hp) power:\(i.power)")
}

while !(humans.isEmpty || dogs.isEmpty) {
    let rHuman = humans.randomElement()!
    let rDog = dogs.randomElement()!
    
    show ("\(rHuman.name)(hp:\(rHuman.hp) power:\(rHuman.power)) VS \(rDog.name)(hp:\(rDog.hp) power:\(rDog.power))开战！")
    
    rHuman.hp = rHuman.hp - rDog.power
    if rHuman.hp <= 0 {
        show("\(rHuman.name)被\(rDog.name)一招致死！")
        if let i = humans.firstIndex(of: rHuman) {
            humans.remove(at: i)
        }
    }else{
        rDog.hp = rDog.hp - rHuman.power
        if rDog.hp <= 0 {
            show("\(rDog.name)被\(rHuman.name)一招致死！")
            if let i = dogs.firstIndex(of: rDog) {
                dogs.remove(at: i)
            }
        }
    }
    show ("激战之后\(rHuman.name)(hp:\(rHuman.hp) power:\(rHuman.power)) VS \(rDog.name)(hp:\(rDog.hp) power:\(rDog.power))")
}

if dogs.isEmpty {
    show("人类最终统治了地球！最后的人类有：")
}else{
    show("狗类最终统治了地球！最后的狗类有：")
}

for i in humans {
    show("\(i.name) hp:\(i.hp) power:\(i.power)")
}
for i in dogs {
    show("\(i.name) hp:\(i.hp) power:\(i.power)")
}
