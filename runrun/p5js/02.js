function setup() {
  createCanvas(windowWidth, windowHeight-60);
}

function draw() {
  background(220);
  let flowerX = random(0,width);
  let flowerY = random(0,height);
  let flowerSize = random(25,150);
  let flowerDistance = flowerSize / 2 ;

  fill(255,0,0);
  // 左上角的花瓣
  circle(flowerX-flowerDistance,flowerY-flowerDistance,flowerSize);

  // 左下角的花瓣
  circle(flowerX-flowerDistance,flowerY+flowerDistance,flowerSize);

  // 右下角的花瓣
  circle(flowerX+flowerDistance,flowerY+flowerDistance,flowerSize);

  // 右上角的花瓣
  circle(flowerX+flowerDistance,flowerY-flowerDistance,flowerSize);
  // 花芯
  fill(255,255,0);
  circle(flowerX,flowerY,flowerSize)
}

function windowResized() {
  setup();
}