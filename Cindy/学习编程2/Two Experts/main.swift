let expert = Expert()
for i in 0 ... 7{
    world.place(expert,atColumn: i, row: 4)
    if expert.isOnGem {
        expert.collectGem()
    }
}
for i in 0 ... 6 {
    world.place(expert, atColumn: i, row: 0)
    if expert.isOnGem {
        expert.collectGem()
    }
}
