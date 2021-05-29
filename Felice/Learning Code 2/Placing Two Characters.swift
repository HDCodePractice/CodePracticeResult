let felice = Character()
let turtle = Expert()
world.place(felice, facing: north, atColumn: 0, row: 0)
world.place(turtle, facing: north, atColumn: 3, row: 0)
func collect() {
    for i in 1 ... 2 {
        felice.collectGem()
        felice.jump()
        felice.jump()
    }
}
turtle.toggleSwitch()
turtle.turnLockUp()
collect()
felice.turnRight()
collect()
felice.turnLeft()
felice.collectGem()
felice.move(distance: 2)
felice.collectGem()
