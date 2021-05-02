let circleX = -15;
let circleY = 200;
let speed = 5;
let speedY = speed/3;
let speedX = speed;
let size = 500;
var day;

function setup() {
    createCanvas(size, size);
    day = true
}
  
function draw() {
    if (day) {   
        background('Cyan');
    } else {
        background('Grey');
    }
    sunmoon(circleX,circleY,day);
    let flowerX = width/2;
    let flowerY = height-height/5;
    let flowerWidth = width/5;
    let flowerHeight = width/5;
    let flowerX2 = width/8;
    let flowerX3 = width-width/8;
    let flowerWidth2 = width/10;
    let flowerHeight2 = width/10;
    let flowerY2 = height-height/10;
    flower(flowerX,flowerHeight,flowerWidth,flowerY,day);
    flower(flowerX2,flowerHeight2,flowerWidth2,flowerY2,day);
    flower(flowerX3,flowerHeight2,flowerWidth2,flowerY2,day);
    if (circleX < 25){
        speedX = speed;
    }
    if (circleX < width+55){
        if (circleX < width/2){
            circleY -= speedY;
        }else{
            circleY += speedY;
        }
    } else {
        if (day) {
            day = false;
            
        } else {
            day = true;
        }
        circleX = -15;
        circleY = 200;
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

function flower(flowerX,flowerHeight,flowerWidth,flowerY,day) {
    if (day) {
        fill(135,40,158);
    } else {
        fill(144,5,6);
    }
    // // 左上角的花瓣
    ellipse(flowerX-flowerHeight/2,flowerY-flowerWidth/2,flowerWidth,flowerHeight);
    // // 左下角的花瓣
    ellipse(flowerX-flowerHeight/2,flowerY+flowerWidth/2,flowerWidth,flowerHeight);
    // // 右下角的花瓣
    ellipse(flowerX+flowerHeight/2,flowerY+flowerWidth/2,flowerWidth,flowerHeight);
    // // 右上角的花瓣
    ellipse(flowerX+flowerHeight/2,flowerY-flowerWidth/2,flowerWidth,flowerHeight);
    // 花蕊
    fill(253,242,99);
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
}