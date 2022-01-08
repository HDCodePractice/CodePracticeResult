let character = Character()
world.place(character, facing: west, atColumn: 2, row: 1)
let whitePortal = Portal(color: #colorLiteral(red: 0.9999960065, green: 1.0, blue: 1.0, alpha: 1.0))
world.place(whitePortal, atStartColumn: 2, startRow: 1, atEndColumn: 6, endRow: 4)
let blackPortal = Portal(color: #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
world.place(blackPortal, atStartColumn: 5, startRow: 5, atEndColumn: 1, endRow: 6)
func jumpAround() {
    for i in 1 ... 6 {
        if character.isOnGem {
            character.collectGem()
        } else if character.isOnClosedSwitch {
            character.toggleSwitch()
        } else {
            character.jump()
            character.turnRight()
        }
    }
}
jumpAround()
character.jump()
jumpAround()
character.turnLeft()
character.jump()
jumpAround()
