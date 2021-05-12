let size = 300;
let circleX = 0;
let circleY = 100;
let speed = 5;
let speedY = speed/3;
let speedX = speed;
let isNight = false;

function sunMoon(x,y,color1) {
   fill(color1);
   circle(x,y,50) 
}

function happyFace (x, y, diam,color) {
    fill(color);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, diam, diam);
    var startAng = .1*PI
    var endAng = .9*PI
    var smileDiam = .6*diam;
    arc(x, y, smileDiam, smileDiam, startAng, endAng);
    var offset = .2*diam;
    var eyeDiam = .1*diam;
    fill(0);
    ellipse(x-offset, y-offset, eyeDiam, eyeDiam);
    ellipse(x+offset, y-offset, eyeDiam, eyeDiam);
}

function setup() {
    createCanvas(size, size);
}
  
function draw() { 
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
    if (isNight){
        background(0,0,0);
        happyFace(50,290,25,'rgb(140, 140, 0)');
        happyFace(150,275,50,'rgb(140, 140, 0)');
        happyFace(250,290,25,'rgb(140, 140, 0)');
        sunMoon(circleX,circleY,'rgb(255,255,255)')
    }else{
        background(0,0,255)
        happyFace(50,290,25,'rgb(255, 255, 0)');
        happyFace(150,275,50,'rgb(255, 255, 0)');
        happyFace(250,290,25,'rgb(255, 255, 0)');
        sunMoon(circleX,circleY,'rgb(255,255,0)')
    }
    circle(circleX,circleY,50); 
}