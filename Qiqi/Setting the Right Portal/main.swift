func moveAndCollect() {
     moveForward()
     collectGem()
 }
 func turnAround() {
     turnLeft()
     turnLeft()
 }
 moveForward()
 moveAndCollect()
 turnAround()
 bluePortal.isActive = false
 moveForward()
 moveAndCollect()
 turnAround()
 bluePortal.isActive = true
 pinkPortal.isActive = false
 moveForward()
 moveForward()
 moveAndCollect()
 turnAround()
 pinkPortal.isActive = true
 moveForward()
 turnAround()
 moveAndCollect()
