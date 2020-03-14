let greenPortal = Portal(color: #colorLiteral(red: 0.4028071761, green: 0.7315050364, blue: 0.2071235478, alpha: 1))

world.place(greenPortal, atStartColumn: 1, startRow: 5, atEndColumn: 5, endRow: 1)

func island() {
    for i in 1 ... 3 {
        moveForward()
        collectGem()
        turnRight()
        turnRight()
        moveForward()
        turnRight()
    }
    moveForward()
    collectGem()
    turnRight()
    turnRight()
    greenPortal.isActive = true
}

greenPortal.isActive = false
moveForward()
island()
moveForward()
greenPortal.isActive = false
island()
