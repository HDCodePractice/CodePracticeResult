let expert = Expert()
let character = Character()
func turnLock(up: Bool, numberOfTimes: Int) {
  for i in 1...numberOfTimes{
        if up==true{
            expert.turnLockUp()
        } else {
            expert.turnLockDown()
        }
    }
}
func turnAround(){
    expert.turnLeft()
    expert.turnLeft()
}
func thing(){
    character.collectGem()
    character.turnLeft()
    character.turnLeft()
    character.moveForward()
    turnAround()
}
turnLock(up: true, numberOfTimes: 3)
turnAround()
turnLock(up: true, numberOfTimes: 3)
character.move(distance: 3)
thing()
turnLock(up: false, numberOfTimes: 2)
character.turnLeft()
character.moveForward()
character.turnLeft()
character.moveForward()
thing()
turnLock(up: false, numberOfTimes: 2)
character.moveForward()
expert.turnLockDown()
character.moveForward()
character.collectGem()
