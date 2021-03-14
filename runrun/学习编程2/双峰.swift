let hdcola = Expert()
func collectLineGem(startRow: Int, endRow: Int, colum: Int) {
    for i in startRow ... endRow {
        world.place(hdcola, atColumn: colum, row: i)
        hdcola.collectGem()
    }
}
for i in 1 ... 3 {
    collectLineGem(startRow: 0, endRow: 6, colum: 2)
    collectLineGem(startRow: 0, endRow: 6, colum: 3)
    collectLineGem(startRow: 0, endRow: 6, colum: 4)
}
