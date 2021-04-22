function setup() {
  createCanvas(windowWidth-100, windowHeight-100);
}

function draw() {
  background(220);
    var pandaX=200;
    var pandaY=200;
    var pandaSize=200;
    var pandaDistance=pandaSize/2
  circle(pandaX-pandaDistance,pandaY-pandaDistance/pandaY,pandaSize);
  // left ear (black)
  fill(30,30,30);
  // fill black
  circle(pandaX-pandaDistance+pandaX,pandaY+pandaDistance/pandaDistance,pandaSize);
  // rigeht ear (black)
  fill(30,30,30);
  // fill black
  fill(30,30,30);
  // fill black
  circle(pandaX+pandaDistance-125,pandaY+pandaDistance,pandaSize);
  // face (white)
  fill(250,250,250);
  // fill white
  circle(pandaX-pandaDistance,pandaY+pandaDistance,width/pandaSize);
  // left small eye (white)
  fill(250,250,250);
  // fill white
  circle(pandaX+pandaDistance/20,pandaY+pandaDistance,width/16);
  // right small eye (white)
  fill(250,250,250);
  // fill white
}
