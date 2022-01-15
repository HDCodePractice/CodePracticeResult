// 移除传送门。
characters.remove(at: 1)
// 移除宝石。
characters.removeLast()
// 插入专家。
let expert = Expert()
characters.insert(expert, at: 1)
var rowPlacement = 0
for character in characters {
    world.place(character, at: Coordinate(column: 1, row: rowPlacement))
    rowPlacement += 1
}
