bluePortal.isActive = false
func stuff() {
    for i in 1 ... 7 {
        if isBlocked{
            turnLeft()
            turnLeft()
        }
        moveForward()
        collectGem()
    }
}
stuff()
pinkPortal.isActive = false
bluePortal.isActive = true
stuff()
bluePortal.isActive = false
stuff()
