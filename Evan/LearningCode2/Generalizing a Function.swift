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
func turnAroundExpert() {
    expert.turnLeft()
    expert.turnLeft()
}
func turnAround() {
    character.turnLeft()
    character.turnLeft()
}
turnLock(up: true, numberOfTimes: 3)
turnAroundExpert()
turnLock(up: true, numberOfTimes: 3)
character.moveForward()
character.moveForward()
character.moveForward()
character.collectGem()
turnAround()
character.moveForward()
character.turnLeft()
character.moveForward()
character.turnLeft()
turnLock(up: false, numberOfTimes: 2)
turnAroundExpert()
turnLock(up: false, numberOfTimes: 2)
character.moveForward()
character.collectGem()
turnAround()
character.moveForward()
character.moveForward()
turnAroundExpert()
turnLock(up: false, numberOfTimes: 1)
character.moveForward()
character.collectGem()
