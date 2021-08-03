let greenPortal = Portal(color: #colorLiteral(red: 0.25749900937080383, green: 0.7414730191230774, blue: -0.03451167419552803, alpha: 1.0))
world.place(greenPortal, atStartColumn: 1, startRow:5, atEndColumn: 5, endRow: 1)
moveForward()
for i in 1 ... 4 {
    moveForward()
    collectGem()
    turnRight()
    turnRight()
    moveForward()
    turnLeft()
}
turnRight()
for i in 1 ... 4 {
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
}
