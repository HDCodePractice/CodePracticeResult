let hdcola = Expert()
func kuaipao(dist: Int) {
    for i in 1 ... dist {
        hdcola.collectGem()
        hdcola.moveForward()
    }
}
world.place(hdcola, atColumn: 1, row: 8)
kuaipao(dist: 3)
hdcola.turnLockDown()
hdcola.turnLeft()
kuaipao(dist: 4)
hdcola.turnLockUp()
hdcola.turnRight()
kuaipao(dist: 5)
