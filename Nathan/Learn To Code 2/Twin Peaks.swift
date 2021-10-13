let totalGems = randomNumberOfGems
let expert = Expert()
let character = Character()
var gemCounter = 0

world.place(expert, facing: north, atColumn: 0, row: 4)

world.place(character, facing: south, atColumn: 2, row: 6)
func firstRow() {
    for i in 1 ... 6 {
        if character.isOnGem {
            character.collectGem()
            gemCounter += 1
        }
        character.jump()
    }
    
}

func secondRow() {
    while !character.isBlocked {
        if character.isOnGem {
            character.collectGem()
            gemCounter += 1
        }
        character.moveForward()
    }
}

func thirdRow() {
    for i in 1 ... 6 {
        if character.isOnGem {
            character.collectGem()
            gemCounter += 1
        }
        character.jump()
    }
}

func swichingRows() {
    if character.isBlockedRight {
        if !character.isOnGem {
            character.turnLeft()
            character.moveForward()
            character.turnLeft()
        } else {
            character.collectGem()
            character.turnLeft()
            character.moveForward()
            character.turnLeft()
            gemCounter += 1
        }
    }
    if character.isBlockedLeft {
        if !character.isOnGem {
            character.turnRight()
            character.moveForward()
            character.turnRight()
        } else {
            character.collectGem()
            character.turnRight()
            character.moveForward()
            character.turnRight()
            gemCounter += 1
        }
    }
}
expert.turnLockUp()

while gemCounter != totalGems {
    expert.turnLock(up: true, numberOfTimes: 2)
    firstRow()
    swichingRows()
    secondRow()
    swichingRows()
    expert.turnLock(up: false, numberOfTimes: 2)
    thirdRow()
    character.turnRight()
    character.turnRight()
}
