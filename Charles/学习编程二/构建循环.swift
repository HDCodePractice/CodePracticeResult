let totalGems = randomNumberOfGems
var gem = 0
let character = Character()
world.place(character, atColumn: 7, row: 3)
world.place(Block(), atColumn: 6, row: 3)
world.place(Block(), atColumn: 3, row: 3)
world.place(Block(), atColumn: 1, row: 3)
world.place(Block(), atColumn: 1, row: 0)
world.place(Block(), atColumn: 6, row: 0)
world.place(Block(), atColumn: 0, row: 2)
yellowPortal.isActive = false
bluePortal.isActive = false
greenPortal.isActive = false
while gem<totalGems {
    if character.isBlocked&&character.isBlockedLeft {
        character.turnRight()
    }else if character.isBlocked&&character.isBlockedRight {
        character.turnLeft()
    }else if character.isOnGem {
            character.collectGem()
            gem+=1
    }else{
        character.moveForward()
    }
}
