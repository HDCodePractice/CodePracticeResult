let expert =  Expert ()
let character =  Character()
func  turnLock ( up : Bool , numberOfTimes : Int ){
  for i in 1 ... numberOfTimes {
        if up == true{
            expert.turnLockUp()
        } else {
            expert.turnLockDown()
        }
    }
}
func turnAround1() {
    expert.turnLeft()
    expert.turnLeft()
}
func turnAround2() {
    character.turnLeft()
    character.turnLeft()
}
turnLock(up: true, numberOfTimes: 3)
turnAround1()
turnLock(up: true, numberOfTimes: 3)
character.move(distance: 3)
character.collectGem()
turnAround2()
for i in 1 ... 2 {
    character.moveForward()
    character.turnLeft()
}
turnLock(up: false, numberOfTimes: 3)
turnAround1()
turnLock(up: false, numberOfTimes: 2)
character.moveForward()
turnAround2()
character.collectGem()
character.moveForward()
expert.turnLockDown()
character.move(distance: 2)
character.collectGem()
