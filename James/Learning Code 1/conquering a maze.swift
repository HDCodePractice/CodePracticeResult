func a() {
    if isBlocked{
        turnLeft()
    }
    if !isBlocked {
        moveForward()
    }
}
for i in 1 ... 19 {
    a()
}
turnLeft()
for i in 1 ... 5 {
    a()
}
turnRight()
a()
a()
a()
turnLeft()
for i in 1 ... 5 {
    a()
}
turnRight()
a()
a()
collectGem()
