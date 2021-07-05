clickLink = []

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    noLoop();
}

function windowResized() {
    setup();
}

function draw(){
    background(220);
    circle(30, 30, 20);
    circle(100, 100, 20);
}

function drawLine(clickLink){
    x1 = clickLink[0][0];
    y1 = clickLink[0][1];
    x2 = clickLink[1][0];
    y2 = clickLink[1][1];
    line(x1,y1,x2,y2);
}

function mouseClicked() {
    if (clickLink.length === 0){
        clickLink.push([mouseX, mouseY]);
    }else if (clickLink.length === 1){
        clickLink.push([mouseX, mouseY]);
        drawLine(clickLink);
        clickLink = [];
    }
}