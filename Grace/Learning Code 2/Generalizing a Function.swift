let expert = Expert()
let character = Character() 
func turnLock(up: bool, numberOfTimes: Int) {
  for i in 1...numberOfTimes{
            if up==true{
                expert.turnLockUp()
            } else {
                expert.turnLockDown()
            }
        }
}
func Turn(){
    expert.turnLeft()
    expert.turnLeft()
}
func CollectturnAndMove(){
    character.collectGem()
    character.turnLeft()
    character.turnLeft()
    character.moveForward()
    Turn()
}
turnLock(up: true, numberOfTimes: 3)
Turn()
turnLock(up: true, numberOfTimes: 3)
character.move(distance: 3)
CollectturnAndMove()
turnLock(up: false, numberOfTimes: 2)
character.turnLeft()
character.moveForward()
character.turnLeft()
character.moveForward()
CollectturnAndMove()
turnLock(up: false, numberOfTimes: 2)
character.moveForward()
expert.turnLockDown()
character.moveForward()
character.collectGem()
