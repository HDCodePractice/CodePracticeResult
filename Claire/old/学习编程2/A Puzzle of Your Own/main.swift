for a in 0 ... 7 {
    for b in 0 ... 6 {
        world.place(Character(), atColumn: a, row: b)
    }
}
world.place(Block(), atColumn: 0, row: 10)
let KingOfExperts = Expert()
world.place(KingOfExperts, atColumn: 0, row: 10)
world.place(Gem(), atColumn: 0, row: 10)
KingOfExperts.collectGem()
