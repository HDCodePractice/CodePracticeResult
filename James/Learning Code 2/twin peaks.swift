let totalGems = randomNumberOfGems
let charecter = Character()
for i in 1 ... 4 {
    world.place(charecter, facing: north, atColumn: 2, row: 0)
    for i in 1 ... 8 {
        charecter.collectGem()
        charecter.jump()
    }
    world.place(charecter, facing: south, atColumn: 4, row: 6)
    for i in 1 ... 8 {
        charecter.collectGem()
        charecter.jump()
    }
    world.place(charecter, facing: north, atColumn: 3, row: 0)
    for i in 1 ... 8 {
        charecter.collectGem()
        charecter.moveForward()
    }
}
