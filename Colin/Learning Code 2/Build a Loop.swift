let character = Character()
var gemCounter = 0
world.place(Block(), atColumn: 1, row: 3)
world.place(Block(), atColumn: 3, row: 3)
world.place(Block(), atColumn: 6, row: 3)
world.place(Block(), atColumn: 0, row: 2)
world.place(Block(), atColumn: 1, row: 0)
world.place(Block(), atColumn: 6, row: 0)
bluePortal.isActive=false
greenPortal.isActive=false
yellowPortal.isActive=false
world.place(character, facing: .east, atColumn: 0, row: 3)
while gemCounter != totalGems{
    if character.isOnGem{
        character.collectGem()
        gemCounter+=1
    }
    if character.isBlocked{
        character.turnRight()
    }
    character.moveForward()
}
