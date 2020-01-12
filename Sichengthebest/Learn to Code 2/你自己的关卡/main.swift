var blockLocation = [
    Coordinate(column: 7, row: 6)
]
for coordinate in blockLocation {
    for i in 1 ... 25 {
        world.place(Block(), at: coordinate)
    }
}
let g = Gem()
world.place(g, atColumn: 0, row: 6)
let eT = Expert()
world.place(eT, facing: east, atColumn: 0, row: 6)
let p = Portal(color: #colorLiteral(red: 0.572549045085907, green: 0.0, blue: 0.23137255012989044, alpha: 1.0))
world.place(p, atStartColumn: 1, startRow: 6, atEndColumn: 7, endRow: 6)
let s = Switch()
world.place(s, atColumn: 7, row: 6)

eT.collectGem()
eT.moveForward()
eT.toggleSwitch()
