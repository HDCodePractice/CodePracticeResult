let character = Character()
let portal = Portal(color: #colorLiteral(red: 0.7936894298, green: 0.9429106116, blue: 0.9972818494, alpha: 1.0))
world.place(portal, atStartColumn: 1, startRow: 5, atEndColumn: 5, endRow: 1)
portal.isActive = false
moveForward()
func gem() {
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnLeft()
}
for i in 1 ... 4 {
    gem()
}
portal.isActive = true
gem()
portal.isActive = false
for i in 1 ... 4 {
    gem()
}
