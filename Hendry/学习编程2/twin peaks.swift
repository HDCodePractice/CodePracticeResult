let character1 = Character()
let character2 = Character()
let character3 = Character()
var gemCounter = 0
world.place(character1, facing: north, atColumn: 2, row: 0)
world.place(character2, facing: north, atColumn: 4, row: 0)
world.place(character3, facing: north, atColumn: 3, row: 0)
while gemCounter != totalGems{
    if character1.isOnGem {
        character1.collectGem()
        gemCounter+=1
    }
    if character3.isBlocked {
        character1.turnLeft()
        character1.turnLeft()
        character2.turnLeft()
        character2.turnLeft()
        character3.turnLeft()
        character3.turnLeft()   
    }
    if character2.isOnGem {
        character2.collectGem()
        gemCounter+=1
    }
    if character3.isOnGem {
        character3.collectGem()
        gemCounter+=1 
    }
    character1.jump()
    character2.jump()
    character3.moveForward()
}
