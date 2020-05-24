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
}
func TMMTM() {
    turnBack()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
}
for i in 1 ... 3 {
    turnLeft()
    MCMC()
    TMMTM()
}
turnBack()
moveForward()
for j in 1 ... 2 {
    turnLeft()
    MCMC()
    TMMTM()
}
turnLeft()
MCMC()
