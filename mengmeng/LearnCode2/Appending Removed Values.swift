var row2 = world.coordinates(inRows: [2])
var row3: [Coordinate] = []
for i in 1...12 {
    for coordinate in row2 {
        world.place(Block(), at: coordinate)
    }
    row3.append(row2.remove(at: 0))   
}
for coordinate in row3 {
    world.place(Character(name: .blu), at: coordinate)
}
