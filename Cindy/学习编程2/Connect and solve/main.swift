let Character = character()
l;''for i in 1 ... 6{
    world.place(character, atColumn: i, row: 4)
    if character.isOnClosedSwitch {
        character.toggleSwitch()
    }
}
for i in 1 ... 6{
    world.place(character, atColumn: i, row: 0）
    if character.isOnGem {
        character.collectGem()
    } 
}
