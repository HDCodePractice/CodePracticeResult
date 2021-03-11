let character = Character()
let expert = Expert()
func jumpAndCollect(numberOfTimes: Int) {
    for i in 1 ... numberOfTimes {
        if character.isOnGem {
            character.collectGem()
        } else {
            character.jump()
        }
    }
}
world.place(expert, facing: north, atColumn: 3, row: 0)
world.place(character, facing: south, atColumn: 4, row: 6)
expert.toggleSwitch()
expert.turnLockUp()
character.collectGem()
character.move(distance: 2)
character.collectGem()
character.turnRight()
jumpAndCollect(numberOfTimes: 6)
character.turnLeft()
jumpAndCollect(numberOfTimes: 6)
