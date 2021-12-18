let Expert()
let Character()

func turnLock(up: Bool, numberOfTimes: Int) {
  for i in 1 ... numberOfTimes {
        if up==true {
            expert.turnLockUp()
        }else{
            expert.turnLockDown()
        }
    }
}
    func expertTurnAround() {
        expert.turnLeft()
        expert.turnLeft()
    }
    func characterTurnAround() {
        character.turnLeft()
        character.turnLeft()
    }
    
    turnLock(up: true, numberOfTimes: 3)
    expertTurnAround()
    turnLock(up: true, numberOfTimes: 3)
    character.move(distance: 3)
    character.collectGem()
    characterTurnAround()
    character.moveForward()
    turnLock(up: false, numberOfTimes: 2)
    expertTurnAround()
    turnLock(up: false, numberOfTimes: 2)
    character.turnLeft()
    character.moveForward()
    character.turnLeft()
    character.moveForward()
    character.collectGem()
    characterTurnAround()
    expertTurnAround()
    character.move(distance: 2)
    expert.turnLockDown()
    character.moveForward()
    character.collectGem()
