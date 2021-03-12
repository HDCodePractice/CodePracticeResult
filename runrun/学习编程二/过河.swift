let hdcola = Expert()
for i in 1 ... 5 {
    for j in 1 ... 8 {
        world.place(hdcola, atColumn: i, row: j)
        hdcola.collectGem()
    }
}
