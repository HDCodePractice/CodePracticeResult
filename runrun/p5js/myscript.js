let circleY = 25;
let circleX = 250;
let speedY = 15;
 let speedX = 15;

function setup() {
    createCanvas(500, 500);
    background(220);
}
  
function draw() {
    background(220);
    circle(circleX,circleY,50); 
    if (circleY > height-30) {
        speedX = -15;
        speedY = -15;
    }else if (circleX > width-30) {
        speedX = 15;
        speedY = -15;
 
    }else if (circleX < 30){
        speedX = -15;
        speedY = 15;

    }else if (circleY < 30) {
        speedX = 15
        speedY = 15;
    } 

    circleY += speedX;
    circleX += speedY;
}