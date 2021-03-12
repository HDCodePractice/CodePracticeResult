let hdcola = Expert()
func collectLineGem(startRow: Int, endRow: Int, colum: Int) {
    for i in startRow ... endRow {
        world.place(hdcola, atColumn: colum, row: i)
        hdcola.collectGem()
    }
}
collectLineGem(startRow: 5, endRow: 8, colum: 1)
collectLineGem(startRow: 5, endRow: 5, colum: 4)
collectLineGem(startRow: 1, endRow: 5, colum: 5)
