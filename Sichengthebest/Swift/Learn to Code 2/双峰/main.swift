let totalGems = randomNumberOfGems
var gems = 0
func characterCollectsRow(character: Character) {
    for i in 1 ... 6 {
        if character.isOnGem {
            character.collectGem()
            gems += 1
        }
        character.jump()
    }
    character.turnLeft()
    character.turnLeft()
}

let mort = Character()
world.place(mort, facing: north, atColumn: 4, row: 0)
let mortal = Character()
world.place(mortal, facing: north, atColumn: 3, row: 0)
let mortality = Character()
world.place(mortality, facing: north, atColumn: 2, row: 0)
while gems < totalGems {
    characterCollectsRow(character: mortality)
    if gems < totalGems {
        characterCollectsRow(character: mort)
    }
    if gems < totalGems {
        characterCollectsRow(character: mortal)
    }
}
