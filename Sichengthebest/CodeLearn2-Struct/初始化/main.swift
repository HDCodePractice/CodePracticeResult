class CharacterClass{
    var hp = 10.0
    var mp = 10.0
    var attackPower = 3.0
    var name : String?
    init(hp: Double,name: String){
        // self是一个特别的意思，它代表实例(instance)操作自己
        self.name = name
        self.hp = hp
    }
    // 请再给CharacterClass增加一个init，能够初始化时同时设置hp,mp,attackPower和name
    init(hp: Double,mp: Double,attackPower: Double,name: String){
        self.hp = hp
        self.name = name
        self.attackPower = attackPower
        self.mp = mp
    }
}

let characterClass1 = CharacterClass(hp: 5.0,name: "Death")
let characterClass2 = CharacterClass(hp: 6.0, name: "Murderer")
let characterClass3 = CharacterClass(hp: 123.4, mp: 456.7, attackPower: 789.0, name: "Killer")
// 再使用你自己增加的初始化方法，创建一个"虾兵3"的实例

show("\(characterClass1.hp) vs \(characterClass2.hp) vs \(characterClass3.hp)")
