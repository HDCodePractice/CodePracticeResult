
const cellSize = 20;
const gridSize = 25;
const scoreHeight = 100;

let score = 0;
let snake = [];
let grid = [];
let direction = 0; // 0 = right, 1 = left, 2 = down, 3 = up
let apple = 0;

function setup() {
    createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
    background(220);
    newGame();
}

function newGame() {
    grid = new Array(gridSize * gridSize).fill('n');
    snake = [int(gridSize/2)*gridSize+3,int(gridSize/2)*gridSize+2,int(gridSize/2)*gridSize+1];
    apple = (int(gridSize/2) * gridSize + int(gridSize*3/4));
}

function drawScore() {
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
    drawScore();
    drawGrid();
}

function drawApple(row, col) {
    fill(0, 102, 153);
    textSize(20);
    text("🍎",col*cellSize,scoreHeight+(row+1)*cellSize-1);
}