let totalGems = randomNumberOfGems
let block = Block()
var gem = 0
let character = Character()
world.place(block, atColumn: 0, row: 2)
world.place(character, facing: south, atColumn: 7, row: 3)
while gem<totalGems{
    character.moveForward()
    if character.isOnGem {
        character.collectGem()
        gem += 1
    }
    if character.isBlocked {
        character.turnLeft()
        
    }
    
    
}
