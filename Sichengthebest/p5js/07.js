var xposition;
var yposition;
var beeX;
var beeY;
var score = 0;
let speed = 10;
let speed2 = 6;
let scoreadd = 7;

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

function drawRect(txt,x,y,fillColor,size,textcolor) {
    textSize(15)
    fill(fillColor)
    rect(x,y,2*size,size)
    fill(textcolor)
    text(txt,x+5,y+25)
}

function draw() {
    background(120,226,255);
    drawRect("Default",250,10,[100,205,200],40,250)
    drawRect("Easy",350,10,[107,215,105],40,250)
    drawRect("Medium",450,10,[250,200,0],40,250)
    drawRect("Hard",550,10,[250,0,0],40,250)
    drawRect("Hardcore",650,10,[120,9,2],40,250)
    drawRect("Impossible",750,10,0,40,250)
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
    if (mouseIsPressed) {
        if (mouseX > 250 && mouseX < 290 && mouseY > 10 && mouseY < 90) {
            speed = 10
            speed2 = 6
            scoreadd = 5
        } else if (mouseX > 350 && mouseX < 390 && mouseY > 10 && mouseY < 90) {
            speed = 12
            speed2 = 4
            scoreadd = 3
        } else if (mouseX > 450 && mouseX < 490 && mouseY > 10 && mouseY < 90) {
            speed = 10.5
            speed2 = 5.5
            scoreadd = 4.5
        } else if (mouseX > 550 && mouseX < 590 && mouseY > 10 && mouseY < 90) {
            speed = 9
            speed2 = 7
            scoreadd = 6
        } else if (mouseX > 650 && mouseX < 690 && mouseY > 10 && mouseY < 90) {
            speed = 7.5
            speed2 = 8.5
            scoreadd = 7.5
        } else if (mouseX > 750 && mouseX < 790 && mouseY > 10 && mouseY < 90) {
            speed = 5
            speed2 = 11
            scoreadd = 10
        }
    }
    myflower(xposition,yposition,30);
    beeY += speed2;
    if (beeY >= height-60) {
        if (beeX < xposition+60 && beeX > xposition-60) {
            score += scoreadd;
        } else {
            score -= 3;
        }
        beeY = 20;
        beeX = random(20,width);
    }
    drawBee(beeX,beeY,20);
    fill(220)
    rect(0,0,200,35)
    fill(0,0,0);
    textSize(20)
    text(`Score: ${score}`,5,25);
    text(`Flower speed: ${speed}\nBee speed:${speed2}`,5,70)
    textSize(15)
    text('Use the left-right arrow keys to steer.',5,150)
    text(`Points added each time you get a bee: ${scoreadd}`,5,170)
}

function windowResized() {
    setup();
}