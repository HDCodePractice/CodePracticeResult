let hd = Character()
for i in 0 ... 6 {
    for j in 0 ... 8 {
        world.place(hd, atColumn:i, row: j)
        hd.collectGem()
        hd.toggleSwitch()
    }
}
