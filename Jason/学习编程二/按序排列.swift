//上面那个复制不上来，那个系统自带的，别算我错
characters.remove(at: 1)
// 移除传送门。
characters.remove(at: 2)
// 移除宝石。
characters.insert(Expert(), at: 1 )
// 插入专家。

var rowPlacement = 0
for character in characters {
    world.place(character, at: Coordinate(column: 1, row: rowPlacement))
    rowPlacement += 1
}
