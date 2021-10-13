let circleX = -15;
let circleY = 300;
let speed = 10;
let speedY = speed/3;
let speedX = speed;

var isDay;

function setup() {
    createCanvas(windowWidth, windowHeight-50);
    isDay = true;

    background(250,250,250);
}

function draw() {
    drawBackground([241,203,2],[250,250,250]);
    drawTower(150,width/2,height/1.5,[200,0,0])
    drawTower(100,width/1.5,height*0.75,[41,163,248])
    drawTower(80,width/3,height*0.85,[318,68,39])
}

function drawBackground(suncolor,mooncolor) {
    if (isDay) {
        fill(suncolor);
        background(66,196,251);
    } else {
        fill(mooncolor)
        background(0);
    }
    if (circleX < 25){
        speedX = speed;
    }
    if (circleX < width+55){
        if (circleX < width/2){
            circleY -= speedY;
        } else {
            circleY += speedY;
        }
    } else {
        if (isDay) {
            isDay = false;
            
        } else {
            isDay = true;
        }
        circleX = -15;
        circleY = 300;
    }
    circleX += speedX;
    circle(circleX,circleY,50); 
}

function drawTower(size,x,y,roofcolor) {
    fill(169,173,176);
    rect(x-size/2,y,size,y);
    fill(roofcolor);
    triangle(x-size*0.75,y,x+size*0.75,y,x,y-size);
    fill(168,86,20);
    circle(x,y+size/2,size*0.75);
    if (isDay) {
        fill(5);
    } else {
        fill(250,250,250);
    }
    circle(x,y+size/2,size*0.75-8);
    if (isDay) {
        fill(250,250,250);
    } else {
        fill(0)
    }
    if (minute() < 10) {
        text(hour() + ':0' + minute(),x-15,y+size/2);
    } else {
        text(hour() + ':' + minute(),x-15,y+size/2);
    } 
}

function windowResized() {
    setup();
}