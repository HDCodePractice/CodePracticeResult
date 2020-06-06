class CharacterClass{
    var hp = Int.random(in:15...35)
    var attackPower = Int.random(in:5...15)
    var name : String
    init(_ name: String){
        self.name = name
    }
}
class Human : CharacterClass {
    var beat = "a"
    var kick = "b"
    var hit = "c"
}
class Doge : CharacterClass {
    var bite = "a"
    var shove = "b"
    var crash = "c"
}
var player = [Human("A"),Human("B"),Human("C")]
var doge = [Doge("1"),Doge("2"),Doge("3")]
for i in player{
    show("\(i.name)不再吃瓜,加入了战斗！hp有\(i.hp),虽然还没准备好，能够应该打出\(i.attackPower)点的攻击")
}
for i in doge{
    show("\(i.name)发现敌人,加入战斗！hp有\(i.hp),虽然还没准备好，能够应该打出\(i.attackPower)点的攻击")
}

var time = 0
while player.count != 0 && doge.count != 0 {
    time += 1
    show("第\(time)回合开始！")
    var turn = Int.random(in:0...1)
    var victim = Int.random(in: 0...doge.count-1)
    var attacker = Int.random(in: 0...player.count-1)
    if turn == 1 {
        show("\(player[attacker].name)率先抢到了先手，对\(doge[victim].name)发起了攻击！造成了\(player[attacker].attackPower)点伤害！\(doge[victim].name)还剩下\(doge[victim].hp)点hp。")
        doge[victim].hp -= player[attacker].attackPower
        if doge[victim].hp <= 0 {
            player[attacker].hp -= doge[victim].attackPower 
            show("\(doge[victim].name)在临死前发起最后一击，造成了\(doge[victim].attackPower)点伤害！\(doge[victim].name)还剩下\(doge[victim].hp)点hp。")
            doge.remove(at: victim)
        }else {
            player[attacker].hp -= doge[victim].attackPower 
            show("\(doge[victim].name)并不会放弃反击，开始对\(player[attacker].name)发起攻击！造成了\(doge[victim].attackPower)点伤害！\(doge[victim].name)还剩下\(doge[victim].hp)点hp。")
        }
        if player[attacker].hp <= 0 {
            player.remove(at: attacker)
        }
    }else {
        var victim = Int.random(in: 0...player.count-1)
        var attacker = Int.random(in: 0...doge.count-1)
        show("\(doge[attacker].name)率先抢到了先手，对\(player[victim].name)发起了攻击！造成了\(doge[attacker].attackPower)点伤害")
        player[victim].hp -= doge[attacker].attackPower
        if player[victim].hp <= 0 {
            doge[attacker].hp -= player[victim].attackPower 
            show("\(player[victim].name)在临死前发起最后一击，造成了\(player[victim].attackPower)点伤害")
            player.remove(at: victim)
        }else {
            doge[attacker].hp -= player[victim].attackPower 
            show("\(player[victim].name)并不会放弃反击，开始对\(doge[attacker].name)发起攻击！造成了\(player[victim].attackPower)点伤害")
        }
        if doge[attacker].hp <= 0 {
            player.remove(at: turn)
        }
    }
}
var survival = [""]
for i in doge{
    survival.append(i.name)
}
for i in player{
    survival.append(i.name)
}
show("战斗结束！幸存者是\(survival)")
