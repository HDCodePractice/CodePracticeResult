let totalGems = randomNumberOfGems
for i in 1 ... 2 {
    let person1 = Character()
    world.place(person1, facing: north, atColumn: 2, row: 0)
    for i in 1 ... 2 {
        for i in 1 ... 6 {
            if person1.isOnGem {
                person1.collectGem()
                person1.jump()
            }else{
                person1.jump()
            }
        }
        person1.turnLeft()
        person1.turnLeft()
    }
    person1.collectGem()
    let person2 = Character()
    world.place(person2, facing: north, atColumn: 3, row: 0)
    for i in 1 ... 2 {
        for i in 1 ... 6 {
            if person2.isOnGem {
                person2.collectGem()
                person2.moveForward()
            }else{
                person2.moveForward()
            }
        }
        person2.turnLeft()
        person2.turnLeft()
    }
    person2.collectGem()
    world.place(person1, facing: north, atColumn: 4, row: 0)
    for i in 1 ... 2 {
        for i in 1 ... 6 {
            if person1.isOnGem {
                person1.collectGem()
                person1.jump()
            }else{
                person1.jump()
            }
        }
        person1.turnLeft()
        person1.turnLeft()
    }
    person1.collectGem()
}
