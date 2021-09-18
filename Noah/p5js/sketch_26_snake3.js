const cellSize = 20;
const gridSize = 15;
const scoreHeight = 50;
let speed = 10;
let MaxHP = 20;
let HP = MaxHP;
const selectWidth = 200;

let grid = [];
let snake = [];
let direction = "r";  // l, r, u, d
let score;
let apple = 0;
let apples = [];
let gameOver = false;
let appleCount = 3;

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
    HP = MaxHP;
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
    gameOver = false;
}

function setup() {
    createCanvas(cellSize * gridSize + 2 + selectWidth, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    let speedInput = createInput(speed);
    speedInput.position(width - selectWidth + 50, height/2);
    speedInput.size(selectWidth - 100, 20);
    speedInput.input(inputSpeed);
    let appleCountInput = createInput(appleCount);
    appleCountInput.position(width - selectWidth + 50, height/2+55);
    appleCountInput.size(selectWidth - 100,20);
    appleCountInput.input(inputAppleCount);
    let HPInput = createInput(MaxHP);
    HPInput.position(width - selectWidth + 50, height/2+110);
    HPInput.size(selectWidth - 100,20);
    HPInput.input(inputHP);
    startButton = createButton("");
    startButton.position(width - selectWidth + 50, height/2+165);
    startButton.size(selectWidth - 100,20);
    startButton.mousePressed(newGame);
    frameRate(speed);
}

function inputSpeed(){
    val = this.value();
    if (val === "" || val == null || isNaN(val)){
        return;
    }
    speed = int(val);
    frameRate(speed);
}

function inputHP(){
    val = this.value();
    if (val === "" || val == null || isNaN(val)){
        return;
    }
    MaxHP = int(val);
    if (HP > MaxHP) {
        HP = MaxHP
    }
}

function inputAppleCount(){
    val = this.value();
    if (val === "" || val == null || isNaN(val)){
        return;
    }
    appleCount = int(val);
    if (appleCount < apples.length){
        while (apples.length != appleCount){
            apples.pop();
        }
    }else if(appleCount > apples.length){
        while (apples.length != appleCount){
            apples.push(newApple());
        }
    }
}

function keyPressed() {
    // if (key === 'Enter') {
    //     setup();
    // }
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

function checkOnApple() {
    if (apples.includes(snake[0])){
        idx = apples.indexOf(snake[0]);
        apples[idx] = newApple();
        HP = MaxHP;
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
                HP -= 1;
            }
        }else if (direction === "u"){
            if (snake[0] < gridSize){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]-gridSize);
                HP -= 1;
            }
        }else if (direction === "d"){
            if (snake[0] >= gridSize * (gridSize-1)){
                gameOver = true; 
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]+gridSize);
                HP -= 1;
            }
        }else if (direction === "l"){
            if (snake[0] % gridSize === 0){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]-1);
                HP -= 1;
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
        'GAME OVER',
        5,
        height/2-10
    );
}

function draw() {
    if (gameOver){
        drawGameOver();
        startButton.html("Start Game");
    }else{
        if (HP == 0) {
            gameOver = true;
        }
        background(220);
        updateSnake();
        textSize(20)
        fill(255,255,255)
        strokeWeight(1.5);
        rect(width - selectWidth + 10, height/2-90, 150, 15)
        strokeWeight(1);
        if ((HP/MaxHP)*150 <= 150 && (HP/MaxHP)*150 > 100) {
            fill(0,200,0)
        } else if ((HP/MaxHP)*150 <= 100 && (HP/MaxHP)*150 > 50) {
            fill(200,200,0)
        } else {
            fill(200,0,0)
        }    
        rect(width - selectWidth + 10, height/2-90, (HP/MaxHP)*150, 15)
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
                } else if (apples.includes(idx)) {
                    drawApple(row,col);
                }
            }
        }
        startButton.html("Restart Game");
    }
    fill(0,0,0);
    textSize(10);
    text(`HP: ${HP}`,width - selectWidth + 10,height/2-110)
    text("Speed:",width - selectWidth + 10, height/2-35);
    text("Apples:",width - selectWidth + 10, height/2+20);
    text("MaxHP:",width - selectWidth + 10, height/2+75);
}