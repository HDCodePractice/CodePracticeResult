func soManyFunctions() {
    turnLeft()
    moveGet()
}
func moveGet() {
    moveForward()
    collectGem()
}
func reapeater() {
    moveGet()
    soManyFunctions()
    turnLeft()
    soManyFunctions()
    soManyFunctions()
    turnLeft()
    soManyFunctions()
    soManyFunctions()
}
for i in 1 ... 3 {
    reapeater()
    moveForward()
}
reapeater()


