function setup() {
  createCanvas(windowWidth, windowHeight-60);
}

function draw() {
  background(220);
  let mouseX = 200;
  let mouseY = 200;
  let mouseSize = 200;

  fill(255,255,255);
  circle(mouseX,mouseY,mouseSize);
  fill(216,61,99);
  circle(mouseX-mouseSize/2,mouseY-mouseSize/2,mouseSize/2);
  circle(mouseX+mouseSize/2,mouseY-mouseSize/2,mouseSize/2);
  fill(30,30,30);
  circle(mouseX-mouseSize/5,160,30);
  circle(mouseX+mouseSize/5,160,30);
  circle(200,230,10);
  line(190,230,140,220);
  noFill();
  arc(300, 300, 80, 80, 0, PI + QUARTER_PI, OPEN);
}
