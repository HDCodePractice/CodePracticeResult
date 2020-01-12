let q = Portal(color: #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0))
world.place(q, atStartColumn: 0, startRow: 5, atEndColumn: 6, endRow: 1)
func collectGems() {
    q.isActive = false
    collectGem()
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    move(distance: 2)
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
    moveForward()
    collectGem()
    q.isActive = true
    turnLeft()
    turnLeft()
    move(distance: 2)
}

for i in 1 ... 2 {
    collectGems()
}
