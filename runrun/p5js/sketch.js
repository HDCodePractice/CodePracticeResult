function setup() {
  createCanvas(windowHeight-100,windowHeight-100);
}
function draw() {
  background(220);
  fill(247,215,191); 
  circle(width/2,height/2,width);
  fill(32,64,132)
  ellipse(width*1/4,height*1/4,width/5);
  ellipse(width*3/4,height*1/4,width/5);
  fill(255,0,0)
  circle(width*2/4,height*2/4,width/3);
  fill(233,157,180)
  circle(width*0.5/4,height*2/4,width/6)
  circle(width*3.5/4,height*2/4,width/6)
}
function windowResized() {
  setup();
 }