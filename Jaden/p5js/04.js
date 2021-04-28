let beeX = 425;
let beeY = 250;
let beeSize = 50;
let beeDist = beeSize/2;
let beeSpeed = 5;
let rbColor = 255

function setup() {
    createCanvas(500, 500);
    
}
  
function draw() {
    background(250);
    fill(0,0,0);
    triangle(beeX + beeSize,beeY + beeDist/2,beeX + beeSize + beeDist,beeY + beeDist,beeX + beeDist,beeY + beeDist);
    fill(255,255,0);
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
    fill(rbColor,rbColor*0,rbColor*0)
    ellipse(250,450,550,320)
    fill(rbColor,rbColor/255*165,rbColor*0)
    ellipse(250,480,550,320)
    fill(rbColor,rbColor,rbColor*0,)
    ellipse(250,510,550,320)
    fill(rbColor*0,rbColor,rbColor*0)
    ellipse(250,540,550,320)
    fill(rbColor/255*125,rbColor/255*216,rbColor)
    ellipse(250,570,550,320)
    fill(rbColor*0,rbColor*0,rbColor)
    ellipse(250,600,550,320)
    fill(rbColor,rbColor*0,rbColor)
    ellipse(250,630,550,320)
    fill(rbColor/255*128,rbColor*0,rbColor/255*128)
    ellipse(250,650,550,320)
    if (beeX > 20) {
    }
    else if (beeX<480){
        beeSpeed = -5;
        background(0);
        rbColor=50
        fill(rbColor/255*220,rbColor/255*220,rbColor/255*220)
        ellipse(250,450,550,320)
        fill(rbColor/255*211,rbColor/255*211,rbColor/255*211)
        ellipse(250,480,550,320)
        fill(rbColor/255*192,rbColor/255*192,rbColor/255*192,)
        ellipse(250,510,550,320)
        fill(rbColor/255*169,rbColor/255*169,rbColor/255*169)
        ellipse(250,540,550,320)
        fill(rbColor/255*128,rbColor/255*128,rbColor/255*128)
        ellipse(250,570,550,320)
        fill(rbColor/255*105,rbColor/255*105,rbColor/255*105)
        ellipse(250,600,550,320)
        fill(rbColor/255*90,rbColor/255*90,rbColor/255*90)
        ellipse(250,630,550,320)
        fill(rbColor*0,rbColor*0,rbColor*0)
        ellipse(250,650,550,320)
    }

        beeX -= beeSpeed

    

}