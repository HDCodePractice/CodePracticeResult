func collectOne(colume:Int, row:Int) {
    let expert = Expert()
    world.place(expert, atColumn: colume, row: row)
    if expert.isOnClosedSwitch{
        expert.toggleSwitch()
    }
    if expert.isOnGem{
        expert.collectGem()
    }
}
collectOne(colume: 1, row: 7)
collectOne(colume: 1, row: 6)
collectOne(colume: 2, row: 6)
collectOne(colume: 2, row: 2)
collectOne(colume: 2, row: 1)
collectOne(colume: 1, row: 1)
collectOne(colume: 5, row: 4)
collectOne(colume: 6, row: 4)
collectOne(colume: 6, row: 3)
