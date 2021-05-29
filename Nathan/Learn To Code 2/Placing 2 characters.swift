let charater = Character()

let expert = Expert()

world.place(charater, facing: north, atColumn: 0, row: 0)

world.place(expert, facing: north, atColumn: 3, row: 0)

func updown() {
    charater.collectGem()
    charater.jump()
    charater.jump()
}

expert.toggleSwitch()
expert.turnLockUp()
updown()
updown()
charater.turnRight()
updown()
updown()
charater.turnLeft()
charater.collectGem()
charater.move(distance: 2)
charater.collectGem()
