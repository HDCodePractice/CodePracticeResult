class Soldier{
    var hp = 10.0
    var mp = 10.0
    var attackPower = 1.0
    var name : String?
}

// Medic继承Soldier，也就是它是Soldier的子类

class Medic : Soldier {
    var healHp = 5.0
    //在func的参数后加入inout说明在函数里将会改变参数的值
    func heal(soldier: inout Soldier) {
        soldier.hp += self.healHp
        if soldier.hp > 10 {
            soldier.hp = 10
        }
    }
}

class Sniper : Soldier {
    var snipeHp = 5.0
    //在func的参数后加入inout说明在函数里将会改变参数的值
    func snipe(soldier: inout Soldier) {
        soldier.hp -= self.snipeHp
    }
}

var soldier = Soldier()
soldier.hp = 3
let medic = Medic()
medic.hp = 10
let sniper = Sniper()
sniper.hp = 5

//对于inout的参数，需要加入&前缀，用于说明传入的参数
medic.heal(soldier: &soldier)
show("soldier: \(soldier.hp) medic: \(medic.hp)")
sniper.snipe(soldier: &soldier)
show("soldier: \(soldier.hp) sniper: \(sniper.hp)")
