class animal {
    var hp = 145.0
    var attackPower = 10.0
    var name : String = ""
}

class Human : animal {
    var attack1 = 8.5
    var selfDamage1 = 4.0
    var attack2 = 7.0
    var attack3 = 11.0
    func 打(dog: inout Dog) {
        dog.hp -= self.attack1
        self.hp -= selfDamage1
    }
    func 踹(dog: inout Dog) {
        dog.hp -= self.attack2
    }
    func 棍(dog: inout Dog) {
        dog.hp -= self.attack3
    }
}

class Dog : animal {
    var attack1 = 5.0
    var attack2 = 15.0
    var selfDamage2 = 2.5
    var attack3 = 13.5
    var selfDamage3 = 5.0
    func 咬(human: inout Human) {
        human.hp -= self.attack1
    }
    func 扑(human: inout Human) {
        human.hp -= self.attack2
        self.hp -= selfDamage2
    }
    func 撞(human: inout Human) {
        human.hp -= self.attack3
        self.hp -= selfDamage3
    }
}

var Fido = Dog()
Fido.hp = 123.0
Fido.name = "Fido"
var Fizz = Dog()
Fizz.hp = 121.0
Fizz.name = "Fizz"
var Friday = Dog()
Friday.hp = 125.0
Friday.name = "Friday"
var Sicheng = Human()
Sicheng.hp = 145.0
Sicheng.name = "Sicheng"
var Noah = Human()
Noah.hp = 142.0
Noah.name = "Noah"
var Mengmeng = Human()
Mengmeng.hp = 144.0
Mengmeng.name = "Mengmeng"

func daGame(dog: inout Dog, human: inout Human) {
    while human.hp > 0 && dog.hp > 0 {
        let whichAttack = Int.random(in: 1...3)
        if whichAttack == 1 {
            dog.咬(human: &human)
        } else if whichAttack == 2 {
            dog.扑(human: &human)
        } else if whichAttack == 3 {
            dog.撞(human: &human)
        }
        
        let whichAttackHuman = Int.random(in: 1...3)
        if whichAttackHuman == 1 {
            human.打(dog: &dog)
        } else if whichAttackHuman == 2{
            human.踹(dog: &dog)
        } else if whichAttackHuman == 3{
            human.棍(dog: &dog)
        }
        show("\(human.name): \(human.hp) HP left")
        show("\(dog.name): \(dog.hp) HP left")
    }
}
daGame(dog: &Fido, human: &Sicheng)
if Fido.hp <= 0 {
    daGame(dog: &Fizz, human: &Sicheng)
    daGame(dog: &Fizz, human: &Noah)
    if Fizz.hp <= 0 {
        daGame(dog: &Friday, human: &Noah)
        daGame(dog: &Friday, human: &Mengmeng)
        if Mengmeng.hp <= 0 {
            show("Dog wins!")
        } else if Friday.hp <= 0 {
            show("Human wins!")
        } else if Mengmeng.hp <= 0 && Friday.hp <= 0 {
            show("It's a tie!!!")
        }
    } else if Noah.hp <= 0 {
        daGame(dog: &Fizz, human: &Mengmeng)
        daGame(dog: &Friday, human: &Mengmeng)
        if Mengmeng.hp <= 0 {
            show("Dog wins!")
        } else if Friday.hp <= 0 {
            show("Human wins!")
        } else if Mengmeng.hp <= 0 && Friday.hp <= 0 {
            show("It's a tie!!!")
        }
    } else if Noah.hp <= 0 && Fizz.hp <= 0 {
        daGame(dog: &Friday, human: &Mengmeng)
        if Mengmeng.hp <= 0 {
            show("Dog wins!")
        } else if Friday.hp <= 0 {
            show("Human wins!")
        } else if Mengmeng.hp <= 0 && Friday.hp <= 0 {
            show("It's a tie!!!")
        }
    }
} else if Sicheng.hp <= 0 {
    daGame(dog: &Fido, human: &Noah)
    daGame(dog: &Fizz, human: &Noah)
    if Fizz.hp <= 0 {
        daGame(dog: &Friday, human: &Noah)
        daGame(dog: &Friday, human: &Mengmeng)
        if Mengmeng.hp <= 0 {
            show("Dog wins!")
        } else if Friday.hp <= 0 {
            show("Human wins!")
        } else if Mengmeng.hp <= 0 && Friday.hp <= 0 {
            show("It's a tie!!!")
        }
    } else if Noah.hp <= 0 {
        daGame(dog: &Fizz, human: &Mengmeng)
        daGame(dog: &Friday, human: &Mengmeng)
        if Mengmeng.hp <= 0 {
            show("Dog wins!")
        } else if Friday.hp <= 0 {
            show("Human wins!")
        } else if Mengmeng.hp <= 0 && Friday.hp <= 0 {
            show("It's a tie!!!")
        }
    } else if Noah.hp <= 0 && Fizz.hp <= 0 {
        daGame(dog: &Friday, human: &Mengmeng)
        if Mengmeng.hp <= 0 {
            show("Dog wins!")
        } else if Friday.hp <= 0 {
            show("Human wins!")
        } else if Mengmeng.hp <= 0 && Friday.hp <= 0 {
            show("It's a tie!!!")
        }
    }
} else if Sicheng.hp <= 0 && Fido.hp <= 0 {
    daGame(dog: &Fizz, human: &Noah)
    if Fizz.hp <= 0 {
        daGame(dog: &Friday, human: &Noah)
        daGame(dog: &Friday, human: &Mengmeng)
        if Mengmeng.hp <= 0 {
            show("Dog wins!")
        } else if Friday.hp <= 0 {
            show("Human wins!")
        } else if Mengmeng.hp <= 0 && Friday.hp <= 0 {
            show("It's a tie!!!")
        }
    }
}
