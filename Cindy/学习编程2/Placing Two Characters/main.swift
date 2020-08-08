let character = Character()
let expert = Expert()
world.place(character, facing: north, atColumn: 0, row: 0)
world.place(expert, facing: north, atColumn: 3, row: 0)
func collectAndJUmp() {
    for i in 1...2 {
        character.collectGem()
        character.jump()
        character.jump()
    }
}
expert.toggleSwitch()
expert.turnLockUp()
collectAndJUmp()
character.turnRight()
collectAndJUmp()
character.turnLeft()
character.collectGem()
character.move(distance: 2)
character.collectGem()
