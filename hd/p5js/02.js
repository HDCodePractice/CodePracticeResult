function setup() {
  createCanvas(windowWidth, windowHeight-60);
}

function draw() {
  background(220);
  fill(255,0,0);
  // 左上角的花瓣
  ellipse(width/4,1*(height/4),width/2,height/2);

  // 左下角的花瓣
  ellipse(width/4,3*(height/4),width/2,height/2);

  // 右下角的花瓣
  ellipse(3*(width/4),3*(height/4),width/2,height/2);

  // 右上角的花瓣
  ellipse(3*(width/4),height/4,width/2,height/2);
  fill(255,255,0);
  ellipse(width/2,height/2,width/2,height/2)
}

function windowResized() {
  setup();
}