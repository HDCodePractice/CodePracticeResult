let expert = Expert()
let character = Character()

func turnLock(up: Bool, numberOfTimes: Int) {

for i in 1 ... numberOfTimes {
        if up {
            expert.turnLockUp()
        } else {
            expert.turnLockDown()
        }
    }
    
    func combo() {
    character.collectGem()
    character.turnRight()
    character.turnRight()
}

turnLock(up: true, numberOfTimes: 3)
expert.turnLeft()
expert.turnLeft()
turnLock(up: true, numberOfTimes: 3)
character.move(distance: 3)
combo()
character.move(distance: 2)
character.turnLeft()
character.moveForward()
character.turnLeft()
turnLock(up: false, numberOfTimes: 2)
expert.turnLeft()
expert.turnLeft()
turnLock(up: false, numberOfTimes: 2)
character.move(distance: 2)
combo()
character.move(distance: 2)
expert.turnLeft()
expert.turnLeft()
turnLock(up: false, numberOfTimes: 1)
character.moveForward()
combo()
