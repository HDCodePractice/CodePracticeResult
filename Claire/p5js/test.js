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

function panda(x,y,size,black,white) {
    var pandaX=x;
    var pandaY=y;
    var pandaSize=size;
    var pandaDistance=pandaSize/2;
    circle(pandaX-pandaDistance,pandaY-pandaDistance/pandaY,pandaSize);
    // left ear (black)
    fill(black);
    // // fill black
    circle(pandaX-pandaDistance+pandaX,pandaY+pandaDistance/pandaDistance,pandaSize);
    // rigeht ear (black)
    fill(black);
    // fill black
    fill(black);
    // fill black
    circle(pandaX+pandaDistance-125,pandaY+pandaDistance,pandaSize);
    // face (white)
    fill(white);
    // fill white
    circle(pandaX-pandaDistance,pandaY+pandaDistance,width/pandaSize);
    // left small eye (white)
    fill(white);
    // fill white
    circle(pandaX+pandaDistance/20,pandaY+pandaDistance,width/16);
    // right small eye (white)
    fill(white);
    // fill white
  }

function sunMoon(x,y,color1){
    fill(color1);
    circle(x,y,50)
}

function draw() {
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
        sunMoon(circleX,circleY,'rgb(250,250,250)');
    }else{
        sunMoon(circleX,circleY,'rgb(252,241,123)')
    }
    panda(100,100,100,'rgb(100,100,100)','rgb(100,100,100)')
}