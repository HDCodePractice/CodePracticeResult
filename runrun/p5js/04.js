var score = 0
var xspeed = 200;
var yspeed = 0;
var Xspeed = 0;
var Yspeed = 0;
var speed = 5;
let circleX = 0
let circleY = 0
var size = 55
function setup() {
    createCanvas(windowWidth,windowHeight-60); 
     Xspeed = 0;
     Yspeed = height-60;
    background(220);
}
function windowResized() {
    setup();
}
function draw() {
    background(220);
    yspeed += speed
    
    fill(0,0,244)
    text("吉尼斯最佳纪录: " + score,10, 30);
    yspeed+=3;
    if (Xspeed<=xspeed+size&&Xspeed>=xspeed-size&&Yspeed<=yspeed+size&&Yspeed>=yspeed) {
        yspeed = 0;
        xspeed = random(width);
        score+=1 
    }else if (yspeed > height-60) {
        yspeed = 0;
        xspeed = random(width);
        score-=1
    }
    fill(213,100,195);
    circle(xspeed,yspeed,50);
    fill(158,252,254);
    square(Xspeed, Yspeed, size);
    if (keyIsPressed){ 
        if (keyCode === LEFT_ARROW){
           Xspeed -= 5;
       } else if (keyCode === RIGHT_ARROW){
         Xspeed += 5;
       } 
     }
     
      //square(175, 20, 55);
    }
  