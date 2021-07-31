func turnAroundMove() {
    turnAround()
    moveForward()
}
func check() {
    if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
}
func turnAround() {
    turnLeft()
    turnLeft()
}
func moveAndSolve() {
    moveForward()
    moveForward()
    solve()
}
func solve() {
    for i in 1 ... 4 {
        moveForward()
        check()
        turnAroundMove()
        turnLeft()
    }
}
greenPortal.isActive = false
orangePortal.isActive = false
turnRight()
moveAndSolve()
orangePortal.isActive = true
turnLeft()
moveForward()
orangePortal.isActive = false
solve()
turnAroundMove()
moveAndSolve()
greenPortal.isActive = true
moveForward()
turnAroundMove()
greenPortal.isActive = false
solve()
