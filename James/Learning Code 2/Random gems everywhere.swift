func Gem() {
        collectGem()
        moveForward()
        if isBlocked {
            turnLeft()
        }
}
for i in 1 ... 14 {
    Gem()
}
pinkPortal.isActive=false
for i in 1 ... 8 {
    Gem()
}
turnLeft()
pinkPortal.isActive = true
for i in 1 ... 13{
    Gem()
}
bluePortal.isActive = false
pinkPortal.isActive=false
turnLeft()
for i in 1 ... 13 {
    Gem()
}
turnRight()
bluePortal.isActive = true
for i in 1 ... 4 {
    Gem()
}
