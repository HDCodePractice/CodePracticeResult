var xposition;
var yposition;
var beeX;
var beeY;

var score = 0;

var speed;
var scoreObjective;
var difficulty;
var beespeed;
var beesize;
var flowersize;

function setup() {
    createCanvas(windowWidth,windowHeight-50);
    xposition = width/2;
    yposition = height-60;
    beeX = random(20,width-80);
    beeY = 20;

    scoreObjective = 30;
    difficulty = "Medium";
    speed = 10;
    beespeed = 6;
    beesize = 20;
    flowersize = 30;
}  

function myflower(flowerX,flowerY,size){
    let flowerWidth = size;
    let flowerHeight = size;
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;
    fill(45,67,45)
    ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    fill(255,245,0)
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
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

function drawSquare(txt,x,y,fillColor,size,textcolor) {
    textSize(15)
    fill(fillColor)
    rect(x,y,2*size,size)
    fill(textcolor)
    text(txt,x+5,y+25)
}

function displayInfo() {
    textSize(15)
    text(`Difficulty: ${difficulty}`,10,75);
    text(`Objective: ${scoreObjective}`,160,75);
    text(`PlayerSpeed: ${speed}`,310,75);
    text(`BeeDropSpeed: ${beespeed}`,460,75);
    text(`PlayerSize: ${flowersize}`,610,75);
    text(`BeeSize: ${beesize}`,760,75);
}

function draw() {
    background(120,226,255);
    drawSquare("Training",150,10,[100,205,200],40,250)
    drawSquare("Easy",240,10,[107,215,105],40,250)
    drawSquare("Medium",330,10,[250,200,0],40,250)
    drawSquare("Hard",420,10,[250,0,0],40,250)
    drawSquare("Hardcore",510,10,[48,9,20],40,250)
    drawSquare("Impossible",600,10,0,40,250)
    drawSquare("Custom",690,10,250,40,0)

    if (keyIsPressed){
        if (keyCode === LEFT_ARROW) {
            if (xposition > 25) {
                xposition -= speed;
            }
        } else if (keyCode === RIGHT_ARROW) {
            if (xposition < width-25) {
                xposition += speed;
            } 
        }
    } 
    
    myflower(xposition,yposition,flowersize);
    beeY += beespeed;
    if (beeY >= height-3*flowersize+10) {
        if (beeX < xposition+flowersize && beeX > xposition-flowersize) {
            score += 1;
        } else {
            score -= 1;
        }
        beeY = 70;
        beeX = random(20,width);
    } 
    drawBee(beeX,beeY,beesize);
    fill(220)
    rect(10,10,100,40)
    fill(0,0,0);
    textSize(20)
    text(`Score: ${score}`,15,35);

    if (mouseIsPressed) {
        if (mouseX > 150 && mouseX < 230 && mouseY > 10 && mouseY < 50) {
            score = 0
            beeY = 70;
            beeX = random(20,width);
            xposition = width/2;
            yposition = height-60;

            drawSquare("Training",145,5,[100,205,200],45,250)

            scoreObjective = 20;
            difficulty = "Training";
            speed = 10;
            beespeed = 1;
            beesize = 20;
            flowersize = 30;
        } else if (mouseX > 240 && mouseX < 320 && mouseY > 10 && mouseY < 50) {
            score = 0
            beeY = 70;
            beeX = random(20,width);
            xposition = width/2;
            yposition = height-60;

            drawSquare("Easy",235,5,[107,215,105],45,250)

            scoreObjective = 20;
            difficulty = "Easy";
            speed = 10;
            beespeed = 2;
            beesize = 50;
            flowersize = 70;
        } else if (mouseX > 330 && mouseX < 410 && mouseY > 10 && mouseY < 50) {
            score = 0;
            beeY = 70;
            beeX = random(20,width);
            xposition = width/2;
            yposition = height-60;

            drawSquare("Medium",325,5,[250,200,0],45,250)

            scoreObjective = 30;
            difficulty = "Medium";
            speed = 10;
            beespeed = 6;
            beesize = 20;
            flowersize = 30;
        } else if (mouseX > 420 && mouseX < 500 && mouseY > 10 && mouseY < 50) {
            score = 0;
            beeY = 70;
            beeX = random(20,width);
            xposition = width/2;
            yposition = height-60;

            drawSquare("Hard",415,5,[250,0,0],45,250)

            scoreObjective = 30;
            difficulty = "Hard";
            speed = 5;
            beespeed = 6;
            beesize = 20;
            flowersize = 30;
        } else if (mouseX > 510 && mouseX < 590 && mouseY > 10 && mouseY < 50) {
            score = 0
            beeY = 70;
            beeX = random(20,width);
            xposition = width/2;
            yposition = height-60;
            drawSquare("Hardcore",505,5,[48,9,20],45,250)
            scoreObjective = 100;
            difficulty = "Hardcore";
            speed = 5;
            beespeed = 6;
            beesize = 20;
            flowersize = 30;
        } else if (mouseX > 600 && mouseX < 680 && mouseY > 10 && mouseY < 50) {
            score = 0
            beeY = 70;
            beeX = random(20,width);
            xposition = width/2;
            yposition = height-60;
            drawSquare("Impossible",595,5,0,45,250)
            scoreObjective = 100;
            difficulty = "Impossible";
            speed = 2;
            beespeed = 20;
            beesize = 5;
            flowersize = 10;
        } else if (mouseX > 690 && mouseX < 770 && mouseY > 10 && mouseY < 50) {
            score = 0
            beeY = 70;
            beeX = random(20,width);
            xposition = width/2;
            yposition = height-60;
            drawSquare("Custom",685,5,250,45,0)
            scoreObjective = 100;
            difficulty = "Custom";
            speed = 2;
            beespeed = 20;
            beesize = 5;
            flowersize = 10;
        }
    }
    if (difficulty != "Custom") {
        displayInfo()
    } else {
        input = createInput();
        input.position(10,150);
        button = createButton('submit');
        button.position(input.x + input.width, 150);
        button.mousePressed(response);
        greeting = createElement('h', 'Objective (Int)');
        greeting.position(10, 130);

        input2 = createInput();
        input2.position(260,150);
        button2 = createButton('submit');
        button2.position(input2.x + input2.width, 150);
        button2.mousePressed(response2);
        greeting2 = createElement('h', 'PlayerSpeed');
        greeting2.position(260, 130);

        input3 = createInput();
        input3.position(510,150);
        button3 = createButton('submit');
        button3.position(input3.x + input3.width, 150);
        button3.mousePressed(response3);
        greeting3 = createElement('h', 'BeeDropSpeed (Int)');
        greeting3.position(510, 130);

        input4 = createInput();
        input4.position(760,150);
        button4 = createButton('submit');
        button4.position(input4.x + input4.width, 150);
        button4.mousePressed(response4);
        greeting4 = createElement('h', 'PlayerSize (Int)');
        greeting4.position(760, 130);

        input5 = createInput();
        input5.position(1010,150);
        button5 = createButton('submit');
        button5.position(input5.x + input5.width, 150);
        button5.mousePressed(response5);
        greeting5 = createElement('h', 'BeeSize (Int)');
        greeting5.position(1010, 130);
    }
    if (score == scoreObjective) {
        background(0)
        fill(250)
        text("You win!",100,100)
    } else if (score <= -5) {
        background(0)
        fill(250)
        text("You lose!",100,100)
    }
}

function response() {
    const color = input.value();
    input.value('');
    scoreObjective = color
}

function response2() {
    const size = input2.value();
    input.value('');
    speed = size
}

function response3() {
    const size = input3.value();
    input.value('');
    beespeed = size
}

function response4() {
    const size = input4.value();
    input.value('');
    flowersize = size
}

function response5() {
    const size = input5.value();
    input.value('');
    beeSize = size
}

function windowResized() {
    setup();
}