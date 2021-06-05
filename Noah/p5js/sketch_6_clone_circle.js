let circleY = 25;
let circleX = 250;
let speedX = 5;
let speedY = 5;

function setup() {
    createCanvas(500, 500);
    background(0)
}

function draw() {
    fill(random(0,500),random(0,500),random(0,500))
    circle(circleX,circleY,50); 
    if (circleX > (width - 30)) {
       speedX = -5;
       speedY = 5;
    }
    if (circleY > (height - 30)){
        speedX = -5;
        speedY = -5;
    }
    if (circleX < 30) {
        speedX = 5;
        speedY = -5;
    }
    if (circleY < 30){
        speedX = 5;
        speedY = 5;
    }
    circleY += speedY;
    circleX += speedX;
}