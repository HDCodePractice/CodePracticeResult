let character = Character()
for i in 1 ... 2 {
    for j in 1 ... 2 {
        world.place(character, atColumn: i, row: j)
        if character.isOnGem {
            character.collectGem()
        }else{
            character.toggleSwitch()
        }

        
    }
    
}
for i in 1 ... 2{
    for j in 6 ... 7 {
        world.place(character, atColumn: i, row: j)
        if character.isOnGem {
            character.collectGem()
        }else{
            character.toggleSwitch()
        }
        
        
    }
    
}
for i in 5 ... 6{
    for j in 3 ... 4 {
        world.place(character, atColumn: i, row: j)
        if character.isOnGem {
            character.collectGem()
        }else{
            character.toggleSwitch()
        }
        
        
    }
    
}
