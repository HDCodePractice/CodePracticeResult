function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220)
    fill(220)
    square(30,30,60)
    square(200,13,80)
    square(390,30,60)
    rect(580,30,110,80)
    square(930,30,60)
    rect(775,5,70,130)
    happyFace(60,60,60)
    panda(240,60,60)
    myclown(420,60,60)
    drawBee(600,60,60)
    house(60,70,780,60)
    myflower(960,60,30)
    selected = ''
}

function happyFace (x, y, diam) {
    // Face
    fill(255, 255, 0);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, diam, diam);
    
    // Smile
    var startAng = .1*PI
    var endAng = .9*PI
    var smileDiam = .6*diam;
    arc(x, y, smileDiam, smileDiam, startAng, endAng);
    
    // Eyes
    var offset = .2*diam;
    var eyeDiam = .1*diam;
    fill(0);
    ellipse(x-offset, y-offset, eyeDiam, eyeDiam);
    ellipse(x+offset, y-offset, eyeDiam, eyeDiam);
}

function panda(x,y,size) {
    var pandaSize=size;
    fill(1,1,1)
    stroke(0)
    circle(x,y,pandaSize);
    circle(x-pandaSize*2/5,y-pandaSize/2,pandaSize/2);
    circle(x+pandaSize*2/5,y-pandaSize/2,pandaSize/2);
    circle(x,y+pandaSize*1/10,pandaSize/8);
    circle(x-pandaSize/5,y-pandaSize/8,pandaSize/4);
    fill(255,255,255)
    circle(x-pandaSize/5,y-pandaSize/8,pandaSize/8);
    circle(x+pandaSize/5,y-pandaSize/8,pandaSize/4);
    circle(x+pandaSize/5,y-pandaSize/8,pandaSize/8);
}

function myclown(x,y,size){
    color1 = 'rgb(145,145,66)'
    var clownX = x;
    var clownY =  y;
    var clownSize = size;
    fill(color1)
    circle(clownX,clownY,clownSize);
    fill(32,64,132)
    ellipse(clownX-clownSize/4,clownY-clownSize/4,clownSize/5);
    ellipse(clownX+clownSize/4,clownY-clownSize/4,clownSize/5);
    fill(255,0,0);
    circle(clownX,clownY,clownSize/3);
    fill(233,157,180);
    circle(clownX-clownSize/3,clownY,clownSize/5);
    circle(clownX+clownSize/3,clownY,clownSize/5); 
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

function house(houseHeight,houseY,houseX,houseWidth) {
    fill(100,100,100);
    // House
    rect(houseX,houseY,houseWidth,houseHeight);
    triangle(houseX,houseY,houseX+houseWidth,houseY,houseX+houseWidth/2,houseY-houseHeight);
    fill(101,67,33);
    // Door
    rect(houseX+(houseWidth-20)/2,houseY+houseHeight/4.5,20,houseHeight/9*7);
}

function myflower(x,y,size){
    let flowerX = x;
    let flowerY = y;
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

function drawTower(size,x,y) {
    fill(169,173,176);
    rect(x-size/2,y,size,y);
    fill(134,3,4);
    triangle(x-size*0.75,y,x+size*0.75,y,x,y-size);
    fill(168,86,20);
    circle(x,y+size/2,size*0.75);
    fill(5);
    circle(x,y+size/2,size*0.75-8);
    fill(250,250,250);
    if (minute() < 10) {
        text(hour() + ':0' + minute(),x-15,y+size/2);
    } else {
        text(hour() + ':' + minute(),x-15,y+size/2);
    } 
}

function mousePressed(){
    if (mouseX > 30 && mouseX < 90 && mouseY > 30 && mouseY < 90) {
        selected = 'smile'
    }
    if (mouseX > 200 && mouseX < 280 && mouseY > 13 && mouseY < 73) {
        selected = 'panda'
    }
    if (mouseX > 390 && mouseX < 450 && mouseY > 30 && mouseY < 90) {
        selected = 'clown'
    }
    if (mouseX > 580 && mouseX < 690 && mouseY > 30 && mouseY < 110) {
        selected = 'bee'
    }
    if (mouseX > 775 && mouseX < 845 && mouseY > 5 && mouseY < 135) {
        selected = 'house'
    }
    if (mouseX > 960 && mouseX < 990 && mouseY > 60 && mouseY < 90) {
        selected = 'flower'
    }
}  

function doubleClicked() {
    if (selected == 'smile') {
        happyFace(mouseX,mouseY,70)
    }
    if (selected == 'panda') {
        panda(mouseX,mouseY,70)
    }
    if (selected == 'clown') {
        myclown(mouseX,mouseY,70)
    }
    if (selected == 'house') {
        house(mouseX,mouseY,70,70)
    }
    if (selected == 'flower') {
        myflower(mouseX,mouseY,70)
    }
    if (selected == 'bee') {
        drawBee(mouseX,mouseY,70)
    }
}

function windowResized() {
    setup();
}