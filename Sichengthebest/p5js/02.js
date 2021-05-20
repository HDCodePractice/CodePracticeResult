function setup() {
  createCanvas(windowWidth,windowHeight-60);
  frameRate(1);
}

function draw() {
  background(220);
  let flowerX = random(0,width);
  let flowerY = random(0,height);
  let flowerWidth = random(25,150);
  let flowerHeight = random(25,150);
  let flowerXDistance = flowerWidth/2;
  let flowerYDistance = flowerHeight/2;

  for (let i = 0; i < 10; i++) {
    fill(135,40,158);
    // // 左上角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight);
    // // 左下角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight);
    // // 右下角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight);
    // // 右上角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight);
    // 花蕊
    fill(253,242,99);
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
      
    flowerX = random(0,width);
    flowerY = random(0,height);
    flowerWidth = random(25,150);
    flowerHeight = random(25,150);
    flowerXDistance = flowerWidth/2;
    flowerYDistance = flowerHeight/2;
  }  
}

function windowResized() {
  setup();
}

function windowResized() {
  setup()
}