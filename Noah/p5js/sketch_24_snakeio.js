const cellSize = 30;
const gridSize = 10;
const scoreHeight = 50;
const speed = 5;

let grid = [];
let snake = [];
let direction = "r";  // l, r, u, d
let score = 0;
let apple = 0;
let applex;
let appley;
let gameOver = false;

function colRowToIndex(col, row) {
  return row * gridSize + col;
}

function indexToColRow(index) {
  return [ int(index / gridSize) , index % gridSize];
}

function drawHead(row,col) {
    fill(100,0,100)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function drawApple(row, col) {
    fill(250,0,0)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function newGame(){
    applex = randomLocation()[0];
    appley = randomLocation()[1];
    snake = [
        colRowToIndex(3,int(gridSize/2)),
        colRowToIndex(2,int(gridSize/2)),
        colRowToIndex(1,int(gridSize/2))
    ];
    direction = "r";
    apple = colRowToIndex(int(gridSize* 3/4), int(gridSize/2));
    print(apple)
}

function setup() {
    createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    gameOver = false;
    frameRate(speed);
}

function keyPressed() {
    if (key === 'Enter') {
        setup();
    }
    if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
        direction = "l";
    } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
        direction = "r";
    } else if (keyCode === UP_ARROW  && snake[1] != snake[0] - gridSize) {
        direction = "u";
    } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
        direction = "d";
    }
}

function updateSnake(){
    if (!gameOver){
        if (direction === "r"){
            if (snake[0] % gridSize === gridSize - 1){
                gameOver = true;
            } else {
                snake.splice(snake.length-1, 1)
                snake.splice(0,0,snake[0]+1)
            }
        } else if (direction === "u") {
            if (snake[0] < gridSize) {
                gameOver = true;
            } else {
                snake.splice(snake.length-1, 1)
                snake.splice(0,0,snake[0]-gridSize)
            }
        } else if (direction === "d") {
            if (snake[0] >= gridSize * (gridSize-1)) {
                gameOver = true;
            } else {
                snake.splice(snake.length-1, 1)
                snake.splice(0,0,snake[0]+gridSize)
            }
        } else if (direction === "l") {
            if (snake[0] % gridSize === 0) {
                gameOver = true;
            } else {
                snake.splice(snake.length-1, 1)
                snake.splice(0,0,snake[0]-1)
            }
        } 
        if (snake[0] == apple) {
            score += 1;
            snake.push(colRowToIndex(snake[snake.length+1],int(gridSize/2)))
            applex = randomLocation()[0];
            appley = randomLocation()[1];
            drawApple(applex,appley);   
            print(score)    
        } 
        for (let s = 1; s < snake.length; s++) {
            if (snake[0] == snake[s]) {
                gameOver = true;
            }
        }
    }
}

function drawGameOver() {
    fill(255,0,0)
    textSize(int(width/(30-gridSize)));
    text('GAME OVER\nClick [Enter] to restart',width/2,height/2)
}

function draw() {
    if (gameOver){
        drawGameOver();
    }else{
        background(220);
        stroke(0);
        strokeWeight(1.5);
        updateSnake();
        for (let col = 0; col < gridSize; col++) {
            for (let row = 0; row < gridSize; row++) {
                const idx = colRowToIndex(col, row);
                fill(0,random(100,107),0);
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 1);
                if (snake.includes(idx)){
                    if (idx == snake[0]){
                        drawHead(row,col);
                    } else {
                        drawSquare(row,col);
                    }
                } else if (idx == apple) {
                    drawApple(applex,appley);    
                    apple = colRowToIndex(appley,applex)   
                }
                
            }
        }
    }
}

function randomLocation() {
    return [int(random(0,gridSize-1)), int(random(0,gridSize-1))]
}