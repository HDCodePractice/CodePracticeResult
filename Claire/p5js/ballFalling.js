function setup() {
    createCanvas(400,400);
  }
let circleY = 0;
function draw() {
  background(32);
  circle(100, circleY, 50);
  circleY = circleY + 1;
}