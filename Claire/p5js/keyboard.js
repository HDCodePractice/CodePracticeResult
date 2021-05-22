var xposition;
var yposition;
let circleSpeed = 3;
let humanSpeed = 10;
let size = 59;
var circleX = 50;
var circleY = 20;
let score = 0;
let humanSize = 50;

function setup() {
    createCanvas(windowWidth,windowHeight-50)
    img = createImg('https://wallpapercave.com/wp/wp5034369.jpg');
    image(img,width/500,0,width+200,height+100);
    img.hide();
    xposition = width/2;
    yposition = height-50;
}   

function mypanda(x,y,size){
    var pandaX=x;
    var pandaY=y;
    var pandaSize=size;
    var pandaDistance=pandaSize/2;
    fill(255,255,255);
    circle(pandaX,pandaY,pandaSize);
    fill(0,0,0);
    circle(pandaX-pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(0,0,0);
    circle(pandaX+pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(0,0,0);
    circle(pandaX,pandaY+pandaSize*1/10,pandaSize/8);
    fill(255,255,255);
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    fill(0,0,0);
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
    fill(255,255,255);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    fill(0,0,0);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
}
// x1 = 250
// x2 = 325
// y1 = 277
// y2 = 347
function draw() {
    background(250)
    circleY += circleSpeed;
    if (xposition<=circleX+size&&xposition>=circleX-size&&yposition<=circleY+size&&yposition>=circleY){
        circleY = 0
        circleX = random(20,width-20)
        score +=1
      }else if (circleY > height){
        circleY = 0
        circleX = random(20,width-20)
        score -= 1
    }

    if (keyIsPressed){
        if (keyCode == LEFT_ARROW) {
            if (xposition > 30) {
                xposition -= humanSpeed;
            }
        } else if (keyCode == RIGHT_ARROW) {
            if (xposition < width-30) {
                xposition += humanSpeed;
            } 
        }else if (keyCode == UP_ARROW){
            circleSpeed += 1;
            humanSpeed += 1;
            humanSize -= 5;
        } else if (keyCode == DOWN_ARROW){
            if (circleSpeed >= 2){
                circleSpeed -= 1;
                humanSpeed -= 1;
                humanSize += 5;
            }
        }
    }
    fill(0,0,0);
    mypanda(xposition,yposition,humanSize);
    textSize(15);
    fill(0,0,0);
    strokeWeight(2);
    text('⇦   turn LEFT',10,50);
    text('⇨   turn RIGHT',10, 75);
    text('⇧   more DIFFICULT',10, 100);
    text('⇩   more EASIER',10, 125);
    text('Try to catch as many coins as you can!',10,150)
    text('Your Score: '+score,10,20);
    fill(255,255,0)
    circle(circleX,circleY,20)
    }

function windowResized() {
    setup();
}