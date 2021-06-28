const cellSize = 100;
const gridSize = 4;
const scoreHeight = 100;
let grid=['s','t','c','s','c','c','c','c','c','c','c','c','c','c','c','c'];
let gameOver;
let score;
let completed;
let linePosition = [];
grid[random('s','c','t')];

function randomGrid(){
    const seed = random(1);
    if (seed < 0.33) {
     return 's'
    }else if (seed > 0.77){
     return 't'
    }
    return 'c'
   }

function newGame() {
    grid = new Array(gridSize * gridSize).fill('t');
    for (let index = 0; index < grid.length; index++) {
     grid[index] = randomGrid();
    }
    gameOver = false;
    completed = false;
    score = 0;
   }

function setup() {
 createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
 newGame();
 noLoop();
 updateCanvas();
}

function mousePressed() {
    linePosition.push(mouseX);
    linePosition.push(mouseY);
    if (linePosition.length == 4) {
        line(linePosition[0],linePosition[1],linePosition[2],linePosition[3]);
        linePosition = [];
    } 
}

function updateCanvas() {
 background(235);
 drawScore();
 drawGrid();
 if (gameOver) {
  drawGameOver();
 }
 if (completed) {
  drawCompleted();
 }
}


function drawCircle(row,col) {
    fill(0,250,0)
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize*4/5)
}

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function drawTriangle(row, col) {
    fill(250,0,0)
    triangle(col*cellSize+1+cellSize/1.2,row*cellSize+1+scoreHeight+(cellSize-cellSize/5),
        col*cellSize+1+cellSize/2,row*cellSize+1+scoreHeight+(cellSize-cellSize/1.25),
        col*cellSize+1+(cellSize-cellSize/1.2),row*cellSize+1+scoreHeight+(cellSize-cellSize/5))
}

function drawGrid() {
 for (let row = 0; row < gridSize; row++) {
  for (let col = 0; col < gridSize; col++) {
   let coloring = {};
   const idx = row * gridSize + col;
   fill(235);
   strokeWeight(2);
   stroke(64);
   rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
   drawCircle(row,col);
   if (grid[idx] === 's'){
       drawSquare(row,col);
   } else if (grid[idx] === 'c'){
       drawCircle(row,col);
   } else if (grid[idx] === 't'){
       drawTriangle(row,col);
   }
  }
 }
}

function drawScore() {
 drawText(`Score: ${score}`,
  color(0, 220, 0, gameOver ? 128 : 255),
  32,
  width / 2,
  scoreHeight / 2);
}

function drawGameOver() {
 drawText('Game Over\r\nPress [Enter] to restart.',
  color(220, 0, 0),
  32,
  width / 2,
  height / 2 + scoreHeight / 2);
}

function drawCompleted() {
 drawText('Congrats on 2048\r\nPress [Enter] to continue.',
  color(0, 220, 0),
  32,
  width / 2,
  height / 2 + scoreHeight / 2);
}

function drawText(msg, inkColor, size, x, y) {
 textAlign(CENTER, CENTER);
 textSize(size);
 fill(inkColor);
 noStroke();
 text(msg, x, y);
}