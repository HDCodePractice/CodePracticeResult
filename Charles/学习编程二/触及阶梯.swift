func toggleandgo() {
    for i in 1 ... 3 {
        toggleSwitch()
        moveForward()
    }
}
for i in 1 ... 4 {
    jump()
}
turnLeft()
for i in 1 ... 3 {
    jump()
}
for i in 1 ... 3 {
    turnRight()
    toggleandgo()
    turnRight()
    jump()
    jump()
    turnLeft()
    jump()
    jump()
}
