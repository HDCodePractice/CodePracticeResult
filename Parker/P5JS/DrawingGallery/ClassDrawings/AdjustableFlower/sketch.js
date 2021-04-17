
function setup() {
  createCanvas(windowWidth, windowSize);
  frameRate(1);
}

function draw() {
  let flowerX = random(0, width);
  let flowerY = random(0, height);
  let flowerSize = random(25, 150);
  let flowerDistance = flowerSize / 2;
  background(0, 200, 0);
  fill(255, 128, 0);
  circle(flowerX - flowerDistance, flowerY - flowerDistance, flowerSize);
  circle(flowerX + flowerDistance, flowerY - flowerDistance, flowerSize);
  circle(flowerX - flowerDistance, flowerY + flowerDistance, flowerSize);
  circle(flowerX + flowerDistance, flowerY + flowerDistance, flowerSize);
  fill(255, 0, 0);
  circle(flowerX, flowerY, flowerSize);
}