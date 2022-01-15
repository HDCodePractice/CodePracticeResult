let charecter = Character()
for i in 1 ... 7 {
    toggleSwitch()
    moveForward()
}
world.place(charecter, atColumn: 6, row: 0)
charecter.collectGem()
world.place(charecter, atColumn: 4, row: 0)
charecter.collectGem()
world.place(charecter, atColumn: 2, row: 0)
charecter.collectGem()
