let totalGems = randomNumberOfGems
let expert = Expert()
var gem = 0
while gem<totalGems{
    for i in 0 ... 5 {
        for j in 2 ... 4 {
            
            world.place(expert, facing: north, atColumn: j, row: i)
            expert.collectGem()
            gem += 1
        }
        
    }
    
}
