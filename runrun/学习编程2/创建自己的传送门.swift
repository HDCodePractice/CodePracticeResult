let greenPortal = Portal(color: #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0))
world.place(greenPortal, atStartColumn: 1, startRow: 5, atEndColumn: 5, endRow: 1)
greenPortal.isActive=false
var m = 0
while m < 24{
    turnRight()
    if isBlocked {
        if isBlockedLeft {
            turnLeft()
            turnLeft()
        }else {
            turnLeft()
        }
    }
    moveForward()
    m+=1
    collectGem()
    if m == 12 {
        greenPortal.isActive=true
    }else if m == 15 {
        greenPortal.isActive=false
    }
}
