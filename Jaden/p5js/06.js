var checker = "";
function setup() {
    createCanvas(windowWidth,windowHeight);
    background(220);
    img = createImg('https://flowergardengirl.co.uk/wp-content/uploads/2014/06/artificial-easy-grass-lawn-summer-house-sandstone-paving-and-white-flower-planting-scheme-3.jpg');
    image(img,width/500,0,width+200,height+200);
    img.hide();

    
}
function windowResized(){
    setup()
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
function panda(x,y,size,black,white) {
    var pandaX=x;
    var pandaY=y;
    var pandaSize=size;
    var pandaDistance=pandaSize/2;
    fill(white);
    circle(pandaX,pandaY,pandaSize);
    fill(black)
    circle(pandaX-pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(black)
    circle(pandaX+pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
    fill(black)
    circle(pandaX,pandaY+pandaSize*1/10,pandaSize/8);
    fill(black)
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    fill(white)
    circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
    circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
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
function myclown(x,y,size,color1,color2){
    var clownX = x;
    var clownY =  y;
    var clownSize = size;
    let flowerWidth = size
    let flowerHeight =size
    let flowerX = x;
    let flowerY = y;
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


function draw() {
    myclown(width/36,height/15,width/60,'rgb(0,255,255)','rgb(255,255,0)')
    happyFace(width/13,height/15,width/30)
    panda(width/8,height/15,width/40,'rgb(0,0,0)','rgb(255,255,255)')
    drawBee(width/6,height/20,width/35,255,255,0)
    

}
function mouseClicked() {
    
    fill(255,0,0)
    if (mouseX>width/8&&mouseX<width/8+width/40&&mouseY>height/15&&mouseY<height/15+width/40){
        if (checker !== "panda"){
            checker = "panda"
            noStroke()
            circle(width/7,height/9,width/30)
            fill(220)
            circle(width/11,height/9,width/30)
            circle(width/27,height/9,width/30)
            circle(width/5,height/9,width/30)
        }
    }else if (mouseX>width/13&&mouseX<width/13+width/30&&mouseY>height/15&&mouseY<75){
        if(checker !== "smile"){
            checker = "smile"  
            noStroke()
            circle(width/11,height/9,width/30)
            fill(220)
            circle(width/7,height/9,width/30)
            circle(width/27,height/9,width/30)
            circle(width/5,height/9,width/30)
        }
    }else if ( mouseX>width/36 && mouseX<width/36+width/50&&mouseY>height/15&&mouseY<height/15+width/60){
        if(checker !== "clown"){
            checker = "clown"
            noStroke()
            circle(width/27,height/9,width/30)
            fill(220)
            circle(width/11,height/9,width/30)
            circle(width/5,height/9,width/30)
            circle(width/7,height/9,width/30)

        }
        width/6,height/20,width/35
    }else if(mouseX>width/6&&mouseX<width/6+width/35&&mouseY>height/20&&mouseY<height/20+width/35){
        if(checker !== "bee"){
            checker = "bee"
            noStroke()
            circle(width/5,height/9,width/30)
            fill(220)
            circle(width/7,height/9,width/30)
            circle(width/11,height/9,width/30)
            circle(width/27,height/9,width/30)
        }
    }

}
function doubleClicked(){
    if (checker == "clown"){

        myclown(mouseX,mouseY,width/60,'rgb(0,255,255)','rgb(255,255,0)')
        
    }else if (checker == "bee"){

        drawBee(mouseX,mouseY,width/35,255,255,0)
    }else if (checker == "smile"){

        happyFace(mouseX,mouseY,width/40)
    }else if(checker == "panda"){

        panda(mouseX,mouseY,width/30,'rgb(0,0,0)','rgb(255,255,255)')
    }
}