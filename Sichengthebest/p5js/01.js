function setup() {
  createCanvas(windowWidth,windowHeight-60);
  frameRate(1)
}

function draw() {
  background(220);
  let houseHeight = 170;
  let houseY = windowHeight-235;
  let houseWidth = 700;
  let houseX = (windowWidth-houseWidth)/2
  fill(93,93,93);
  // House
  rect(houseX,houseY,houseWidth,houseHeight);
  triangle(houseX,houseY,houseX+houseWidth,houseY,houseX+houseWidth/2,houseY-houseHeight)
  fill(101,67,33)
  // Door
  rect(houseX+(houseWidth-70)/2,houseY+houseHeight/4.5,70,houseHeight/9*7)
  // Sun/Moon
  fill(255,255,0)
  k = windowHeight-60
  speed = 1
  x = 400
  y = k/x
  circle(x,y,50)
  x += speed
}

function windowResized() {
  setup()
}