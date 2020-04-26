func 收集短边(){
    moveForward()
    collectGem()
    moveForward()
    toggleSwitch()
    moveForward()
}

func 收集长边(){
    收集短边()
    moveForward()
}

收集短边()
turnLeft()
收集长边()
turnLeft()
收集短边()
turnLeft()
收集长边()
