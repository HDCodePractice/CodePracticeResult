function drawCircle(row,col) {
    fill(200,0,0)
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize*4/5)
}

function drawNumber(row, col, num) {
    fill(0, 102, 153);
    text(num,col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
}

function drawNumber1(row, col, num) {
    fill(255, 255, 255);
    text(num,col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
}

function drawFlag(row, col) {
    fill(0, 102, 153);
    text("🚩",col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
}

function drawGrid() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            currentlydrawing = ((row)*gridSize)+col
            
            const idx = row * gridSize + col;
            stroke(0);
            strokeWeight(2);
            fill(0,200,0);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);

            if (flags[idx] === 't') {
                drawFlag(row, col);
            }else if (flags[idx] === 0) {
                fill(200,100,0);
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            }else if ("12345678".includes(flags[idx])) {
                fill(200,100,0);
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
                drawNumber(row,col,grid[idx]);
            }else if (grid[idx] === 'm'){
                if(gameOver){
                    fill(200,100,0);
                    rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
                    drawCircle(row,col);
                }
            }else if ("12345678".includes(grid[idx])){
                if(gameOver){
                    drawNumber1(row,col,grid[idx]);
                }
            }
        }
    }
}

function drawScore() {
    drawText(`Score: ${score}\r\nPress [Enter] to restart game.\r\n🚩 left: ${flag}`,
    color(0, 220, 0, gameOver ? 128 : 255),
    24,
    width / 2,
    scoreHeight / 2);
} 

function drawText(msg, inkColor, size, x, y) {
    textAlign(CENTER, CENTER);
    textSize(size);
    fill(inkColor);
    noStroke();
    text(msg, x, y);
}

function keyTyped() {
    if (key === 'Enter') {
        newGame();
        setup();
    }
}
// const cellSize = 100;
// const gridSize = 10;
// const scoreHeight = 100;
// let grid=['s','t','c','s','c','c','c','c','c','c','c','c','c','c','c','c'];
// let gameOver;
// let score;
// let completed;
// let linePosition = [];


// function randomGrid(){
//     const seed = random(1);
//     if (seed < 0.33) {
//      return 's'
//     }else if (seed > 0.77){
//      return 't'
//     }
//     return 'c'
//    }
   
//    function newGame() {
//     grid = new Array(gridSize * gridSize).fill('t');
//     for (let index = 0; index < grid.length; index++) {
//      grid[index] = randomGrid();
//     }
//     gameOver = false;
//     completed = false;
//     score = 0;
//    }

// function setup() {
//  createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
//  newGame();
//  noLoop();
//  updateCanvas();
// }

// function mousePressed() {
//     linePosition.push(mouseX);
//     linePosition.push(mouseY);
//     if (linePosition.length == 4) {
//         line(linePosition[0],linePosition[1],linePosition[2],linePosition[3]);
//         linePosition = [];
//     } 
// }

// function updateCanvas() {
//  background(235);
//  drawScore();
//  drawGrid();
//  if (gameOver) {
//   drawGameOver();
//  }
//  if (completed) {
//   drawCompleted();
//  }
// }


// function drawCircle(row,col) {
//     fill(0,250,0)
//     circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize*4/5)
// }

// function drawSquare(row, col) {
//     fill(0,0,250)
//     square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
// }

// function drawTriangle(row, col) {
//     fill(250,0,0)
//     triangle(col*cellSize+1+cellSize/1.2,row*cellSize+1+scoreHeight+(cellSize-cellSize/5),
//         col*cellSize+1+cellSize/2,row*cellSize+1+scoreHeight+(cellSize-cellSize/1.25),
//         col*cellSize+1+(cellSize-cellSize/1.2),row*cellSize+1+scoreHeight+(cellSize-cellSize/5))
// }

// function drawGrid() {
//  for (let row = 0; row < gridSize; row++) {
//   for (let col = 0; col < gridSize; col++) {
//    let coloring = {};
//    const idx = row * gridSize + col;
//    fill(235);
//    strokeWeight(2);
//    stroke(64);
//    rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
//    if(grid[idx]==='s'){
//        drawSquare(row,col)
//    }else if(grid[idx]==='c'){
//        drawCircle(row,col)
//    }else if(grid[idx]==='t'){
//        drawTriangle(row,col)
//    }
//   }
//  }
 

