function setup() {
  createCanvas(windowWidth-100, windowHeight-100);
}

function draw() {
  background(220);
    var pandaX=random(0,width);
    var pandaY=random(0,height);
    var pandaSize=random(25,150);
    var pandaDistance=pandaSize/2
  circle(pandaX-pandaDistance,pandaY-pandaDistance/100,pandaSize/4);
  // left ear (black)
  fill(30,30,30);
  // fill black
  circle(pandaX-pandaDistance+150,pandaY+pandaDistance/90,pandaSize/4);
  // rigeht ear (black)
  fill(30,30,30);
  // fill black
  fill(30,30,30);
  // fill black
  circle(pandaX+pandaDistance-125,pandaY+pandaDistance,pandaSize);
  // face (white)
  fill(250,250,250);
  // fill white
  circle(pandaX-pandaDistance,pandaY+pandaDistance,width/16);
  // left small eye (white)
  fill(250,250,250);
  // fill white
  circle(pandaX+pandaDistance/20,pandaY+pandaDistance,width/16);
  // right small eye (white)
  fill(250,250,250);
  // fill white
}
