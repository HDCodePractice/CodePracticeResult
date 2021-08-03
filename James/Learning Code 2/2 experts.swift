let expert = Expert()
let character = Character()
world.place(expert, facing: east, atColumn: 6, row: 0)
expert.turnLockDown()
expert.turnLockDown()
world.place(expert, facing: north, atColumn: 3, row: 0)
expert.turnLock(up: true, numberOfTimes: 2)
world.place(expert, facing: north, atColumn: 0, row: 0)
expert.collectGem()
world.place(character, facing: east, atColumn: 0, row: 4)
while !character.isBlocked {
    character.collectGem()
    character.moveForward()
}
