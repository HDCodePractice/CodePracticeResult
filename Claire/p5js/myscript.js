var xposition;
var yposition;
let circleSpeed = 5;
let humanSpeed = 7;
let size = 59;
let circleX = 0;
let circleY = 0;
let score = 0;
let humanXarea = 0;

function setup() {
    createCanvas(windowWidth,windowHeight-50)
    xposition = width/2;
    yposition = height-50;
    fill(25,255,255);
    circleX = random(20, width-20)
}   

function human(x,y,size){

}

function draw() {
    background(250)
    circleX += speed;
    



    if (keyIsPressed){
        } else if (keyCode === LEFT_ARROW) {
            if (xposition > 50) {
                xposition -= humanSpeed;
            }
        } else if (keyCode === RIGHT_ARROW) {
            if (xposition < width-50) {
                xposition += humanSpeed;
            } 
        }
        circle(xposition,yposition,50)
        text()
    }

function windowResized() {
    setup();
}