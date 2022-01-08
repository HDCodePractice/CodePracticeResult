let totalGems = randomNumberOfGems
let expert = Expert()
let character = Character()
world.place(expert, atColumn: 0, row: 4)
expert.turnLeft()
world.place(character, atColumn: 2, row: 6)
expert.turnLeft()
var gem = 0
expert.turnLockUp()
expert.turnLockUp()
expert.turnLockUp()
while gem != totalGems {
    for i in 1 ... 7 {
        if character.isOnGem {
            character.collectGem()
            character.jump()
            gem += 1
        } else {
            character.jump()
        }
    }
        character.turnLeft()
        character.moveForward()
        expert.turnLockDown()
        expert.turnLockDown()
    if character.isOnGem {
        character.collectGem()
        gem += 1
        character.moveForward()
    } else {
        
        character.moveForward() 
    }
    
    character.turnLeft()
    expert.turnLockUp()
    expert.turnLockUp()
    
    
}

