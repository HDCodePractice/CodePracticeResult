let character = Character()
greenPortal.isActive=false
bluePortal.isActive=false
yellowPortal.isActive=false
let block1 = Block()
let block2 = Block()
let block3 = Block()
let block4 = Block()
let block5 = Block()
let block6 = Block()
world.place(block1, atColumn: 0, row: 2)
world.place(block2, atColumn: 1, row: 0)
world.place(block3, atColumn: 1, row: 3)
world.place(block4, atColumn: 3, row: 3)
world.place(block5, atColumn: 6, row: 3)
world.place(block6, atColumn: 6, row: 0)
world.place(character, facing: north, atColumn: 0, row: 2)
var gemCounter = 0
while gemCounter<totalGems {
    if character.isOnGem {
        character.collectGem()
        gemCounter+=1
    }
    if character.isBlocked {
        character.turnRight()
    }
    character.moveForward()
}
