func move(distance : Int) {
    for i in 1 ... distance {
        if isOnGem {
            collectGem()
        }
        if isBlocked {
            turnLeft()
            turnLeft()
        }
        moveForward()
    }
}
moveForward()
pinkPortal.isActive=false
move(distance: 7)
pinkPortal.isActive=true
move(distance: 1)
pinkPortal.isActive = false
move(distance: 5)
bluePortal.isActive=false
move(distance: 4)
bluePortal.isActive=true
move(distance: 4)
