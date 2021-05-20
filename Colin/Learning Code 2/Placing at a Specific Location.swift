let expert = Expert()
func turnAround(){
    expert.turnRight()
    expert.turnRight()
}
world.place(expert, atColumn: 1, row: 6)
expert.collectGem()
world.place(expert, atColumn: 1, row: 1)
expert.collectGem()
world.place(expert, atColumn: 6, row: 1)
expert.collectGem()
