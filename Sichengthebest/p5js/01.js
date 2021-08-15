function setup() {
  createCanvas(windowWidth,windowHeight-60);
}

function draw() {
  background(220);
  let houseHeight = 170;
  let houseY = windowHeight-235;
  let houseWidth = 700;
  let houseX = (windowWidth-houseWidth)/2;
  fill(93,93,93);
  // House
  rect(houseX,houseY,houseWidth,houseHeight);
  triangle(houseX,houseY,houseX+houseWidth,houseY,houseX+houseWidth/2,houseY-houseHeight);
  fill(101,67,33);
  // Door
  rect(houseX+(houseWidth-70)/2,houseY+houseHeight/4.5,70,houseHeight/9*7);
}

function windowResized() {
  setup()
}