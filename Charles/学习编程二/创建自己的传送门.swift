let greenPortal = Portal(color: #colorLiteral(red: 0.4028071761, green: 0.7315050364, blue: 0.2071235478, alpha: 1))
world.place(greenPortal, atStartColumn: 5, startRow: 1, atEndColumn: 1, endRow: 5)
func turnaround() {
    turnLeft()
    turnLeft()
}
func q() {
    for i in 1 ... 4 {
        collectGem()
        moveForward()
        turnRight()
        moveForward()
        turnaround()
    }
}
greenPortal.isActive = false
q()
greenPortal.isActive = true
move(distance: 2)
turnaround()
greenPortal.isActive = false
q()
