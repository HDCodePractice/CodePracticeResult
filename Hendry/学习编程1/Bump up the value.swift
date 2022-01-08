var gemCounter = 0
func moveCollectGem() {
    moveForward()
    collectGem()
    gemCounter+=1
}
for i in 1 ... 5 {
    moveCollectGem()
}
