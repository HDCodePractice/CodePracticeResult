let expert =  Expert ()
world.place (expert, atColumn : 2 , row : 6 )
func  collectAndTurnLock () {
    expert.turnRight ()
    expert.moveForward ()
    expert.collectGem ()
    expert.turnLeft ()
    expert.turnLeft ()
    expert.moveForward ()
    expert.turnLockUp ()
    expert.turnRight ()
}
collectAndTurnLock ()
expert.move ( distance : 5 )
collectAndTurnLock ()
expert.move ( distance : 6 )
expert.collectGem ()
