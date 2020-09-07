let totalGems = randomNumberOfGems
let expert = Expert()
for i in 0...7{
    for j in 0...3{
        if i == 0 || i == 7{
            world.place(expert, atColumn: i, row: j)
            if expert.isOnGem{
                expert.collectGem()
            }
        }else{
            if j == 0 || j == 3{
                world.place(expert, atColumn: i, row: j)
                if expert.isOnGem {
                    expert.collectGem()
                }
            }
        }
    }
}
