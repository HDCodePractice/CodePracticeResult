func go1() {
    turnRight()
    turnRight()
}
func go2() {
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    toggleSwitch()
}
for i in 1 ... 3 {
    moveForward()
    moveForward()
    turnRight()
    go2()
    go1()
    go2()
    turnRight()
    
}