// }

// function drawScore() {
//  drawText(`Score: ${score}`,
//   color(0, 220, 0, gameOver ? 128 : 255),
//   32,
//   width / 2,
//   scoreHeight / 2);
// }

// function drawGameOver() {
//  drawText('Game Over\r\nPress [Enter] to restart.',
//   color(220, 0, 0),
//   32,
//   width / 2,
//   height / 2 + scoreHeight / 2);
// }

// function drawCompleted() {
//  drawText('Congrats on 2048\r\nPress [Enter] to continue.',
//   color(0, 220, 0),
//   32,
//   width / 2,
//   height / 2 + scoreHeight / 2);
// }

// function drawText(msg, inkColor, size, x, y) {
//  textAlign(CENTER, CENTER);
//  textSize(size);
//  fill(inkColor);
//  noStroke();
//  text(msg, x, y);
// }
// let wordselection = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy.On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
// let vs = [];
// let typeWord = ''
// let hp = 100
// let score = 0
// let alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

// class Word{
//   constructor(w,x,y,color){
//       this.w = w;
//       this.x = x;
//       this.y = y;
//       this.color = color;
//   }
//   display(){
//       fill(this.color);
//       text(this.w,this.x,this.y);
//   }
// }

// function getRandomWord(){
//   return random(wordselection.split(" "));
// }

// function setup() {
//   createCanvas(windowWidth,windowHeight-60);
//   background(220);
//   for (let index = 0; index < 3; index++) {
//       word = new Word(getRandomWord(),random(50,width-50),100,"rgb(0,0,0)");
//       vs.push(word);
//   }
// }

// function showWord(w,x,y,xsize,ysize){
//   textSize(20);
//   text(w,x,y,xsize,ysize);
// } 

// function windowResized() {
//     setup();
// }

// function draw(){
//   background(220);
//   for (let index = 0; index < vs.length; index++) {
//       vs[index].display();
//       if (vs[index].y>height){
//           hp -= vs[index].w.length
//           vs[index].w = getRandomWord();
//           vs[index].y = 50;
//           vs[index].x = random(50,width-50);
//           typeWord = "";
//       }else{
//           vs[index].y += 3;
//       }
//   }

//   for (let index = 0; index < vs.length; index++) {
//     if (typeWord === vs[index].w){
//       score += vs[index].w.length
//       vs[index].w = getRandomWord();
//       vs[index].y = 50;
//       vs[index].x = random(50,width-50);
//       typeWord = "";
//     }
//   }
//   if(hp<=0){
//     background(0)
//     textSize(50)
//     fill(255,255,255)
//     text("Game Over",width/2,height/2)
//     fill(0,0,0)
//     }
//   showWord(typeWord,width/2,height-100,1000,1000)
//   showWord("Your HP:" + hp,100,100,1000,1000)
//   showWord("Your Score:" + score,100,200,1000,1000)
// }

// function keyTyped() {
//     if (key === ' '){
//       return
//     }
//     if (keyCode === BACKSPACE || keyCode === DELETE){
//       typeWord=typeWord.slice(0,-1);
//     } else if (keyCode === ENTER){
//       typeWord = ''
//     } else{
//       typeWord += key
//     }
//   }
// let typeWord = ""
// let score = 0
// let speed = 3;
// let words = [];
// let wordsx = [];
// let wordsy = [];
// let wordsCount = 10;
// let HP = 100
// let luck = 0
// let luckywordx = 0
// let cursornumid = 0
// let luckyword = ""
// let hasluckyword = false


// function setup() {
//     createCanvas(windowWidth,windowHeight-60);
//     background(220);
//     for (let index = 0; index < wordsCount; index++) {
//         words.push(getRandomWord)
//         wordsx.push(random(50,width-50))
//         wordsy.push(50)

//     }
// }

// function windowResized() {
//     setup();
// }

// function bonusworddecide(){
//   luck = Math.floor(Math.random() * 101); 
//   if (luck === 1){
//     let words = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy. On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
//     luckyword = random(words.split(" "));
//     hasluckyword = true
//   }
// }

// function getRandomWord(){
//     let word = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy. On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
//     return random(word.split(" "));
// }


// function showWord(w,x,y){
//     textSize(20);
//     text(w,x,y);
//   }


