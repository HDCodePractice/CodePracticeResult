let size = 300;
let circleX = 0;
let circleY = 100;
let speed = 5;
let speedY = speed/3;
let speedX = speed;
let isNight = false;

function setup() {
    createCanvas(size, size);
}

function draw() {
    var pandaX=x;
  var pandaY=y;
  var pandaSize=size;
  var pandaDistance=pandaSize/2;
  circle(pandaX,pandaY,pandaSize);
  fill(0,0,0)
  circle(pandaX-pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
  fill(0,0,0)
  circle(pandaX+pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
  fill(0,0,0)
  circle(pandaX,pandaY+pandaSize*1/10,pandaSize/8);
  fill(0,0,0)
  circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
  fill(250,250,250)
  circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
  circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
  circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
}