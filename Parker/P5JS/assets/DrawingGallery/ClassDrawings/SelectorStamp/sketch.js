var currentstamp = "";

function setup() {
    createCanvas(windowWidth,windowHeight);
    bg = loadImage('garden.jpeg');
    background(bg);
  }
  
function myclown(x,y,size,color1,color2){
    var clownX = x;
    var clownY =  y;
    var clownSize = size;
    let flowerWidth = size
    let flowerHeight =size
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

function panda(x,y,size,black,white) {
    var pandaX=x;
    var pandaY=y;
    var pandaSize=size;
    var pandaDistance=pandaSize/2;
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

function mousePressed(){
    redCircle(mouseX,mouseY);
}

function doubleClicked(){
    myflower(mouseX,mouseY,100,"rgb(255,0,0)","rgb(0,0,255)")
}

function mousePressed(){
    if (mouseX >= 50 && mouseX <= 250 && mouseY <= 250) {
        if (currentstamp !== "clown") {
            currentstamp = "clown";
        } else{
            currentstamp = ""
        }
        
    } else if (mouseX >= 400 && mouseX <= 600 && mouseY <= 250) {
        if (currentstamp !== "panda") {
            currentstamp = "panda";
        } else{
            currentstamp = ""
        }
    } else if (mouseX >= 700 && mouseX <= 900 && mouseY <= 250) {
        if (currentstamp !== "bee") {
            currentstamp = "bee";
        } else{
            currentstamp = ""
        }
    } else {
        if (currentstamp == "clown") {
            myclown(mouseX,mouseY,100,"rgb(255,0,0)","rgb(0,0,255)")
        } else if (currenctstamp = "panda") {
            panda(mouseX,mouseY,100,"rgb(0,0,0)","rgb(250,250,250)")
        } else if (currenctstamp = "bee") {
            drawBee(mouseX,mouseY,100,"rgb(255,255,0)","rgb(255,255,0)","rgb(255,255,0)")
        }
    }
      
    
}

function draw() {
    myclown(150,150,150,"rgb(255,0,0)","rgb(0,0,255)")
    panda(450,150,150,"rgb(0,0,0)","rgb(250,250,250)")
    drawBee(750,150,150,"rgb(255,255,0)","rgb(255,255,0)","rgb(255,255,0)")
}

function windowResized() {
    setup();
}  