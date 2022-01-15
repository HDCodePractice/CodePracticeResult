let a = Expert()
var gemCount = 0
while gemCount < totalGems {
    for i in 2 ... 4 {
        for j in 0 ... 6 {
            world.place(a, atColumn: i, row: j)
            if a.isOnGem {
                a.collectGem()
                gemCount += 1 
            }
        }
    }
}
