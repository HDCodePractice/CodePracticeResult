var gemCounter = 0
var Switchcounter = 0
for i in 1 ... 16 {
    if gemCounter == 0 || (Switchcounter != 0){
        moveForward()
        collectGem()
        toggleSwitch()
        if isBlocked {
            turnRight()
        }
    }
}
