let expert = Expert()
let character = Character()
world.place(expert, facing: north, atColumn: 3, row: 0)
world.place(character, facing: .north, atColumn: 0, row: 0)

func jumpCollect() {
character.jump()
character.jump()
character.collectGem()
}
expert.toggleSwitch()
character.collectGem()
jumpCollect()
jumpCollect()
character.turnRight()
jumpCollect()
jumpCollect()
character.turnLeft()
jumpCollect()
