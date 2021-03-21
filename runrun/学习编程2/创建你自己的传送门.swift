let greenPortal = Portal(color: #colorLiteral(red: 0.25749900937080383, green: 0.7414730191230774, blue: -0.03451167419552803, alpha: 1.0))
world.place(greenPortal, atStartColumn: 0, startRow: 5, atEndColumn: 4, endRow: 1)
for i in 1 ... 21 {
    collectGem()
    moveForward()
    turnRight()
}
