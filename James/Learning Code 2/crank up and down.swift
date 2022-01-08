let expert = Expert()
let character = Character()
for i in 1 ... 4 {
    expert.turnLock(up: true, numberOfTimes: 4)
    expert.turnLeft()
}
character.move(distance: 2)
func right() {
    character.turnRight()
    character.collectGem()
}
func turnaround() {
    character.collectGem()
    character.turnRight()
    character.turnRight()
}
right()
character.move(distance: 2)
right()
character.move(distance: 4)
right()
character.moveForward()
right()
for i in 1 ... 12 {
    expert.turnLockDown()
    expert.turnLeft()
}
character.moveForward()
func stuff() {
    right()
        character.move(distance: 2)
        turnaround()
    character.move(distance: 2)
    right()
}
for i in 1 ... 2 {
    stuff()
    character.move(distance: 2)
}
turnaround()
character.move(distance: 7)
right() 
