func MCMC() {
    moveForward()
    collectGem()
    toggleSwitch()
    moveForward()
    collectGem()
    toggleSwitch()
}
func turnBack() {
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
turnLeft()
for i in 1 ... 2 {
    MCMC()
    turnBack()
    turnLeft()
    moveForward()
    turnLeft()
}
MCMC()
turnBack()
for i in 1 ... 2 {
    MCMC()
    turnBack()
    turnLeft()
    moveForward()
    turnLeft()
}
MCMC()
