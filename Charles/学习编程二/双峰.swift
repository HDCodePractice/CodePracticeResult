let totalGems = randomNumberOfGems
var gems = 0
let exp = Expert()
let char = Character()
world.place(exp, facing: north, atColumn: 0, row: 4)
world.place(char, facing: south, atColumn: 4, row: 6)
exp.turnLockUp()
repeat {
    for i in 1 ... 3 {
        for i in 1 ... 6 {
            if char.isOnGem {
                char.collectGem()
                gems += 1
            }
            char.jump()
        }
        switch i {
        case 1:
            char.turnRight()
            char.moveForward()
            char.turnRight()
        case 2:
            char.turnLeft()
            char.moveForward()
            char.turnLeft()
        case 3:
            char.turnLeft()
            char.turnLeft()
        default:
            break 
        }
    }
} while gems != totalGems
