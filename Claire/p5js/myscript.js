let circleY = 25;
let circleX = 300;
let speed = 40
let speedY = speed;
let speedX = speed;

function setup() {
    createCanvas(circleX*2, circleX*2);
    background(220);
}
function draw() {
    background(220);
    circle(circleX,circleY,50); 
    if (circleX > width-25) {
        speedX = 1*speed;
    }else if(circleX<25){
        speedX=-1*speed;
    }
    if(speedX>0){
        //right
        if(circleX<width/2){
            circleY-=speedY;
        }else{
            circleY+=speedY
        }
    }else{
        //left
        if(circleX<width/2){
            circleY+=speedY
        }else{
            circleY-=speedY
        }
    }
    circleX+=speedX
}