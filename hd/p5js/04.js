let inputString = ""
var xspeed = 100
var yspeed = 100

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
}

function windowResized() {
    setup();
}
function draw() {
    background(220)
    if (keyIsPressed){ 
      if(keyCode === UP_ARROW){
        if (yspeed>25){
          yspeed -= 5;
        }
      } else if (keyCode === DOWN_ARROW){
        if (yspeed<height-25){
          yspeed += 5;
        }
      } else if (keyCode === LEFT_ARROW){
        if (xspeed>25){
          xspeed -= 5;
        }
      } else if (keyCode === RIGHT_ARROW){
        if (xspeed<width-25){
          xspeed += 5;
        }
      }
  }
  circle(xspeed,yspeed,50);
}