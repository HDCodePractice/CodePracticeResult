let yposition = 50
let word1 = ""
let word2 = ""
let word3 = ""
let typeWord = ""
let speed = 3
let score = 0
let xposition = 0
let xposition1 = 0
let xposition2 = 0
function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    word1 = getRandomWord();
    word2 = getRandomWord();
    word3 = getRandomWord();
    xposition = random(20,width-20)
    xposition1 = random(20,width-20)
    xposition2 = random(20,width-20)
}

function windowResized() {
    setup();
}


function getRandomWord(){
    let words = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said  vaccinating 70% to 85% of the U.S. population would enable a return to normalcy. On a global scale, a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
    return random(words.split(" "));
}


function showWord(w,x,y){
    textSize(20);
    text(w,x,y);
}


function draw(){
    background(220);
    showWord(word1,xposition,yposition);
    showWord(word2,xposition1,yposition);
    showWord(word3,xposition2,yposition);
    textSize(20);
    text(typeWord,100,200);
    yposition += speed
    if (yposition >= height){
      yposition = 50
      score -= 1
      xposition = random(20,width-20)
      xposition1 = random(20,width-20)
      xposition2 = random(20,width-20)
    }
    
    text("score:"+score,500,50)

}

function keyTyped() {
  if (keyCode === BACKSPACE || keyCode === DELETE){
    typeWord=typeWord.slice(0,-1);
  }else{
    typeWord += key;
  }
  if(keyCode === RETURN){
    word1 = getRandomWord()
    word2 = getRandomWord()
    word3 = getRandomWord()
    typeWord = typeWord.slice(0,-5)
  }
  if (typeWord == word1){
    typeWord = ""
    word1 = getRandomWord();
    score+=1
    xposition = random(20,width-20)
    yposition = 50

  } else if (typeWord == word2){
    typeWord = ""
    word2 = getRandomWord();
    score+=1
    xposition1 = random(20,width-20)
    yposition = 50
  }else if (typeWord == word3){
    typeWord = ""
    word3 =getRandomWord();
    score+=1
    xposition2 = random(20,width-20)
    yposition = 50
  }
}
// var xposition;
// var yposition;
// let speed = 5
// let playerSpeed = 7
// let size = 50
// let circleX = 0
// let circleY = 50
// let score = 0
// let ballSize = 50
// let song;
// let song1;
// function setup() {
//     createCanvas(windowWidth,windowHeight-50)
//     xposition = width/2;
//     yposition = height-50
//     fill(255,255,0)
//     circleX = random(20,width-20) 
//     song = loadSound('1627 Overland Dr 10.m4a')
//     song1 = loadSound('1627 Overland Dr 11.m4a')
// }   
// function draw() {
//     background(220)
//     circleY += speed
//     if (xposition<=circleX+size&&xposition>=circleX-size&&yposition<=circleY+size&&yposition>=circleY){
//       circleY=50
//       circleX = random(20,width-20)
//       score +=1
//       song.play()
//     }else if (circleY > height){
//       circleY = 50
//       circleX = random(20,width-20)
//       score -= 1
//       song1.play()
//     }
//     if (keyIsPressed){
//        if (keyCode === LEFT_ARROW) {
//             if (xposition > 50) {
//                 xposition -= playerSpeed;
//             }
//         } else if (keyCode === RIGHT_ARROW) {
//             if (xposition < width-50) {
//                 xposition += playerSpeed;
//             } 
//         }
//         if(key === "a"){
//           size+=1
//           if (size >= 75){
//             size -=1
//           }
//         }
//         if(key === "l"){
//           speed +=1
//           if(speed >= 11){
//             speed-=1
//           }
//         }
//         if(key === "b"){  
//             playerSpeed += 1
//             if(playerSpeed >= 17){
//               playerSpeed -=1
//             }
            
//           }
//         if(key === "k"){
//           playerSpeed -=1
//           if(playerSpeed <=7){
//             playerSpeed +=1
//           }
//         }
//     }   if(key === "t"){
//           speed -=1
//           if(speed <=5){
//             speed +=1
//           }
//     }

//     happyFace(xposition,yposition,size)
//     fill(255,255,0)
//     circle(circleX,circleY,ballSize)
//     text("score: "+score,50,50)
//     text("Your speed:"+playerSpeed,130,50)
//     text("Ball speed:" + speed, 230,50)
//     text("Press b to make your player's speed be faster or press k to lower it. Also, press A to make your charcter bigger, and press l to make the ball faster or press t to make it slower", 330,50)
//     text("Difficulty:Easy",50,100)
//     text("Difficulty:Medium",150,100)
//     text("Difficulty:Hard",280,100)
//     text("Reset Score",380,100)
//     text("AI bot", 480,100)
//     text ("For AI keep your mouse on top of the text ai bot, but for the other ones just click them",600,100)
//     // rect(480,87,40,20)
//     if(mouseX>=480&&mouseX<=520&&mouseY>=87&&mouseY<=107){
//       if(xposition>circleX){
//         xposition -= playerSpeed
//       }else if(xposition<circleX){
//         xposition += playerSpeed
//       }
//     }

