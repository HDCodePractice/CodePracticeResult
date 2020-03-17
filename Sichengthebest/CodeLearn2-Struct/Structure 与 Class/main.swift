struct CharacterStructure {
    var hp = 10.0
    var mp = 10.0
    var attackPower = 3.0
    var name : String?
}

class CharacterClass{
    var hp = 10.0
    var mp = 10.0
    var attackPower = 3.0
    var name : String?
}


let characterStructure1 = CharacterStructure(hp: 100.0, name: "蟹将")
var characterStructure2 = characterStructure1
characterStructure2.hp = 10.0
show("\(characterStructure1.hp) vs \(characterStructure2.hp)")
// 我们可以想像为struct实例(instance)在赋值时复制了内容过去,每个实例都有独立的空间。

let characterClass1 = CharacterClass()
characterClass1.hp = 100
let characterClass2 = characterClass1
characterClass2.hp = 10
show("\(characterClass1.hp) vs \(characterClass2.hp)")
// 我们可以想像class的实例(instance)在赋值时复制的是一个空间的引用，赋值让实例使用了相同的空间。

// 在swift里特别提供了`===`和`!==`来判断是不是相同的instance引用
if characterClass1 === characterClass2 {
    show("True")
}else{
    show("False")
}

if characterClass1 !== characterClass2 {
    show("True")
}else{
    show("False")
}
