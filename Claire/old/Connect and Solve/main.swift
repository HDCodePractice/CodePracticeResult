let character1 = Character()
world.place(character1, atColumn: 2, row: 0)
let character2 = Character()
world.place(character2, atColumn: 4, row: 0)
let character3 = Character()
world.place(character3, atColumn: 6, row: 0)
while !isBlocked {
    if isOnClosedSwitch {
        toggleSwitch()
    }
    moveForward()
}
toggleSwitch()
character1.collectGem()
character2.collectGem()
character3.collectGem()
