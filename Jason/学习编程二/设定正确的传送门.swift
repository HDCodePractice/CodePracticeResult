func a() {
    turnLeft()
    turnLeft()
}
for i in 1 ... 2 {
    moveForward()
    moveForward()
    collectGem()
    a()
    bluePortal.isActive = false
}
bluePortal.isActive = true
for i in 1 ... 3 {
    moveForward()
}
collectGem()
a()
moveForward()
a()
moveForward()
collectGem()
