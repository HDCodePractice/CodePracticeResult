let columns = [0, 1, 2, 3, 4]
for currentColum in columns {
    world.place(Gem(), atColumn: currentColum, row: 1)
    world.place(Switch(), atColumn: currentColum, row: 1)
}
