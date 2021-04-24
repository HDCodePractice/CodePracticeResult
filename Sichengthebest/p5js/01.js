function setup() {
  createCanvas(windowWidth,windowHeight-60);
  frameRate(1)
}

function draw() {
  background(220);
  for (let houseX = 1; houseX <= width/2; houseX += 100) {
    let houseY = random(height/8,height/1.5);
    let houseHeight = random(height/8,height/6);
    let houseWidth = random(width/4,width/2);
    fill(93,93,93);
    // House
    rect(houseX,houseY,houseWidth,houseHeight);
    triangle(houseX,houseY,houseX+houseWidth,houseY,houseX+houseWidth/2,houseY-houseHeight)
    fill(101,67,33)
    // Door
    rect(houseX+(houseWidth-40)/2,houseY+houseHeight/4.5,40,houseHeight/9*7)
  }
  let houseX = random(0,width/2);
}

function windowResized() {
  setup()
}