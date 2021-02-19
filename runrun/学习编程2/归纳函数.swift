let expert = Expert()
let character = Character
func turnLock(up: <#T##Bool#>, numberOfTimes: <#T##Int#>){
 expert.turnLockUp()
    expert.turnLeft()
    expert.turnLeft()
    expert.turnLockUp()   
 }
 for i in 1 ... 3 {
    turnLock(up: true, numberOfTimes: 1)
}
move()
character.moveForward()
character.collectGem()
func go() {
    expert.turnLockDown()
    expert.turnLeft()
    expert.turnLeft()
    expert.turnLockDown()
}
func move() {
    character.moveForward()
    character.moveForward()
}

character.turnLeft()
character.turnLeft()
move()
character.turnLeft()
character.moveForward()
character.turnRight()
go()
go()
go()
character.moveForward()
character.collectGem()
character.turnLeft()
character.turnLeft()
move()
turnLock(up: true, numberOfTimes: 1)
character.moveForward()
character.collectGem()
