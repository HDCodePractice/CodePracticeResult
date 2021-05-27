let greenPortal = Portal(color: #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0))
world.place(greenPortal, atStartColumn: 1, startRow: 5, atEndColumn: 5, endRow: 1)
var gemCounter = 0
while gemCounter < 8 {
    moveForward()
    if gemCounter == 4 {
        turnLeft()
        turnLeft()
    } else {
        turnLeft()
    }
    moveForward()
    collectGem()
    gemCounter = gemCounter + 1
    turnLeft()
    turnLeft()
} 
