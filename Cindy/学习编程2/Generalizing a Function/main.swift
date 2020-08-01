let expert = Expert()
let character = Character()
func turnLockUp(up: Bool, numberOfTimes: Int) {
    for i in 1 ... numberOfTimes {
        if up == true{
            expert.turnLockUp()
        } else {
            expert.turnLockDown()
        }
    }
}
func expertTurnAround() {
    expert.turnLeft()
    expert.turnLeft()
}
func charcaterTurnAround() {
    character.turnLeft()
    character.turnLeft()
}
turnLock(up: true, numberOfTimes: 3)
expertTurnAround()
turnLock(up: true, numberOfTimes: 3)
character.move(distance: 3)
character.collectGem()
charcaterTurnAround()
for i in 1 ... 2 {
    character.moveForward()
    character.turnLeft()
}
turnLock(up: false, numberOfTimes: 3)
expertTurnAround()
turnLock(up: false, numberOfTimes: 2)
character.moveForward()
charcaterTurnAround()
character.collectGem()
character.moveForward()
expert.turnLockDown()
character.move(distance: 2)
character.collectGem()
