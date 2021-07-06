func collectOrToggle() {
    //#-editable-code
    if isOnClosedSwitch {
        toggleSwitch()
        moveForward()
        moveForward()
    } else if isOnOpenSwitch {
        moveForward()
        moveForward()
    } else if isOnGem {
        collectGem()
        moveForward()
        moveForward()
    } else {
        moveForward()
        moveForward()
        
    }    //#-end-editable-code
}
//#-editable-code
collectOrToggle()
collectOrToggle()
turnLeft()
collectOrToggle()
turnLeft()
collectOrToggle()
collectOrToggle()
turnRight()
collectOrToggle()
turnRight()
collectOrToggle()
collectOrToggle()
collectOrToggle()
//#-end-editable-code
