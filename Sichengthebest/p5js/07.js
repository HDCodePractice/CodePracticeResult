var xposition;
var yposition;
var beeX;
var beeY;
var score = 0;
let speed = 10;

function setup() {
    createCanvas(windowWidth,windowHeight-45);
    xposition = width/2;
    yposition = height-60;
    beeX = random(20,width-80);
    beeY = 20;
}  

function myflower(flowerX,flowerY,size){
    let flowerWidth = size;
    let flowerHeight = size;
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;
    fill(45,67,45)
    // // 左上角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // // 左下角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右下角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右上角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // 花蕊
    fill(255,245,0)
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
}

function drawBee(beeX,beeY,beeSize){
    let beeDist = beeSize/2;
    triangle(beeX + beeSize,beeY + beeDist/2,beeX + beeSize + beeDist,beeY + beeDist,beeX + beeDist,beeY + beeDist);
    fill(255,245,0);
    ellipse(beeX + beeDist + beeDist/2,beeY + beeDist*7/8,beeSize+beeDist/4,beeSize - beeDist*2/3);
    circle(beeX + beeDist/2,beeY + beeDist/2,beeSize - beeDist/4);
    fill(0,0,0);
    line(beeX + beeDist*3/2,beeY + beeDist*1/5,beeX + beeDist + beeDist/2,beeY + beeDist + beeDist/2);
    line(beeX + beeDist*2 + beeDist/4,beeY + beeDist/3,beeX + beeDist*2 + beeDist/4,beeY + beeDist + beeDist/3);
    circle(beeX + beeDist/5,beeY + beeDist/5,beeSize - beeDist*2/1.23);
    circle(beeX + beeDist/1.2,beeY + beeDist/5,beeSize - beeDist*2/1.23);
    line(beeX + beeDist/1.1,beeY - beeDist/4,beeX + beeDist/1.1,beeY - beeDist/2);
    line(beeX + beeDist/5,beeY - beeDist/4,beeX + beeDist/5,beeY - beeDist/2);
    circle(beeX + beeDist/5,beeY - beeDist/1.5,beeSize - beeDist - beeDist/1.5);
    circle(beeX + beeDist/1.1,beeY -  beeDist/1.5,beeSize - beeDist - beeDist/1.5);
    fill(255,255,255);
    arc(beeX + beeDist/2,beeY + beeDist/1.1,beeSize - beeDist - beeDist/4,beeSize - beeDist - beeDist/4,PI,QUARTER_PI,CHORD);

}

function draw() {
    background(120,226,255);
    if (keyIsPressed){
        if (keyCode === LEFT_ARROW) {
            if (xposition > 25) {
                xposition -= speed;
            }
        } else if (keyCode === RIGHT_ARROW) {
            if (xposition < width-25) {
                xposition += speed;
            } 
        }
    } 
    myflower(xposition,yposition,30);
    beeY += 6;
    if (beeY >= height-60) {
        if (beeX < xposition+60 && beeX > xposition-60) {
            score += 1;
        } else {
            score -= 1;
        }
        beeY = 20;
        beeX = random(20,width);
    }
    drawBee(beeX,beeY,20);
    fill(220)
    rect(0,0,100,35)
    fill(0,0,0);
    textSize(20)
    text(`Score: ${score}`,5,25);
}

function windowResized() {
    setup();
}