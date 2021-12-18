let size = 500;
let circleX = 0;
let circleY = 100;
let speed = 5;
let speedY = speed/3;
let speedX = speed;
let isNight = false;

function setup() {
    createCanvas(size, size);
}
  
function draw() {
    background(220); 
    // // main(0,100,5)
    // if (circleX > width) {
    //     circleX = 0;
    //     circleY = 100;
    //     if (isNight){
    //         isNight = false;
    //     }else{
    //         isNight = true;
    //     }
    // }else if (circleX < 25){
    //     speedX = speed;
    // }
    // if (circleX < width/2){
    //     circleY -= speedY;
    // }else{
    //     circleY += speedY;
    // }
    // circleX += speedX;
    // circle(circleX,circleY,50);
    drawFlower(width/2,height-height/5,width/5,width/5,50,80,250,241,203,2)
    drawFlower(75,425,width/10,width/10,50,80,250,241,203,2)
    drawFlower(425,425,width/10,width/10,50,80,250,241,203,2)
    // nightControl()

}
// function main(circleX,circleY,speed){
//     speedX = speed
//     speedY = speed/3
//     if (circleX > width) {
//         // circleX = 0;
//         // circleY = 100;
//         if (isNight){
//             isNight = false;
//         }else{
//             isNight = true;
//         }
//     }else if (circleX < 25){
//         speedX = speed;
//     }
//     if (circleX < width/2){
//         circleY -= speedY;
//     }else{
//         circleY += speedY;
//     }
//     circleX += speedX;
//     circle(circleX,circleY,50);
// }


function nightControl(){
    if (isNight){
        fill(250,250,250);
        drawFlower(width/2,height-height/5,width/5,width/5,10,10,10,250,250,250)
        drawFlower(100,400,width/5,width/5,10,10,10,250,250,250)
        drawFlower(400,400,width/5,width/5,10,10,10,250,250,250)
    }else{
        fill(241,203,2);
        drawFlower(width/2,height-height/5,width/5,width/5,50,80,250,241,203,2)
        drawFlower(100,400,width/5,width/5,50,80,250,241,203,2)
        drawFlower(400,400,width/5,width/5,50,80,250,241,203,2)
    }

}
function drawFlower(flowerX,flowerY,flowerWidth,flowerHeight,firstColor,secondColor,thirdColor,color1,color2,color3){
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;
    fill(firstColor,secondColor,thirdColor)
    ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // // 左下角的花瓣
    ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右下角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
    // // 右上角的花瓣
    ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
    // 花蕊
    fill(color1,color2,color3)
    ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
}  
// function setup() {
//     createCanvas(windowWidth,windowHeight-60);
//     frameRate(1);
//   }
  
//   function draw() {
//     background(220);
//     let flowerX = random(0,width);
//     let flowerY = random(0,height);
//     // let flowerRadius = random(25,150);
//     let flowerWidth = random(25,150);
//     let flowerHeight = random(25,150);
//     let flowerXDistance = flowerWidth/2;
//     let flowerYDistance = flowerHeight/2;
  
//     for (let i = 0; i < 100; i++) {
//       fill(135,40,158)
//       // // 左上角的花瓣
//       ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
//       // // 左下角的花瓣
//       ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
//       // // 右下角的花瓣
//       ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
//       // // 右上角的花瓣
//       ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
//       // 花蕊
//       fill(253,242,99)
//       ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
        
//       flowerX = random(0,width);
//       flowerY = random(0,height);
//       flowerWidth = random(25,150);
//       flowerHeight = random(25,150);
//       flowerXDistance = flowerWidth/2;
//       flowerYDistance = flowerHeight/2;
//     }  
//   }
  
//   function windowResized() {
//     setup();
//   }
// function setup() {
//     createCanvas(windowHeight-100,windowHeight-100);
//     frameRate(0.5)
// }
  
