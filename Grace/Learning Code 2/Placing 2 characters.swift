let character = Character()
let expert = Expert()
world.place(character, facing: north, atColumn: 0, row: 0)
world.place(expert, facing: north, atColumn: 3, row: 0)
func collectAndJump() {
    for i in 1 ... 2 {
        character.collectGem()
        character.jump()
        character.jump()
    }
}
expert.toggleSwitch()
expert.turnLockUp()
collectAndJump()
character.turnRight()
collectAndJump()
character.turnLeft()
character.collectGem()
character.move(distance: 2)
