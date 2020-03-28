var teamBlu: [Character] = []

// Note how many instances of Blu are in your array.
for i in 1...9 {
    teamBlu.append(Character(name: .blu))
}

// Place Blu at each column in row 4.
var columnPlacement = 0
for blu in teamBlu {
    world.place(blu, at: Coordinate(column: columnPlacement, row: 4))
    columnPlacement += 1
}

// Find the index out of range error.
teamBlu[0].jump()
teamBlu[2].collectGem()
teamBlu[4].jump()
teamBlu[6].collectGem()
teamBlu[8].jump()
