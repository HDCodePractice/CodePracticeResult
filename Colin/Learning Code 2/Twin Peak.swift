let totalGems = randomNumberGems
let character = Character()
var gemCounter = 0
while gemCounter < totalGems{
    for i in 2...4{
        for j in 0...6{
            world.place(character, atColumn: i, row: j)
            if character.isOnGem{
                character.collectGem()
                gemCounter+=1
            }
        }
    }
}