// function draw(){
//     background(0);
//     bonusworddecide();
//     if (words >= height){
//       words = getRandomWord();
//       words = word.replace(/[\p{P}$+<=>^`|~]/gu, '')
//       typeWord = "";
//       wordsy = 100;
//       typeWord = "";
//       HP -= words.length
//     }
    
//     words += speed;


//     fill(250,250,250)
//     showWord("Your Score: " + score,width/10,50);
//     showWord("HP: " + HP,width/10,100);
//     showWord(words,wordsx,wordsy);
//     for (let index = 0; index < wordsCount; index++) {
//         showWord(words[index],wordsx[index],wordsy[index],"rgb(0,0,0)")
//         wordsy[index] += speed;
//         if (wordsy[index] >= height){
//           resetWorld(index);
//         }
//     }
    
//     if (hasluckyword === true){
//       luckywordx += speed;
//       fill(255,215,0);
//       showWord(luckyword,luckywordx,height/2);
//     }if (luckywordx >= width){
//         hasluckyword = false;
//         luckyword = '';
//         bonusworddecide();
//       }
    
//     fill(250,250,250)
//     textSize(20);
//     if (cursornumid=30){
//       showWord(typeWord + "|",width/2,height-60);
//     } else {
//       showWord(typeWord,width/2,height-60);
//       cursornumid += 1;
//     }
//     if(HP<=0){
//         background(0)
//         textSize(50)
//         text("Game Over",width/2,height/2)
//     }
      
//     print(score)

// }
// function keyTyped() {
//   if (keyCode === BACKSPACE || keyCode === DELETE){
//   typeWord=typeWord.slice(0,-1);
//   }else if(key === " "){
//       typeWord=typeWord.slice(0,-1);
//   } else{
//     typeWord += key
//   }
//   for (let index = 0; index < wordsCount; index++) {
//     if (typeWord == words[index]){
//       resetWorld(index);
//       typeWord = "";
//     }
//   }


// }
// let yposition = 50
// let word1 = ""
// let word2 = ""
// let word3 = ""
// let typeWord = ""
// let speed = 3
// let score = 0
// let xposition = 0
// let xposition1 = 0
// let xposition2 = 0
// function setup() {
//     createCanvas(windowWidth,windowHeight-60);
//     background(220);
//     word1 = getRandomWord();
//     word2 = getRandomWord();
//     word3 = getRandomWord();
//     xposition = random(20,width-20)
//     xposition1 = random(20,width-20)
//     xposition2 = random(20,width-20)
// }

// function windowResized() {
//     setup();
// }


// function getRandomWord(){
//     let words = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said  vaccinating 70% to 85% of the U.S. population would enable a return to normalcy. On a global scale, a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
//     return random(words.split(" "));
// }


// function showWord(w,x,y){
//     textSize(20);
//     text(w,x,y);
// }


// function draw(){
//     background(220);
//     showWord(word1,xposition,yposition);
//     showWord(word2,xposition1,yposition);
//     showWord(word3,xposition2,yposition);
//     textSize(20);
//     text(typeWord,100,200);
//     yposition += speed
//     if (yposition >= height){
//       yposition = 50
//       score -= 1
//       xposition = random(20,width-20)
//       xposition1 = random(20,width-20)
//       xposition2 = random(20,width-20)
//     }
    
//     text("score:"+score,500,50)

// }

// function keyTyped() {
//   if (keyCode === BACKSPACE || keyCode === DELETE){
//     typeWord=typeWord.slice(0,-1);
//   }else{
//     typeWord += key;
//   }
//   if(keyCode === RETURN){
//     word1 = getRandomWord()
//     word2 = getRandomWord()
//     word3 = getRandomWord()
//     typeWord = typeWord.slice(0,-5)
//   }
//   if (typeWord == word1){
//     typeWord = ""
//     word1 = getRandomWord();
//     score+=1
//     xposition = random(20,width-20)
//     yposition = 50

//   } else if (typeWord == word2){
//     typeWord = ""
//     word2 = getRandomWord();
//     score+=1
//     xposition1 = random(20,width-20)
//     yposition = 50
//   }else if (typeWord == word3){
//     typeWord = ""
//     word3 =getRandomWord();
//     score+=1
//     xposition2 = random(20,width-20)
//     yposition = 50
//   }
// }
// // var xposition;
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

