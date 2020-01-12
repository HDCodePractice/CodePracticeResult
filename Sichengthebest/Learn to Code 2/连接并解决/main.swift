func collectRow(charcter: Character) {
    charcter.toggleSwitch()
    charcter.move(distance: 4)
    charcter.collectGem()
}
func putBlocks(atColumn: Int, row: Int, putNumber: Int) {
    for i in 1 ... putNumber {
        world.place(Block(), atColumn: atColumn, row: row)
    }
}
putBlocks(atColumn: 2, row: 2, putNumber: 2)
putBlocks(atColumn: 4, row: 2, putNumber: 1)
putBlocks(atColumn: 6, row: 2, putNumber: 2)

let aa = Character()
world.place(aa, facing: south, atColumn: 2, row: 4)
collectRow(charcter: aa)
let bb = Character()
world.place(bb, facing: south, atColumn: 4, row: 4)
collectRow(charcter: bb)
let cc = Character()
world.place(cc, facing: south, atColumn: 6, row: 4)
collectRow(charcter: cc)
