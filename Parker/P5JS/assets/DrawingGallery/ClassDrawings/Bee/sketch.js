let circleY = 250;
let circleX = 25;
let speedX = 5;
let speedY = 5;

function setup() {
    createCanvas(500, 500);
    
}
  
function draw() {
    background(0, 195, 255);
    fill(255, 255, 0)
    
    if (circleX > width-26){
        speedX = -5;
    }else if (circleX < 26){
        speedX = 5;
    }

    if (speedX > 0){
        if (circleX <width/2){
            speedY = -1;
        }else{
            speedY = 1;
        }    
    }else{
        if (circleX <width/2){
            speedY = 1;
        }else{
            speedY = -1;
        }
    
    }

    circleX += speedX;
    circleY += speedY;
    circle(circleX, circleY,50);
}