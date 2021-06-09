var xspeed = 0;
var yspeed = 450;
var score = 0;
var applex = Math.floor(Math.random() * 500);;
var appley = 0;
var appleSpeed = 5;
var moveSpeed = 5;
var playerSize = 50;

function setup() {
    createCanvas(500,500);
    bg = loadImage('https://thumbs.dreamstime.com/b/flat-grass-sky-background-cartoon-outdoor-park-background-green-grassland-four-bright-sky-flat-grass-sky-background-167561224.jpg');
    background(bg);
}

function windowResized() {
    setup();
}

function draw() {    
  background(bg)  
  if (keyIsPressed){ 
      if (keyCode == LEFT_ARROW){
        if(xspeed>0){
            xspeed -= moveSpeed;
        }  
      } else if (keyCode == RIGHT_ARROW){
        if(xspeed<450){
            xspeed += moveSpeed;
        }  
      } else if (keyCode == UP_ARROW){
        if (playerSize>0){  
          appleSpeed += 1;
          moveSpeed += 1;
          playerSize -= 5;
        }
      } else if (keyCode == DOWN_ARROW){
        if (appleSpeed >= 2){
          appleSpeed -= 1;
          moveSpeed -= 1;
          playerSize += 5;
        }
      }
  }
  text("Your Score: " + score, 10, 10, 100, 100);
  text("Controlls: Left/Right arrow to move basket, up/down arrows to change difficulty (Falling speed and moving speed)", 10, 40, 450, 450);
  fill(150, 100, 0);
  square(xspeed,yspeed,playerSize);
  
  fill(255,0,0);
  circle(applex,appley,25);
  if(appley < 500){
    if (applex>xspeed-playerSize && applex<xspeed+playerSize && appley>yspeed-playerSize/5 && appley<yspeed){
        applex = Math.floor(Math.random() * 500);
        appley = 0;
        score += 1;
    } else{
        appley += appleSpeed;
    }
  }else{
    score -= 1;
    applex = Math.floor(Math.random() * 500);
    appley = 0;
  }
}