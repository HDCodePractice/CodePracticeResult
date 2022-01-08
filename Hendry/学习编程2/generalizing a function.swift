let character = Character()
let expert = Expert()
func turnLock (up: Bool, numberOfTimes: Int){
for i in 1 ... numberOfTimes {
        if up == true {
            expert.turnLockUp()
        }
        if up == false {
            expert.turnLockDown()
        }
    }
    }
func turnaroundexpert() {
    expert.turnLeft()
    expert.turnLeft()
}
func turnaroundcharacter() {
    character.turnLeft()
    character.turnLeft()
}
func move(distance: Int) {
    for i in 1 ... distance {
        character.moveForward()
    }
}
turnLock(up: true, numberOfTimes: 3)
turnaroundexpert()
turnLock(up: true, numberOfTimes: 3)
move(distance: 3)
character.collectGem()
turnaroundcharacter()
character.moveForward()
turnaroundexpert()
turnLock(up: false, numberOfTimes: 2)
character.turnLeft()
character.moveForward()
character.turnLeft()
move(distance: 1)
character.collectGem()
turnaroundcharacter()
character.moveForward()
turnLock(up: false, numberOfTimes: 1)
turnaroundexpert()
turnLock(up: false, numberOfTimes: 3)
move(distance: 2)
character.collectGem()
