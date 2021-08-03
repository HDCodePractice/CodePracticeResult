let expert = Expert()
let character = Character()
func turnLock(up: Bool, numberOfTimes: Int) {
  for i in 1 ... numberOfTimes {
        if up == true {
            expert.turnLockUp()
        } else {
            expert.turnLockDown()
        }
        
    }
}
turnLock(up: true, numberOfTimes: 3)
expert.turnLeft()
expert.turnLeft()
turnLock(up: true, numberOfTimes: 3)
character.moveForward()
character.moveForward()
character.moveForward()
character.collectGem()
character.turnLeft()
character.turnLeft()
character.moveForward()
character.turnLeft()
turnLock(up: false, numberOfTimes: 2)
expert.turnLeft()
expert.turnLeft()
turnLock(up: false, numberOfTimes: 2)
character.moveForward()
character.turnLeft()
character.moveForward()
character.collectGem()
character.turnLeft()
character.turnLeft()
character.moveForward()
character.moveForward()
expert.turnLeft()
expert.turnLeft()
turnLock(up: false, numberOfTimes: 1)
character.moveForward()
character.collectGem()
