let message = ""

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
}

function windowResized() {
    setup();
}
function draw() {
    background(220);
    textSize(20);
    text(message,100,100);
}
function keyTyped(){
  if (keyCode === BACKSPACE || keyCode === DELETE){
    message=message.slice(0,-1);
  }else{
    message += key
  }
}