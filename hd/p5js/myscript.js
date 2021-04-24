let circleY = 25;
let circleX = 250;
let speed = 5;

function setup() {
    createCanvas(500, 500);
}
  
function draw() {
    background(220);
    circle(circleX,circleY,50); 
    if (circleY > height - 30) {
        speed = -5;
    }
    if(circleY < 30){
        speed = 5;
    }
    circleY += speed;
    circleX += speed;
}