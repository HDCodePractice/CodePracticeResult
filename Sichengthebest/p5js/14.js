function setup() {
    createCanvas(windowWidth,windowHeight-60);
}
  
  function draw() {
    background(220);
    let flowerX = width/2;
    let flowerY = height/2;
    let flowerWidth = width/10;
    let flowerHeight = height/5;
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;
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
  }
  
  function windowResized() {
    setup();
  }