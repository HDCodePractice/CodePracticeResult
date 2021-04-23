function setup() {
  createCanvas(windowHeight-100,windowHeight-100);
  frameRate(10);
}

function draw() {
  background(220);
  var clownX = random(0,width);
    var clownY =  random(0,height);
    var clownSize = random(0,width) ;
  
  for (let i = 0; i < 10; i++) {
     clownX = random(0,width);
     clownY =  random(0,height);
     clownSize = random(0,width) ;
    fill(247,215,191); 
    circle(clownX,clownY,clownSize);
    fill(32,64,132)
    ellipse(clownX-clownSize/4,clownY-clownSize/4,clownSize/5);
    ellipse(clownX+clownSize/4,clownY-clownSize/4,clownSize/5);
    fill(255,0,0);
    circle(clownX,clownY,clownSize/3);
    fill(233,157,180);
    circle(clownX-clownSize/3,clownY,clownSize/5);
    circle(clownX+clownSize/3,clownY,clownSize/5); 
}
  
  } 

function windowResized() {
  setup();
 }
 