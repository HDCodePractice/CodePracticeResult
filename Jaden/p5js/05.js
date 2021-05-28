let size = 500;
let circleX = 0
let circleY = 100
let speed = 5;
let speedY = speed/3;
let speedX = speed;
let isNight = false;
function setup() {
    createCanvas(500, 500);
    
}
function sunMoon(x,y,color){
    fill(color)
    circle(x,y,50)
    

  
}
function drawBee(beeX,beeY,beeSize,color1,color2,color3){
    let beeDist = beeSize/2;
    triangle(beeX + beeSize,beeY + beeDist/2,beeX + beeSize + beeDist,beeY + beeDist,beeX + beeDist,beeY + beeDist);
    fill(color1,color2,color3);
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
    background(220);
    speedX = speed
    speedY = speed/3
    if (circleX > width) {
        circleX = 0
        circleY =100
        if (isNight){
            isNight = false;
        }else{
            isNight = true;
        }
    }else if (circleX < 25){
        speedX = speed;
    }else if (circleX < width/2){
        circleY -= speedY;
    }else{
        circleY += speedY;
    }
    circleX += speedX;
    if (isNight){
        drawBee(width/2.5,height-height/5,width/5,250,250,250)
        drawBee(width/12,height-height/10,width/10,250,250,250)
        drawBee(width-width/6,height-height/10,width/10,250,250,250)

        sunMoon(circleX,circleY,'rgb(250,250,250)')
     
    }else{
        drawBee(width/2.5,height-height/5,width/5,255,255,0)
        drawBee(width/12,height -height/10,width/10,255,255,0)
        drawBee(width-width/6,height-height/10,width/10,255,255,0)
    
        sunMoon(circleX,circleY,'rgb(241,203,2)')

        

    }
}