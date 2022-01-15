let totalGems = randomNumberOfGems
let C = Character()
world.place(C, facing: south, atColumn: 7, row: 3)
for i in 1 ... 7 {
    C.collectGem()
    C.moveForward()
    if C .isBlocked {
        C .turnLeft()
    }
}
C .collectGem()
world.place(C, atColumn: 4, row: 3)
C .collectGem()
