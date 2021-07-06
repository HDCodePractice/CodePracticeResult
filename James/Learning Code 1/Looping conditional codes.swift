for i in 1 ... /*#-editable-code*/12/*#-end-editable-code*/ {
    //#-editable-code
    moveForward()
    if isOnGem {
        collectGem()   
    } 
    if isOnClosedSwitch {
        toggleSwitch()
    }
    //#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
