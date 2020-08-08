let totalGems = randomNumberOfGems
let expert = Expert()
var gemCount = 0
while gemCount < totalGems{
    for i in 2 ... 4 {
        for j in 0 ... 6 {
            world.place(expert, atColumn: i, row: j)
            if expert.isOnGem{
                expert.collectGem()
                gemCount += 1
            }
        }
    }
}
