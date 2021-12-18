let size = 300;
let circleX = 0;
let circleY = 100;
let speed = 5;
let speedY = speed/3;
let speedX = speed;
let isNight = false;


function setup() {
  createCanvas(windowWidth-100, windowHeight-100);
  background(220);
}

function sunMoon(x,y,sunColor) {
  fill(sunColor);
  circle(x,y,50);
}

function panda(x,y,size,black,white) {
    var pandaX=x;
    var pandaY=y;
    var pandaSize=size;
    var pandaDistance=pandaSize/2;
    circle(pandaX,pandaY,pandaSize);
    fill(black);
    circle(pandaX-pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(black);
    circle(pandaX+pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(black);
    circle(pandaX,pandaY+pandaSize*1/10,pandaSize/8);
    fill(black);
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
    fill(white);
}

function draw(){
  background(220); 
    if (circleX > width) {
        circleX = 0;
        circleY = 100;
        if (isNight){
            isNight = false;
        }else{
            isNight = true;
        }
    }else if (circleX < 25){
        speedX = speed;
    }
    if (circleX < width/2){
        circleY -= speedY;
    }else{
        circleY += speedY;
    }
    circleX += speedX;
    if(isNight){
        panda(width/2,height-width/5,width/5,'rgb(255,255,255','rgb(0,0,0)');
        panda(width/5,height-width/10,width/10,'rgb(250,250,250','rgb(0,0,0)');
        panda(width/1.25,height-width/10,width/10,'rgb(250,250,250','rgb(0,0,0)');
        sunMoon(circleX,circleY,'rgb(250,250,250)');
    }else{
        panda(width/2,height-width/5,width/5,'rgb(250,250,250','rgb(206,59,52)');
        panda(width/5,height-width/10,width/10,'rgb(250,250,250','rgb(206,59,52)');
        panda(width/1.25,height-width/10,width/10,'rgb(250,250,250','rgb(206,59,52)');
        sunMoon(circleX,circleY,'rgb(252,241,123)');
    }
}