function setup() {
    createCanvas(400,400);
  }
  
  function draw() {
    background(220);
    var pandaX=random(0,width);
    var pandaY=random(0,height);
    var pandaSize=random(5,200);
    circle(pandaX,pandaY,pandaSize);
    fill(30,30,30)
    circle(pandaX-pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(30,30,30)
    circle(pandaX+pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(30,30,30)
    circle(pandaX,pandaY+pandaSize*1/10,pandaSize/8);
    fill(30,30,30)
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    fill(255,255,255)
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
  }  
