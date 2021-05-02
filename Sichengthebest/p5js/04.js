let circleX = -15;
let circleY = 250;
let speed = 4;
let speedY = speed/3;
let speedX = speed;
let size = 1000
var day;

function setup() {
    createCanvas(size, size);
    day = true
}
  
function draw() {
    if (day) {   
        background('Cyan');
    } else {
        background('Grey')
    }
    sunmoon(circleX,circleY,day)
    let houseHeight = 170;
    let houseY = windowHeight-220;
    let houseWidth = width/4;
    let houseX = (size-houseWidth)/2;
    let houseX2 = (size-houseWidth)/8;
    let houseX3 = size-(size-houseWidth)/2.5;
    let houseHeight2 = 150;
    let houseWidth2 = width/5;
    let houseY2 = windowHeight-200;
    house(houseHeight,houseY,houseX,houseWidth,day);
    house(houseHeight2,houseY2,houseX2,houseWidth2,day);
    house(houseHeight2,houseY2,houseX3,houseWidth2,day);
    if (circleX < width+55) {
        if (circleX < width/2){
            circleY -= speedY;
        } else {
            circleY += speedY;
        }
    } else {
        if (day) {
            day = false;
            
        } else {
            day = true;
        }
        circleX = -15;
        circleY = 250;
    }
    circleX += speedX;
}

function sunmoon(circleX,circleY,day) {
    if (day) {
        fill(255,255,100);
    } else {
        fill(250,250,250);
    }
    circle(circleX,circleY,50);
}

function house(houseHeight,houseY,houseX,houseWidth,day) {
    if (day) {
        fill(100,100,100)
    } else {
        fill(10,100,100)
    }
    // House
    rect(houseX,houseY,houseWidth,houseHeight);
    triangle(houseX,houseY,houseX+houseWidth,houseY,houseX+houseWidth/2,houseY-houseHeight)
    fill(101,67,33)
    // Door
    rect(houseX+(houseWidth-70)/2,houseY+houseHeight/4.5,70,houseHeight/9*7)
}