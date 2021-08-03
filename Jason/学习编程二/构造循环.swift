let totalGem=randomNumberOfGems
var gem = 0
let character = Character()
world.place(Block(), atColumn: 1, row: 3)
world.place(Block(), atColumn: 3, row: 3)
world.place(Block(), atColumn: 6, row: 3)
world.place(Block(), atColumn: 6, row: 0)
world.place(Block(), atColumn: 1, row: 0)
world.place(Block(), atColumn: 0, row: 2)
greenPortal.isActive=false
bluePortal.isActive=false
yellowPortal.isActive=false
world.place(character, facing: west, atColumn: 0, row: 0)
while gem != totalGems {
    if character.isOnGem {
        character.collectGem()
        character.moveForward()
        if character.isBlocked {
            character.turnRight()
        }
        
        gem+=1
    } else {
        character.moveForward()
        if character.isBlocked {
            character.turnRight()
        }
    }
    
}
