let character = Character()
let expert = Expert()
func move(distance: Int) {
    for i in 1 ... distance {
        character.moveForward()
    }
}
func turnLock(up: Bool, numberOfTimes: Int) {
    for i in 1 ... numberOfTimes {
        if up==true {
            expert.turnLockUp()
        }
        if up==false {
            expert.turnLockDown()
        }  
    } 
}
func turnAround() {
    character.turnRight()
    character.turnRight()
}
move(distance: 2)
character.collectGem()
turnLock(up: true, numberOfTimes: 4)
character.turnRight()
move(distance: 1)
turnLock(up: false, numberOfTimes: 3)
character.turnLeft()
move(distance: 1)
character.collectGem()
character.turnRight()
character.turnRight()
character.moveForward()
turnLock(up: true, numberOfTimes: 3)
character.turnLeft()
move(distance: 1)
let character= Character()
let expert = Expert()
character.collectGem()
character.turnRight()
expert.turnRight()
turnLock(up: true, numberOfTimes: 4)
move(distance: 1)
turnLock(up: false, numberOfTimes: 3)
character.turnLeft()
move(distance: 1)
character.collectGem()
turnAround()
move(distance: 1)
turnLock(up: true, numberOfTimes: 3)
character.turnLeft()
move(distance: 1)
expert.turnRight()
turnLock(up: true, numberOfTimes: 4)
move(distance: 1)
turnLock(up: false, numberOfTimes: 3)
character.turnLeft()
move(distance: 1)
character.collectGem()
turnAround()
move(distance: 1)
turnLock(up: true, numberOfTimes: 3)
character.turnLeft()
move(distance: 1)
character.collectGem()
expert.turnRight()
turnLock(up: true, numberOfTimes: 4)
character.turnRight()
move(distance: 1)
character.turnLeft()
turnLock(up: false, numberOfTimes: 3)
move(distance: 1)
character.collectGem()
