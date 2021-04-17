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
    fill(255,255,0 )
    circle(width/2,height/2,width/2)
    fill(0,0,0)
    triangle(width*13/17,height*85/170,width*135/170,height*8/17,width*15/17,height*85/170)
    fill(255,255,0)
    ellipse(width*105/170,height*85/170,width*7/17,height*4/17)
    circle(width*75/170,height*75/170,width*5/17)
    fill(0,0,0)
    line(width*105/170,height*65/170,width*105/170,height*105/170)
    line(width*125/170,height*7/17,width*125/170,height*10/17)
    circle(width*65/170,height*65/170,width*1/17)
    circle(width*85/170,height*65/170,width*1/17)
    line(width*85/170,height*53/170,width*85/170,height*4/17)
    line(width*65/170,height*53/170,width*65/170,height*4/17)
    circle(width*65/170,height*4/17,width*1/17)
    circle(width*85/170,height*4/17,width*1/17)
    fill(255,255,255)
    arc(width*75/170,height*85/170,width*2/17,height*2/17,PI,QUARTER_PI,CHORD)
  
  }
  function windowResized() {
      setup();
  }