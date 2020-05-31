func FuNcTiOn() {
    moveGet()
    turnLeft()
    turnLeft()
    moveForward()
}
func moveGet() {
    moveForward()
    collectGem()
}
func theFunction() {
    moveGet()
    turnLeft()
    FuNcTiOn()
    turnLeft()
    FuNcTiOn()
    turnLeft()
    moveGet()
}
for i in 1 ... 3 {
    theFunction()
    moveForward()
}
theFunction()
