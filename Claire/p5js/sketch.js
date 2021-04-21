function setup() {
  createCanvas(windowWidth-100, windowHeight-100);
}

function draw() {
  background(220);
    var pandaX=200;
    var pandaY=200;
    var pandaSize=200;
    var pandaDistance = pandaSize/2
  circle(pandaX-pandaDistance,height/4,width/4);
  // left ear (black)
  fill(30,30,30);
  // fill black
  circle(width*3/1.455,height*3/4,width/4);
  // right ear (black)
  fill(30,30,30);
  // fill black
  circle(width/2,height/1.739,width/16);
  circle(width/2.667,height/2.268,width/8);
  // left big eye (black)
  fill(30,30,30);
  // fill black
  circle(width*3/1.633,height*3/2.268,width/8);
  // right big eye (black)
  fill(30,30,30);
  // fill black
  circle(width*3/1.633,height*3/2.286,width/26.667);
  // right tiny eye (black)
  fill(30,30,30);
  // fill black
  circle(width/2.667,height/2.286,width/26.667);
  // left tiny eye (black)
  fill(30,30,30);
  // fill black
  circle(pandaX,pandaY,pandaSize);
  // face (white)
  fill(250,250,250);
  // fill white
  circle(width/2.667,height/2.286,width/16);
  // left small eye (white)
  fill(250,250,250);
  // fill white
  circle(width/1.633,height/2.286,width/16);
  // right small eye (white)
  fill(250,250,250);
  // fill white
}