// }
// function mouseClicked(){
//   if(mouseX>=50&&mouseX<=130&&mouseY>=90&&mouseY<=110){
//     playerSpeed = 10
//     speed = 3
//     ballSize = 70
//   }else if(mouseX>=150&&mouseX<=250&&mouseY>=87&&mouseY<=107){
//     playerSpeed = 7
//     speed = 5
//     ballSize = 40
//   }else if(mouseX>=280&&mouseX<=360&&mouseY>=87&&mouseY<=107){
//     playerSpeed = 5
//     speed=8
//     ballSize = 25
//   }else if(mouseX>=380&&mouseX<=450&&mouseY>=87&&mouseY<=107){
//     score=0
//   }
// }
// function happyFace (x, y, diam) {
//   // Face
//   fill(255, 255, 0);
//   stroke(0);
//   strokeWeight(2);
//   ellipse(x, y, diam, diam);
  
//   // Smile
//   var startAng = .1*PI
//   var endAng = .9*PI
//   var smileDiam = .6*diam;
//   arc(x, y, smileDiam, smileDiam, startAng, endAng);
  
//   // Eyes
//   var offset = .2*diam;
//   var eyeDiam = .1*diam;
//   fill(0);
//   ellipse(x-offset, y-offset, eyeDiam, eyeDiam);
//   ellipse(x+offset, y-offset, eyeDiam, eyeDiam);
// }
// function setup() {
//     createCanvas(windowWidth,windowHeight-60);
//     background(220);
//   }
// function mycircle(x,y,size,color) {
//       fill(color)
//       circle(x,y,size)
//   }
// function aquacircle(x,y){
//     mycircle(x,y,20,"rgb(0,255,255)")
// }
// function myflower(x,y,size,color1,color2){
//     let flowerX = x;
//     let flowerY = y;
//     let flowerWidth = size;
//     let flowerHeight = size;
//     let flowerXDistance = flowerWidth/2;
//     let flowerYDistance = flowerHeight/2;
//     fill(color2)
//     // // 左上角的花瓣
//     ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
//     // // 左下角的花瓣
//     ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
//     // // 右下角的花瓣
//     ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
//     // // 右上角的花瓣
//     ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
//     // 花蕊
//     fill(color1)
//     ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
//   }
// function doubleClicked(){
//     myflower(mouseX,mouseY,50,'rgb(255,255,0)','rgb(0,0,255)')
// }
// function draw() {
 
    
//   }
//   function yellowcircle(x,y){
//       mycircle(x,y,5,"rgb(255,255,0)")
//   }
//   function mouseMoved(){
//       yellowcircle(mouseX,mouseY)
//   }
//   function mousePressed(){
//         aquacircle(mouseX,mouseY)

//   }
//   function redcircle(x,y){
//       mycircle(x,y,30,"rgb(255,0,0)")
//   }
// function windowResized() {
//     setup();
//   }
// let size = 500;
// let circleX = 0
// let circleY = 100
// let speed = 5;
// let speedY = speed/3;
// let speedX = speed;
// let isNight = false;

// function setup() {
//     createCanvas(size, size);
// }
  
// function draw() {
//     background(220); 
//     speedX = speed
//     speedY = speed/3
//     if (circleX > width) {
//         circleX = 0
//         circleY =100
//         if (isNight){
//             isNight = false;
//         }else{
//             isNight = true;
//         }
//     }else if (circleX < 25){
//         speedX = speed;
//     }else if (circleX < width/2){
//         circleY -= speedY;
//     }else{
//         circleY += speedY;
//     }
//     circleX += speedX;
//     if (isNight){
//         drawFlower(width/2,height-height/5,width/5,width/5,10,10,10,250,250,250)
//         drawFlower(width/10,height -height/10,width/10,width/10,10,10,10,250,250,250)
//         drawFlower(width-width/10,height-height/10,width/10,width/10,10,10,10,250,250,250)
//         sunMoon(circleX,circleY,'rgb(250,250,250)')
     
