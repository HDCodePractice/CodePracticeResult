let totalGems = randomNumberOfGems
world.place(Block(), atColumn: 6, row: 3)
world.place(Block(), atColumn: 6, row: 0)
world.place(Block(), atColumn: 1, row: 0)
world.place(Block(), atColumn: 0, row: 2)
world.place(Block(), atColumn: 1, row: 3)
world.place(Block(), atColumn: 3, row: 3)

bluePortal.isActive = false
yellowPortal.isActive = false
greenPortal.isActive = false

let character = Character()

world.place(character, facing: south, atColumn: 7, row: 3)

var gemCounter = 0

while gemCounter != totalGems {
    if character.isBlocked {
        character.turnRight()
    }
    if character.isOnGem {
        character.collectGem()
        gemCounter += 1
    }
    character.moveForward()
}
