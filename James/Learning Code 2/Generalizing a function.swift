let expert = Expert()
let character = Character()
func turn lock (up:bool, numberOfTimes:int){
  for i in 1 ... numberOfTimes {
        expert.turnLockUp()
    }
    expert.turnLeft()
    expert.turnLeft()
    for i in 1 ... numberOfTimes {
        expert.turnLockUp()
    }
}
turnLock(up: true, numberOfTimes: 3)
func turnback() {
    character.turnLeft()
    character.turnLeft()
    character.collectGem()
}
character.move(distance: 3)
turnback()
character.move(distance: 2)
expert.turnLockDown()
expert.turnLockDown()
expert.turnLockDown()
    character.turnLeft()
    character.moveForward()
character.turnRight()
character.moveForward()
turnback()
expert.turnLeft()
expert.turnLeft()
expert.turnLockDown()
expert.turnLockDown()
expert.turnLockDown()
character.move(distance: 2)
expert.turnLockUp()
character.moveForward()
turnback()
