function setup() {
    createCanvas(windowWidth,windowHeight-60);
}
  
function mycircle(x,y,d,color) {
    fill(color);
    circle(x,y,size);
}

function draw() {
    background(220);
    mycircle(20,20,20,"rgb(250,250,0)")
}
  
function windowResized() {
    setup();
}