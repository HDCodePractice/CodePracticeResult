let greenPortal = Portal(color: #colorLiteral(red: 0.4028071761, green: 0.7315050364, blue: 0.2071235478, alpha: 1))
func thing() {
    for i in 1...4{
        moveForward()
        collectGem()
        turnRight()
        turnRight()
        moveForward()
        turnLeft()
    }
}
moveForward()
thing()
world.place(greenPortal, atStartColumn: 1, startRow: 5, atEndColumn: 5, endRow: 1)
moveForward()
turnLeft()
turnLeft()
moveForward()
greenPortal.isActive=false
thing()