//     }else{
//         drawFlower(width/2,height-height/5,width/5,width/5,50,80,250,241,203,2)
//         drawFlower(width/10,height -height/10,width/10,width/10,50,80,250,241,203,2)
//         drawFlower(width-width/10,height-height/10,width/10,width/10,50,80,250,241,203,2)
//         sunMoon(circleX,circleY,'rgb(241,203,2)')

        

//     }
// }
// function sunMoon(x,y,color){
//     fill(color)
//     circle(x,y,50)
    

  
// }



// function drawFlower(flowerX,flowerY,flowerWidth,flowerHeight,firstColor,secondColor,thirdColor,color1,color2,color3){
//     let flowerXDistance = flowerWidth/2;
//     let flowerYDistance = flowerHeight/2;
//     fill(firstColor,secondColor,thirdColor)
//     ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
//     // // 左下角的花瓣
//     ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
//     // // 右下角的花瓣
//     ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
//     // // 右上角的花瓣
//     ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
//     // 花蕊
//     fill(color1,color2,color3)
//     ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
// }  

// function nightControl(){
//     if (isNight){
//         fill(250,250,250);
//         drawFlower(width/2,height-height/5,width/5,width/5,10,10,10,250,250,250)
//         drawFlower(width/10,height -height/10,width/10,width/10,10,10,10,250,250,250)
//         drawFlower(width-width/10,height-height/10,width/10,width/10,10,10,10,250,250,250)
//     }else{
//         fill(241,203,2);
//         drawFlower(width/2,height-height/5,width/5,width/5,50,80,250,241,203,2)
//         drawFlower(width/10,height -height/10,width/10,width/10,50,80,250,241,203,2)
//         drawFlower(width-width/10,height-height/10,width/10,width/10,50,80,250,241,203,2)
//     }

// circle(circleX,circleY,50);
    // if (circleY < 250 && circleY >= 25 && circleX >= 250 && circleX < 475) {
    //     circleY += speed;
    //     circleX += speed;

    // } else if (circleX <= 475 && circleX > 250 && circleY >= 250 && circleY < 475) {
    //     circleY += speed;
    //     circleX -= speed;
    // } else if (circleX <= 250 && circleX > 25 && circleY <= 475 && circleY > 250) {
    //     circleY -= speed;
    //     circleX -= speed;
    // } else if (circleX >= 25 && circleX < 250 && circleY <= 250 && circleY > 25) {
    //     circleY -= speed;
    //     circleX += speed;
    // }
    
    // if (circleX > width-26){
    //     speedX = -5;
    // }else if (circleX < 26){
    //     speedX = 5;
    // }

    // if (speedX > 0){
    //     if (circleX <width/2){
    //         speedY = -1;
    //     }else{
    //         speedY = 1;
    //     }    
    // }else{
    //     if (circleX <width/2){
    //         speedY = 1;
    //     }else{
    //         speedY = -1;
    //     }
    
    // }

    // circleX += speedX;
    // circleY += speedY;
    // circle(circleX, circleY,50);

//     let x = 20;
//     for (let i = 1; i < 8; i++) {
//         circle(x,y,10)
        
//         if( y <width/2 ){
//             x=x+1
//         }else{
//             y+=1
        
//         }
//     }
// }












    // circle(circleX,circleY,50);
    // if (circleY < 250 && circleY >= 25 && circleX >= 250 && circleX < 475) {
    //     circleY += speed;
    //     circleX += speed;
    //     circle(circleX,circleY,50)
  
    // } else if (circleX <= 475 && circleX > 250 && circleY >= 250 && circleY < 475) {
    //     circleY += speed;
    //     circleX -= speed;
    // } else if (circleX <= 250 && circleX > 25 && circleY <= 475 && circleY > 250) {
    // //     circleY -= speed;
    // //     circleX -= speed;
    // } else if (circleX >= 25 && circleX < 250 && circleY <= 250 && circleY > 25) {
    //     circleY -= speed;
    //     circleX += speed;
    //     circle(circleX, circleY,50)
    // }
    


  
    
    
//     if (circleX > width - 30) {
//         speed = -5;
//     }
//     if(circleY < 30){
        
//         speed = 5;
    
//     }
//     if(circleX < 30){
        
//         speed = -5;
    
//     }
    

    
//     circleY += speed;
//     circleX -= speed;
    
 

// function draw() {
//     background(220);
//     circle(circleX,circleY,50); 
//     if (circleY > height - 30) {
//         speed = -5;
//     }
//     if(circleY < 30){
        
//         speed = 5;
//     }
//     circleY += speed;
// }
// function draw() {
//     background(220);
//     circle(circleX,circleY,50); 
//     if (circleY > height - 30) {
//         speed = 0;
//     }
//     else{
//          speed = 5;
//     }
//     circleY += speed;
// }

