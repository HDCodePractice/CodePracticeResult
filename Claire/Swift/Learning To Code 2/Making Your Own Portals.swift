let whitePortal = Portal(color: #colorLiteral(red: 0.9999960065, green: 1.0, blue: 1.0, alpha: 1.0))
world.place(whitePortal, atStartColumn: 0, startRow: 5, atEndColumn: 6, endRow: 1)
for i in 1 ... 21 {
    if isOnGem {
        collectGem()
    } else if isBlocked {
        turnRight()
        turnRight()
    } else {
        moveForward()
        turnRight()
        moveForward()
    }
}
