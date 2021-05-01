let size = 300;
let circleX = 0;
let circleY = 100;
let speed = 5;
let speedY = speed/3;
let speedX = speed;
let isNight = false;

function mysun(x,y,size,suncolor){

}

function myflower(x,y,size,color1,color2){
    
}

function setup() {
    createCanvas(size, size);
}
  
function draw() {
    background(220); 
    if (circleX > width) {
        circleX = 0;
        circleY = 100;
        if (isNight){
            isNight = false;
        }else{
            isNight = true;
        }
    }else if (circleX < 25){
        speedX = speed;
    }
    if (circleX < width/2){
        circleY -= speedY;
    }else{
        circleY += speedY;
    }
    circleX += speedX;
    if (isNight){
        fill(250,250,250);
    }else{
        fill(241,203,2);
    }
    circle(circleX,circleY,50);

    let flowerX = width/2;
    let flowerY = height-height/5;
    let flowerWidth = width/5;
    let flowerHeight = width/5;
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;

    fill(135,40,158)
    // // 左上角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // // 左下角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右下角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右上角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // 花蕊
    fill(253,242,99)
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
}