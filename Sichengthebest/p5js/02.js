function setup() {
  createCanvas(windowWidth, windowHeight-60);
  frameRate(1)
}

function draw() {
  background(220);
  for (let flowerX = 1; flowerX <= width; flowerX += 150) {
    let flowerY = random(0,height);
    let flowerSize = random(30,150);
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
}

function windowResized() {
  setup()
}