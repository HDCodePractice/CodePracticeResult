// Add any missing rows to your array.
var rows = [0, 1, 3, 4, 5]

// Places a character on each row in rows.
for i in 0 ... 5 {
    world.place(Character(), at: Coordinate(column: 0, row: i))
}
