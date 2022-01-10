moveForward()

while isOnClosedSwitch  {
    func openSwitch() {
        if isOnClosedSwitch {
            toggleSwitch()
            moveForward()
        }else {
            moveForward()
        }
        
    }
    
    for i in 1 ... 10 {
        openSwitch()
    }    
    
}
