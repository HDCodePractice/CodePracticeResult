function setup() {
  createCanvas(windowWidth,windowHeight-60);
  background(220);
}

function mycircle(x,y,size,color){
  fill(color);
  circle(x,y,size);
}

function yellowCircle(x,y){
  mycircle(x,y,20,"rgb(255,255,0)");
}

function redCircle(x,y){
  mycircle(x,y,30,"rgb(255,0,0)");
}

function aCircle(x,y){
  mycircle(x,y,5,"rgb(1,30,230)")
}

function myflower(x,y,size,color1,color2){
  let flowerX = x;
  let flowerY = y;
  let flowerWidth = size;
  let flowerHeight = size;
  let flowerXDistance = flowerWidth/2;
  let flowerYDistance = flowerHeight/2;
  fill(color2)
  // // 左上角的花瓣
  ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
  // // 左下角的花瓣
  ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
  // // 右下角的花瓣
  ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
  // // 右上角的花瓣
  ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
  // 花蕊
  fill(color1)
  ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
}


function mouseMoved(){
  aCircle(mouseX,mouseY);
}

function mousePressed(){
  yellowCircle(mouseX,mouseY);
}

function doubleClicked(){
  myflower(mouseX,mouseY,50,'rgb(0,242,5)','rgb(0,40,158)');
}

function draw() {
}

function windowResized() {
  setup();
}