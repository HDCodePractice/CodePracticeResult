let character = Character ()
world.place(character, atColumn : 2 , row : 1 )
func  moveAndCollect () {
    for i in  1  ...  5 {
        character.collectGem ()
        character.toggleSwitch ()
        character.turnRight ()
        character.jump ()
    }
}
moveAndCollect()
world.place (character, atColumn : 6 , row : 4 )
moveAndCollect()
character.toggleSwitch ()
world.place (character, atColumn : 1 , row : 6 )
moveAndCollect()
character.turnRight ()
character.jump ()
character.toggleSwitch ()
