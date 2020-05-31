func turnaround() {
    turnRight()
    turnRight()
}
func collect() {
    moveForward()
    collectGem()
    turnLeft()
    moveForward()
    collectGem()
    turnaround()
    moveForward()
    moveForward()
    collectGem()
    turnaround()
    moveForward()
    turnRight()
    moveForward()
    collectGem()
    turnaround()
    moveForward()
    turnLeft()
    moveForward()
    moveForward()
}
for i in 1 ... 4 {
    collect()
}
