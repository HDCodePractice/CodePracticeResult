function setup() {
    createCanvas(windowHeight-100,windowHeight-100);
  }
   function draw() {
      background(220);
      fill(255,0,0)
      circle(width/4,height/4,width/2)
      circle(width*3/4,height*3/4,width/2)
      circle(width*3/4,height/4,width/2)
      circle(width/4,height*3/4,width/2)
      fill(255,255,0)
      circle(width/2,height/2,width/2); 
  }
  function windowResized() {
    setup();
   }