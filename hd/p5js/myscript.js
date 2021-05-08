let size = 300;
let circleX = 0;
let circleY = 100;
let speed = 5;
let speedY = speed/3;
let speedX = speed;
let isNight = false;

function sunMoon(x,y,color1){
    fill(color1);
    circle(x,y,50);
}

function myflower(x,y,size,color1,color2){
    let flowerX = x;
    let flowerY = y;
    let flowerWidth = size;
    let flowerHeight = size;
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;
    fill(color2)
    // // 左上角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // // 左下角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右下角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右上角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // 花蕊
    fill(color1)
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
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
        myflower(width/2,height-width/10,width/10,'rgb(253,242,100)','rgb(135,40,158)');
        myflower(width/5,height-width/20,width/20,'rgb(0,242,100)','rgb(0,40,158)');
        myflower(width*4/5,height-width/20,width/20,'rgb(0,242,5)','rgb(0,40,158)');
        sunMoon(circleX,circleY,'rgb(250,250,250)');
    }else{
        myflower(width/2,height-width/10,width/10,'rgb(0,242,100)','rgb(135,40,158)');
        myflower(width/5,height-width/20,width/20,'rgb(255,242,100)','rgb(0,40,158)');
        myflower(width*4/5,height-width/20,width/20,'rgb(255,242,5)','rgb(0,40,158)');
        sunMoon(circleX,circleY,'rgb(241,203,2)');
    }
}