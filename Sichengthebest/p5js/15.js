
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

function setup() {
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

function draw() {
    if (gameOver === false) {
        drawScore();
        drawGrid();
        for (let index = 0; index < snake.length; index++) {
            snake[index] += 1; 
            if (snake[index]%gridSize >= gridSize) {
                gameOver = true;
            }
        }
        if (snake.includes(apple)) {
            score += 1/snake.length;
        }
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
    textSize(int(cellSize*gridSize/10));
    text('GAME OVER\nClick [Enter] to restart',width/2,height/2)
}

function keyPressed() {
    if (key === 'Enter') {
        newGame();
        setup();
    }
    if (keycode === LEFT_ARROW) {
        direction = 1
    } else if (keycode === RIGHT_ARROW) {
        direction = 0
    } else if (keycode === UP_ARROW) {
        direction = 3
    } else if (keycode === DOWN_ARROW) {
        direction = 2
    }
}