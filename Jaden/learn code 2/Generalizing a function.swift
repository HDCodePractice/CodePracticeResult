let expert = Expert()
let character = Character()
func turnLock(up: Bool, numberOfTimes: Int){
    for i in 1 ... numberOfTimes {
        if up == true {
            expert.turnLockUp()
            
        }else{
            expert.turnLockDown()
            
        }
        
    }
}  



turnLock(up: true, numberOfTimes: 3)
expert.turnLeft()
expert.turnLeft()
turnLock(up: true, numberOfTimes: 3)
character.move(distance: 3)
character.collectGem()
character.turnLeft()
character.turnLeft()
for i in 1 ... 2 {
    character.moveForward()
    character.turnLeft()
}
turnLock(up: false, numberOfTimes: 3)
expert.turnLeft()
expert.turnLeft()
turnLock(up: false, numberOfTimes: 2)
character.moveForward()
character.collectGem()
character.turnLeft()
character.turnLeft()
character.moveForward()
expert.turnLockDown()
character.move(distance: 2)
character.collectGem()

