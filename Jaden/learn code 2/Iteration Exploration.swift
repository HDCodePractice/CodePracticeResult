let columns = [0, 1, 2, 3, 4,]

// Give your loop variable a name and pass in your array.
for i in columns {
    // Place a gem and a switch for each column.
    world.place(Gem(), atColumn: i, row: 1)
    world.place(Switch(), atColumn: i, row: 1)
}
