struct General{
    var hp = 100000.0
    var mp = 100000.0
    var attackPower = 333.3
    var name : String?
}

class Soldier{
    var hp = 10.0
    var mp = 10.0
    var attackPower = 1.0
    var name : String?
}

// 为General扩展restore方法
extension General{
    func discribe() -> String{
        return "General: \(String(self.name ?? "Sicheng")), hp: \(self.hp), mp: \(self.mp), attack: \(self.attackPower)"
    }
}

// 请为Soldier也增加discribe方法
extension Soldier{
    func discribe() -> String{
        return "Soldier: \(String(self.name ?? "Noah")), hp: \(self.hp), mp: \(self.mp), attack: \(self.attackPower)"
    }
}

let general = General()
show(general.discribe())

let soldier = Soldier()
show(soldier.discribe())
