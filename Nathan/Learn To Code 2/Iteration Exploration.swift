let columns = [0, 1, 2, 3, 4]

// Giveing the loop variable a name and pass in the array.
for currentColumn in columns {
    // Placing a gem and a switch for each column.
    world.place(Gem(), atColumn: currentColumn, row: 1)
    world.place(Switch(), atColumn: currentColumn, row: 1)
}
