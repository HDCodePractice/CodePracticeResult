var xposition;
var yposition;
let speed = 15

function setup() {
    createCanvas(windowWidth,windowHeight-45)
    xposition = width/2;
    yposition = height/2
}   
function draw() {
    background(250)
    if (keyIsPressed){
        if (keyCode === UP_ARROW) {
            if (yposition > 25) {
                yposition -= speed; 
            }
        } else if (keyCode === DOWN_ARROW) {
            if (yposition < height-20) {
                yposition += speed;
            }
        } else if (keyCode === LEFT_ARROW) {
            if (xposition > 25) {
                xposition -= speed;
            }
        } else if (keyCode === RIGHT_ARROW) {
            if (xposition < width-25) {
                xposition += speed;
            } 
        }
    } 
    circle(xposition,yposition,30)
}

function windowResized() {
    setup();
}