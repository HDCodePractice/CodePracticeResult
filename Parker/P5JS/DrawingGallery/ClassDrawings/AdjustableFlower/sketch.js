function setup() {                           
  createCanvas(windowWidth, windowHeight);
}

function draw() {
  background(0, 143, 24);
  fill(255, 166, 0);
  ellipse(width/3,height/2,width/4,height/4);
  ellipse((width/3)+(width/4),height/2,width/4,height/4);
  ellipse(width/3,(height/2)+(height/4),width/4,height/4);
  ellipse((width/3)+(width/4),(height/2)+(height/4),width/4,height/4);
  fill(255,0,0);
  ellipse((width/3)+(width/8),(height/2)+(height/8),width/4,height/4); 
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}