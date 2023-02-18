func collectOrToggle{
  if isOnClosedSwitch {
        toggleSwitch()
        
    }else if isOnGem {
        collectGem()
        
    }
}   





for i in 1 ... 15 {
    moveForward()
    collectOrToggle()
    if i == 4{
        turnLeft()
        
    }else if i == 6{
        turnLeft()
        
    } else if i == 10{
        turnRight()
        
    }else if i == 11{
        turnRight()
        
    }

    
}
