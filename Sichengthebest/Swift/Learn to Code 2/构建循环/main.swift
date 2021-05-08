let totalGems = randomNumberOfGems
let sijia = Block()
let sibia = Block()
let sidia = Block()
let cijia = Block()
let sigia = Block()
let sifia = Block()
var gems = 0
world.place(sijia, atColumn: 1, row: 0)
world.place(sibia, atColumn: 0, row: 2)
world.place(sidia, atColumn: 1, row: 3)
world.place(cijia, atColumn: 3, row: 3)
world.place(sigia, atColumn: 6, row: 3)
world.place(sifia, atColumn: 6, row: 0)
let eT = Expert()
world.place(eT, facing: north, atColumn: 0, row: 1)
bluePortal.isActive = false
greenPortal.isActive = false
yellowPortal.isActive = false

while gems != totalGems {
    if eT.isOnGem {
        eT.collectGem()
        gems += 1
    } else if eT.isBlocked {
        eT.turnRight()
    } else {
        eT.moveForward()
    }
}
