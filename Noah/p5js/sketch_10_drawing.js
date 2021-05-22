var doubleClickChoice;
var colorChoice;
var sizeChoice;

function setup() {
    createCanvas(windowWidth,windowHeight-50)
    background(220)
    doubleClickChoice = "Flower";
    colorChoice = "Black";
    sizeChoice = 20;
    img = createImg('https://venngage-wordpress.s3.amazonaws.com/uploads/2018/09/Colorful-Circle-Simple-Background-Image-1.jpg');
    img.hide();
    img2 = createImg('https://images.pexels.com/photos/1054289/pexels-photo-1054289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
    img2.hide();
    img3 = createImg('https://cdn.britannica.com/17/133217-050-7EF4B14A/prairie-grassland-Buffalo-Gap-National-Grassland-South.jpg')
    img3.hide();
    img4 = createImg('https://cdn.nextgov.com/media/img/cd/2020/10/19/NGspace20201019/860x394.jpg?1618395239');
    img4.hide()
    input = createInput();
    input.position(710,80);
    button = createButton('submit');
    button.position(input.x + input.width, 80);
    button.mousePressed(response);
    greeting = createElement('h', 'What color would you like?');
    greeting.position(710, 60);
    input2 = createInput();
    input2.position(925,80);
    button2 = createButton('submit');
    button2.position(input2.x + input2.width, 80);
    button2.mousePressed(response2);
    greeting2 = createElement('h', 'What size would you like?');
    greeting2.position(925, 60);
}   

function response() {
    const color = input.value();
    input.value('');
    colorChoice = color
}

function response2() {
    const size = input2.value();
    input.value('');
    sizeChoice = size
}

function placeCircle(x,y,size,color) {
    fill(color);
    circle(x,y,size)
}

function mouseDragged() {
    noStroke()
    if (mouseY > 75) {
        placeCircle(mouseX,mouseY,sizeChoice,colorChoice);
    }
    stroke()
}

function doubleClicked() {
    if (mouseY > 75) {
        if (doubleClickChoice == "Flower") {
            myflower(mouseX,mouseY,sizeChoice,[253,242,99],[135,40,158]);
        } else if (doubleClickChoice == "House") {
            house(sizeChoice,mouseY,mouseX,sizeChoice);
        } else if (doubleClickChoice == "Bee") {
            drawBee(mouseX,mouseY,sizeChoice,255,255,0);
        } else if (doubleClickChoice == "Clown") {
            myclown(mouseX,mouseY,sizeChoice)
        } else if (doubleClickChoice == "Panda") {
            panda(mouseX,mouseY,sizeChoice)
        } else if (doubleClickChoice == "HappyFace") {
            happyFace(mouseX,mouseY,sizeChoice)
        } else if (doubleClickChoice == "Tower") {
            drawTower(sizeChoice,mouseX,mouseY,[28,161,251])
        }
    }   
}

function draw() {
    myflower(40,40,25,[253,242,99],[135,40,158])
    house(25,40,80,40)
    drawBee(140,35,30,255,255,0)
    myclown(220,40,40)
    panda(280,40,40)
    happyFace(340,40,40)
    drawTower(30,400,30,[28,161,251])
    image(img, 460, 20, 40, 40);
    image(img2, 510, 20, 40, 40);
    square(560,20,40)
    fill(0)
    text("None",565,40)
    image(img3, 610, 20, 40, 40);
    image(img4, 660, 20, 40, 40);

    if (mouseIsPressed) {
        if (mouseX > 40 && mouseX < 65 && mouseY > 0 && mouseY < 75) {
            doubleClickChoice = "Flower";
        } else if (mouseX > 80 && mouseX < 115 && mouseY > 0 && mouseY < 75) {
            doubleClickChoice = "House";
        } else if (mouseX > 130 && mouseX < 190 && mouseY > 0 && mouseY < 75) {
            doubleClickChoice = "Bee";
        } else if (mouseX > 195 && mouseX < 245 && mouseY > 0 && mouseY < 75) {
            doubleClickChoice = "Clown";
        } else if (mouseX > 250 && mouseX < 310 && mouseY > 0 && mouseY < 75) {
            doubleClickChoice = "Panda";
        } else if (mouseX > 315 && mouseX < 365 && mouseY > 0 && mouseY < 75) {
            doubleClickChoice = "HappyFace";
        } else if (mouseX > 370 && mouseX < 425 && mouseY > 0 && mouseY < 75) {
            doubleClickChoice = "Tower";
        } else if (mouseX > 460 && mouseX < 500 && mouseY > 0 && mouseY < 75) {
            image(img, 0,0,width,height);
        } else if (mouseX > 510 && mouseX < 550 && mouseY > 0 && mouseY < 75) {
            image(img2, 0,0,width,height);
        } else if (mouseX > 560 && mouseX < 600 && mouseY > 0 && mouseY < 75) {
            background(220)
        } else if (mouseX > 610 && mouseX < 650 && mouseY > 0 && mouseY < 75) {
            image(img3, 0,0,width,height);
        } else if (mouseX > 660 && mouseX < 700 && mouseY > 0 && mouseY < 75) {
            image(img4, 0,0,width,height);
        }
    }
}

function myflower(x,y,size,color1,color2){
    let flowerX = x;
    let flowerY = y;
    let flowerWidth = size;
    let flowerHeight = size;
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;
    fill(color2)
    ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    fill(color1)
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
}

function happyFace (x, y, diam) {
    fill(255, 255, 0);
    ellipse(x, y, diam, diam);
    var startAng = .1*PI
    var endAng = .9*PI
    var smileDiam = .6*diam;
    arc(x, y, smileDiam, smileDiam, startAng, endAng);
    var offset = .2*diam;
    var eyeDiam = .1*diam;
    fill(0);
    ellipse(x-offset, y-offset, eyeDiam, eyeDiam);
    ellipse(x+offset, y-offset, eyeDiam, eyeDiam);
}

function drawTower(size,x,y,roofcolor) {
    fill(169,173,176);
    rect(x-size/2,y,size,size);
    fill(roofcolor);
    triangle(x-size*0.75,y,x+size*0.75,y,x,y-size);
    fill(168,86,20);
    circle(x,y+size/2,size*0.75);
    fill(5);
    circle(x,y+size/2,size*0.75-8);
    fill(250,250,250);
}

function house(houseHeight,houseY,houseX,houseWidth) {
    fill(100,100,100);
    rect(houseX,houseY,houseWidth,houseHeight);
    triangle(houseX,houseY,houseX+houseWidth,houseY,houseX+houseWidth/2,houseY-houseHeight);
    fill(101,67,33);
    rect(houseX+(houseWidth-10)/2,houseY+houseHeight/4.5,10,houseHeight/9*7);
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

function panda(x,y,size) {
    fill(250)
    var pandaSize=size;
    circle(x,y,pandaSize);
    fill(1,1,1)
    circle(x-pandaSize*2/5,y-pandaSize/2,pandaSize/2);
    fill(1,1,1)
    circle(x+pandaSize*2/5,y-pandaSize/2,pandaSize/2);
    fill(1,1,1)
    circle(x,y+pandaSize*1/10,pandaSize/8);
    fill(1,1,1)
    circle(x-pandaSize/5,y-pandaSize/8,pandaSize/4);
    fill(255,255,255)
    circle(x-pandaSize/5,y-pandaSize/8,pandaSize/8);
    circle(x+pandaSize/5,y-pandaSize/8,pandaSize/4);
    circle(x+pandaSize/5,y-pandaSize/8,pandaSize/8);
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


function windowResized() {
    setup();
}

function keyPressed() {
    if (key == 's') {
      saveCanvas('myart.png');
    }
  }