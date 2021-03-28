let coordinate = Coordinate(column: 2, row: 2)
var coordinates : [Coordinate]=[]
for i in coordinates {
    world.place(Character(), at: i)
}
for i in 2 ... 2 {
    for j in 2 ... 6{
        world.place(Character(), atColumn:i, row: j)
    }
    for i in 2 ... 6 {
        for j in 2 ... 2{
            world.place(Character(), atColumn:i, row: j)
        }
    }
    for i in 6 ... 6 {
        for j in 2 ... 6{
            world.place(Character(), atColumn:i, row: j)
        }
    }
    for i in 2 ... 6 {
        for j in 6 ... 6{
            world.place(Character(), atColumn:i, row: j)
        }
    }
    for i in 3 ... 3{
        for j in 2 ... 6{
            world.place(Character(), atColumn:i, row: j)
        }
    }
    for i in 4 ... 4{
        for j in 2 ... 6{
            world.place(Character(), atColumn:i, row: j)
        }
    }
    for i in 5 ... 5 {
        for j in 2 ... 6{
            world.place(Character(), atColumn:i, row: j)
        }
    }
}

