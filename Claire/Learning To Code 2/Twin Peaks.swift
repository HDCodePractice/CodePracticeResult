let expert = Expert()
let character = Character()
var gemCounter = 0
world.place(expert, facing: north, atColumn: 0, row: 4)
world.place(character, facing: north, atColumn: 3, row: 0)
expert.turnLock(up: true, numberOfTimes: 2)
while gemCounter < totalGems {
    for i in 1 ... 6 {
        if character.isOnGem {
            character.collectGem()
            gemCounter += 1
            character.jump()
        } else {
            character.jump()
        }
    }
    character.turnRight()
    for i in 1 ... 2 {
        if character.isOnGem {
            character.collectGem()
            gemCounter += 1
            character.jump()
        } else {
            character.jump()
        }
    }
    character.turnRight()
}
