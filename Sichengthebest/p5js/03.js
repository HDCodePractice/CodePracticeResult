let circleX = 250;
let circleY = 25;
let speedX = 11
let speedY = 11

function setup() {
    createCanvas(500,500);
}

function draw() {
    background(220);
    circle(circleX,circleY,50);
    if (circleY > height-25) {
        speedX = -11;
        speedY = -11;
    } else if (circleX > width-25) {
        speedX = -11;
        speedY = 11;
    } else if (circleX < 25) {
        speedX = 11;
        speedY = -11;
    } else if (circleY < 25) {
        speedX = 11;
        speedY = 11;
    }
    circleX += speedX;
    circleY += speedY;
}