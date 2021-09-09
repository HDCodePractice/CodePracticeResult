const cellSize = 20;
const gridSize = 15;
const scoreHeight = 50;
let speed = 7;
const appleConunt = 2;
const selectWidth = 200;
let grid = [];
let snake = [];
let direction = "r";  // l, r, u, d
let score;
let apple = 0;
let apples = [];
let gameOver = false;
let appleCount = 5;

function colRowToIndex(col, row) {
  return row * gridSize + col;
}

function indexToColRow(index) {
  return [ int(index / gridSize) , index % gridSize];
}

function drawCircle(row,col) {
    fill(0,250,0)
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize*4/5)
}

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function drawApple(row, col) {
    fill(0, 102, 153);
    textSize(cellSize*3/4);
    text("🍎",col*cellSize+cellSize/7,scoreHeight+row*cellSize+cellSize/1.3);
}

function newGame(){
    snake = [
        colRowToIndex(3,int(gridSize/2)),
        colRowToIndex(2,int(gridSize/2)),
        colRowToIndex(1,int(gridSize/2))
    ];
    direction = "";
    apples = [];
    apples.push(colRowToIndex(int(gridSize* 3/4), int(gridSize/2)));
    for (let index = 1; index < appleCount; index++) {
        apples.push(newApple());
    }
}

function setup() {
    createCanvas(cellSize * gridSize + 2 + selectWidth, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    
    let speedInput = createInput(speed);
    speedInput.position(width - selectWidth + 90, height/2);
    speedInput.size(selectWidth - 100, 20);
    speedInput.input(inputSpeed);
    gameOver = false;
    frameRate(speed);
    let appleInput = createInput(appleCount)
    appleInput.position(width - selectWidth + 90, height/3)
    appleInput.size(selectWidth-100, 20)
    appleInput.input(inputApple)
    gameOver = false
}

function inputSpeed(){
    speed = int(this.value());
    print(speed);
    frameRate(speed);
}
function inputApple(){
    appleCount = int(this.value())
    print(appleCount)
    appleCount==appleCount

}
function speeds(){
    frameRate(speed)
}

function keyPressed() {
    if (key === 'Enter') {
        setup();
    }else if (key === 'Shift'){
        speed +=1
        print(speed)
        speeds()
    }
    if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
            direction = "l";
    } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
            direction = "r";
    } else if (keyCode === UP_ARROW && snake[1] != snake[0] - gridSize) {
        direction = "u";
    } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
        direction = "d";
    }
}

function newApple() {
    notsnake = [];
    for (let index = 0; index < gridSize*gridSize; index++) {
        if (!snake.includes(index) && !apples.includes(index)){
            notsnake.push(index);
        }
    }
    return int(random(notsnake));
}

function resetApple(appleid) {
    idx = apples.indexOf(appleid)
    let appleid2
    appleid2 = colRowToIndex(int(random(gridSize)), int(random(gridSize)));
    while (snake.includes(appleid2)){
        appleid2 = colRowToIndex(int(random(gridSize)), int(random(gridSize)));
    }
    apples[idx] = appleid2
    print(apple);
}

function checkOnApple() {
    if (apples.includes(snake[0])){
        resetApple(snake[0]);
        print(apples)
    } else {
        snake.splice(snake.length-1, 1)
    }
}

function updateSnake(){
    if (!gameOver){
        if (direction === "r"){
            if (snake[0] % gridSize === gridSize - 1){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]+1)
            }
        }else if (direction === "u"){
            if (snake[0] < gridSize){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]-gridSize);
            }
        }else if (direction === "d"){
            if (snake[0] >= gridSize * (gridSize-1)){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]+gridSize);
            }
        }else if (direction === "l"){
            if (snake[0] % gridSize === 0){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]-1);
            }
        }
        for (let s = 1; s < snake.length; s++) {
            if (snake[0] == snake[s]) {
                gameOver = true;
            }
        }
    }
}

function drawGameOver() {
    fill(255,0,0);
    textSize(int(width/10));
    text(
        'GAME OVER\nClick [Enter] to restart',
        5,
        height/2-10
    );
}

function draw() {

    if (gameOver){
        drawGameOver();
    }else{
        background(220);
        updateSnake();
        for (let col = 0; col < gridSize; col++) {
            for (let row = 0; row < gridSize; row++) {
                const idx = colRowToIndex(col, row);
                fill(255,248,220);
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 1);
                if (snake.includes(idx)){
                    if (idx == snake[0]){
                        drawCircle(row,col);
                    } else {
                        drawSquare(row,col);
                    }
                } else if (apples.includes(idx)) {
                    drawApple(row,col);
                }
            }
        }
    }
    fill(0,0,0)
    textSize(20)
    text("Speed:",width- selectWidth +15, height/2.4)
    text("Apple:",width-selectWidth+10,height/4.1)

}