//   function draw() {
//     background(220);
//     let flowerX = random(0,width)
//     let flowerY = random(0,height)
//     let flowerSize = random(25,100)
//     // let flowerColor = random(0,255)
//     let flowerDistance = flowerSize / 2
//     let flowerXX = random(0,width)
//     let flowerYY = random(0,height)
//     let flowerSIZE = random(25,100)
//     let flowerDIstance = flowerSIZE / 2
//     let flowerXXX = random(0,width)
//     let flowerYYY = random(0,height)
//     let flowerSIZEE = random(25,100)
//     let flowerDIStance = flowerSIZEE / 2
//     let flowerXXXX = random(0,width)
//     let flowerYYYY = random(0,height)
//     let flowerSIZEEE = random(25,100)
//     let flowerDISTance = flowerSIZEEE / 2
//     fill(255,0,0)
//     circle(flowerX-flowerDistance,flowerY-flowerDistance,flowerSize)
//     circle(flowerX-flowerDistance,flowerY+flowerDistance,flowerSize)
//     circle(flowerX+flowerDistance,flowerY+flowerDistance,flowerSize)
//     circle(flowerX+flowerDistance,flowerY-flowerDistance,flowerSize)
//     fill(255,255,0)
//     circle(flowerX,flowerY,flowerSize)
//     fill(255,0,0)
//     circle(flowerXX-flowerDIstance,flowerYY-flowerDIstance,flowerSIZE)
//     circle(flowerXX-flowerDIstance,flowerYY+flowerDIstance,flowerSIZE)
//     circle(flowerXX+flowerDIstance,flowerYY+flowerDIstance,flowerSIZE)
//     circle(flowerXX+flowerDIstance,flowerYY-flowerDIstance,flowerSIZE)
//     fill(255,255,0)
//     circle(flowerXX,flowerYY,flowerSIZE)
//     fill(255,0,0)
//     circle(flowerXXX-flowerDIStance,flowerYYY-flowerDIStance,flowerSIZEE)
//     circle(flowerXXX-flowerDIStance,flowerYYY+flowerDIStance,flowerSIZEE)
//     circle(flowerXXX+flowerDIStance,flowerYYY+flowerDIStance,flowerSIZEE)
//     circle(flowerXXX+flowerDIStance,flowerYYY-flowerDIStance,flowerSIZEE)
//     fill(255,255,0)
//     circle(flowerXXX,flowerYYY,flowerSIZEE)
//     fill(255,0,0)
//     circle(flowerXXXX-flowerDISTance,flowerYYYY-flowerDISTance,flowerSIZEEE)
//     circle(flowerXXXX-flowerDISTance,flowerYYYY+flowerDISTance,flowerSIZEEE)
//     circle(flowerXXXX+flowerDISTance,flowerYYYY+flowerDISTance,flowerSIZEEE)
//     circle(flowerXXXX+flowerDISTance,flowerYYYY-flowerDISTance,flowerSIZEEE)
//     fill(255,255,0)
//     circle(flowerXXXX,flowerYYYY,flowerSIZEEE)
//     // fill(0,0,0)
//     // triangle(width*13/17,height*85/170,width*135/170,height*8/17,width*15/17,height*85/170)
//     // fill(255,255,0)
//     // ellipse(width*105/170,height*85/170,width*7/17,height*4/17)
//     // circle(width*75/170,height*75/170,width*5/17)
//     // fill(0,0,0)
//     // line(width*105/170,height*65/170,width*105/170,height*105/170)
//     // line(width*125/170,height*7/17,width*125/170,height*10/17)
//     // circle(width*65/170,height*65/170,width*1/17)
//     // circle(width*85/170,height*65/170,width*1/17)
//     // line(width*85/170,height*53/170,width*85/170,height*4/17)
//     // line(width*65/170,height*53/170,width*65/170,height*4/17)
//     // circle(width*65/170,height*4/17,width*1/17)
//     // circle(width*85/170,height*4/17,width*1/17)
//     // fill(255,255,255)
//     // arc(width*75/170,height*85/170,width*2/17,height*2/17,PI,QUARTER_PI,CHORD)
  
//   }
//   function windowResized() {
//       setup();
//   }