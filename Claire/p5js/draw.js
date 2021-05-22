function setup() {
    createCanvas(windowWidth,windowHeight);
    background(220);
    img = createImg('https://flowergardengirl.co.uk/wp-content/uploads/2014/06/artificial-easy-grass-lawn-summer-house-sandstone-paving-and-white-flower-planting-scheme-3.jpg');
    image(img,width/500,0,width+200,height+100);
    img.hide();
}



function myflower(x,y,size,color1,color2){
    let flowerX = x;
    let flowerY = y;
    let flowerWidth = size;
    let flowerHeight = size;
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;
    fill(color1)
    // // 左上角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // // 左下角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右下角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右上角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // 花蕊
    fill(color2)
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
}

function mypanda(x,y,size,color1,color2){
    var pandaX=x;
    var pandaY=y;
    var pandaSize=size;
    var pandaDistance=pandaSize/2;
    circle(pandaX,pandaY,pandaSize);
    fill(color2);
    circle(pandaX-pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(color2);
    circle(pandaX+pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(color2);
    circle(pandaX,pandaY+pandaSize*1/10,pandaSize/8);
    fill(color2);
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
    fill(color1);
}

function myclown(x,y,size,color1,color2,color3,color4){
    var clownX = x;
    var clownY =  y;
    var clownSize = size;
    let flowerWidth = size
    let flowerHeight =size
    fill(color1);
    circle(clownX,clownY,clownSize);
    fill(color2);
    ellipse(clownX-clownSize/4,clownY-clownSize/4,clownSize/5);
    ellipse(clownX+clownSize/4,clownY-clownSize/4,clownSize/5);
    fill(color3);
    circle(clownX,clownY,clownSize/3);
    fill(color4);
    circle(clownX-clownSize/3,clownY,clownSize/5);
    circle(clownX+clownSize/3,clownY,clownSize/5); 
}

function myhappy(x,y,diam,color1,color2){
    // Face
    fill(color1);
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
    fill(color2);
    ellipse(x-offset, y-offset, eyeDiam, eyeDiam);
    ellipse(x+offset, y-offset, eyeDiam, eyeDiam);
}

function mybee(beeX,beeY,beeSize,color1,color2,color3){
    let beeDist = beeSize/2;
    triangle(beeX + beeSize,beeY + beeDist/2,beeX + beeSize + beeDist,beeY + beeDist,beeX + beeDist,beeY + beeDist);
    fill(color1);
    ellipse(beeX + beeDist + beeDist/2,beeY + beeDist*7/8,beeSize+beeDist/4,beeSize - beeDist*2/3);
    circle(beeX + beeDist/2,beeY + beeDist/2,beeSize - beeDist/4);
    fill(color2);
    line(beeX + beeDist*3/2,beeY + beeDist*1/5,beeX + beeDist + beeDist/2,beeY + beeDist + beeDist/2);
    line(beeX + beeDist*2 + beeDist/4,beeY + beeDist/3,beeX + beeDist*2 + beeDist/4,beeY + beeDist + beeDist/3);
    circle(beeX + beeDist/5,beeY + beeDist/5,beeSize - beeDist*2/1.23);
    circle(beeX + beeDist/1.2,beeY + beeDist/5,beeSize - beeDist*2/1.23);
    line(beeX + beeDist/1.1,beeY - beeDist/4,beeX + beeDist/1.1,beeY - beeDist/2);
    line(beeX + beeDist/5,beeY - beeDist/4,beeX + beeDist/5,beeY - beeDist/2);
    circle(beeX + beeDist/5,beeY - beeDist/1.5,beeSize - beeDist - beeDist/1.5);
    circle(beeX + beeDist/1.1,beeY -  beeDist/1.5,beeSize - beeDist - beeDist/1.5);
    fill(color3);
    arc(beeX + beeDist/2,beeY + beeDist/1.1,beeSize - beeDist - beeDist/4,beeSize - beeDist - beeDist/4,PI,QUARTER_PI,CHORD);
}

function draw() {
    mypanda(width/5,height/8.5,50,'rgb(255,255,255)','rgb(0,0,0)');
    myflower(width/17,height/9.3,30,'rgb(255,0,0)','rgb(251,212,1)');
    myclown(width/3,height/9,55,'rgb(242,216,194)','rgb(32,64,132)','rgb(255,0,0)','rgb(233,157,180)');
    myhappy(width/2.1,height/9,55,'rgb(251,212,1)','rgb(0,0,0)');
    mybee(width/1.7,height/11,50,'rgb(251,212,1)','rgb(0,0,0)','rgb(255,255,255)');
    rect(pandaX1,pandaY1,100,100)
}

var selection = '';

function mouseClicked() {
    if (mouseX>width/6.7&&mouseX<width/4&&mouseY>height/17.6&&mouseY<height/6.5){
        selection='panda';
        fill(255,0,0)
        circle(width/5,height/25,10)
        fill(255,255,255)
        circle(width/17,height/25,10)
        circle(width/1.6,height/25,10)
        circle(width/2.1,height/25,10)
        circle(width/3,height/25,10)
    }
    if (mouseX>width/90&&mouseX<width/9.5&&mouseY>height/17&&mouseY<height/6.5){
        selection='flower';
        fill(255,0,0)
        circle(width/17,height/25,10)
        fill(255,255,255)
        circle(width/5,height/25,10)
        circle(width/1.6,height/25,10)
        circle(width/2.1,height/25,10)
        circle(width/3,height/25,10)
    }
    if (mouseX>width/1.77&&mouseX<width/1.38&&mouseY>height/17.1&&mouseY<height/6.6){
        selection='bee';
        fill(255,0,0)
        circle(width/1.6,height/25,10)
        fill(255,255,255)
        circle(width/5,height/25,10)
        circle(width/17,height/25,10)
        circle(width/2.1,height/25,10)
        circle(width/3,height/25,10)
    } 
    if (mouseX>width/2.3&&mouseX<width/1.93&&mouseY>height/14&&mouseY<height/6.5){
        selection='happy';
        fill(255,0,0)
        circle(width/2.1,height/25,10)
        fill(255,255,255)
        circle(width/5,height/25,10)
        circle(width/1.6,height/25,10)
        circle(width/17,height/25,10)
        circle(width/3,height/25,10)
    }
    if (mouseX>width/3.5&&mouseX<width/2.7&&mouseY>height/14&&mouseY<height/6.5){
        selection='clown';
        fill(255,0,0)
        circle(width/3,height/25,10)
        fill(255,255,255)
        circle(width/5,height/25,10)
        circle(width/1.6,height/25,10)
        circle(width/2.1,height/25,10)
        circle(width/17,height/25,10)
    }
}

function doubleClicked() {
    if(selection=='panda'){
        mypanda(mouseX,mouseY,50,'rgb(255,255,255)','rgb(0,0,0)');
    }
    if(selection=='flower'){
        myflower(mouseX,mouseY,30,'rgb(255,0,0)','rgb(251,212,1)');
    }
    if(selection=='clown'){
        myclown(mouseX,mouseY,55,'rgb(242,216,194)','rgb(32,64,132)','rgb(255,0,0)','rgb(233,157,180)');
    } 
    if(selection=='bee'){
        mybee(mouseX,mouseY,50,'rgb(251,212,1)','rgb(0,0,0)','rgb(255,255,255)');
    }
    if(selection=='happy'){
        myhappy(mouseX,mouseY,55,'rgb(251,212,1)','rgb(0,0,0)');
    }
}

function windowResizd() {
    setup();
}