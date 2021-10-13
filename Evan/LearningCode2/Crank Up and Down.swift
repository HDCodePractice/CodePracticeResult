let expert = Expert()
let character = Character()
func turnLock(up: Bool, numberOfTimes: Int) {
    for i in 1 ... numberOfTimes {
        if up == true {
            expert.turnLockUp()
        }
        else if up == false {
            expert.turnLockDown()
        }
    }
}
func move(distance: Int) {
    for i in 1 ... distance {
        character.moveForward()
    }
}
turnLock(up: true, numberOfTimes: 4)
move(distance: 2)
character.collectGem()
character.turnRight()
move(distance: 2)
character.collectGem()
character.turnRight()
expert.turnRight()
turnLock(up: true, numberOfTimes: 4)
expert.turnRight()
turnLock(up: true, numberOfTimes: 4)
move(distance: 4)
character.collectGem()
character.turnRight()
expert.turnRight()
turnLock(up: true, numberOfTimes: 4)
move(distance: 6)
character.turnRight()
character.moveForward()
character.turnRight()
turnLock(up: false, numberOfTimes: 3)
expert.turnRight()
turnLock(up: false, numberOfTimes: 3)
expert.turnRight()
turnLock(up: false, numberOfTimes: 3)
expert.turnRight()
turnLock(up: false, numberOfTimes: 3)
move(distance: 7)
character.collectGem()
character.turnLeft()
character.turnLeft()
move(distance: 2)
character.turnRight()
move(distance: 4)
character.collectGem()
character.turnLeft()
character.turnLeft()
move(distance: 2)
character.turnLeft()
move(distance: 2)
character.collectGem()
character.turnLeft()
character.turnLeft()
move(distance: 2)
character.turnLeft()
move(distance: 4)
character.collectGem()
