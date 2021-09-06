const cellSize = 25;
const gridSize = 20;
const scoreHeight = 100;

let score;
let snake = [];
let grid = [];
let direction = 0; // 0 = right, 1 = left, 2 = down, 3 = up
let apple = 0;
let gameOver = false;
let completed = false;
let appleCount = 3

function setup() {
    frameRate(7)
    createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
    background(220);
    newGame();
}

function newGame() {
    grid = new Array(gridSize * gridSize).fill('n');
    snake = [int(gridSize/2)*gridSize+3,int(gridSize/2)*gridSize+2,int(gridSize/2)*gridSize+1];
    apple = (int(gridSize/2) * gridSize + int(gridSize*3/4));
    score = 0;
    gameOver = false;
    completed = false;
    direction = 0;
}

function drawScore() {
    background(220)
    fill(0, 220, 0);
    textSize(24);
    text(`Score: ${score}`,gridSize*cellSize / 2-50,scoreHeight / 2);
}

function drawGrid() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            currentlydrawing = ((row)*gridSize)+col;
            
            const idx = row * gridSize + col;
            stroke(0);
            strokeWeight(2);
            fill(235);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
            if (snake.includes(idx)) {
                if (idx === snake[0]) {
                    fill(0,0,255);
                    circle(col * cellSize + 1+cellSize/2, row * cellSize + 1+cellSize/2 + scoreHeight, cellSize);
                } else {
                    fill(0);
                    rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
                }
            }
            if (idx === apple) {
                drawApple(row,col);
            }
        }
    }
}

function resetApple() {
    notsnake = []
    for (let index = 0; index < gridSize*gridSize; index++) {
        if (!snake.includes(index)) {
            notsnake.push(index)
        }
    }
    apple = int(random(notsnake));
}

function checkOnApple() {
    if (snake[0] === apple){
        resetApple();
        score += 1;
    } else {
        snake.splice(snake.length-1, 1)
    }
}

function updateSnake() {
    if (direction === 0) {
        if (snake[0]%gridSize === gridSize-1) {
            gameOver = true;
        } else {
            checkOnApple()
            snake.splice(0,0,snake[0]+1)
        }
    } else if (direction === 1) {
        if (snake[0]%gridSize === 0) {
            gameOver = true;
        } else {
            checkOnApple()
            snake.splice(0,0,snake[0]-1)
        }
    } else if (direction === 2) {
        if (snake[0] >= gridSize * (gridSize-1)) {
            gameOver = true;
        } else {
            checkOnApple()
            snake.splice(0,0,snake[0]+gridSize)

        }
    } else if (direction === 3) {
        if (snake[0] < gridSize) {
            gameOver = true;
        } else {
            checkOnApple()
            snake.splice(0,0,snake[0]-gridSize)
        }
    }
    for (let s = 1; s < snake.length; s++) {
        if (snake[0] == snake[s]) {
            gameOver = true;
        }
    }
}

function draw() {
    if (gameOver === false) {
        drawScore();
        drawGrid();
        updateSnake()
    } else {
        drawGameOver()
    }
}

function drawApple(row, col) {
    fill(0, 102, 153);
    textSize(20);
    text("🍎",col*cellSize,scoreHeight+(row+1)*cellSize-1);
}

function drawGameOver() {
    fill(255,0,0)
    textSize(int(width/15));
    text('GAME OVER\r\nClick [Enter] to restart',width/5,height/2)
}

function keyPressed() {
    if (key === 'Enter') {
        setup();
    }
    if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
        direction = 1;
    } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
        direction = 0;
    } else if (keyCode === UP_ARROW && snake[1] != snake[0] - gridSize) {
        direction = 3;
    } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
        direction = 2;
    }
}