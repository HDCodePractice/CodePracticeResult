const cellSize = 40;
const gridSize = 12;
const scoreHeight = 100;
// let grid=['s','t','c','s','c','c','c','c','c','c','c','c','c','c','c','c'];
let gameOver;
let score;
let completed;

function randomGrid(){
    opts = ['t','s','c']
    return opts[floor(random(opts.length))];
}

function newGame() {
    grid = new Array(gridSize * gridSize).fill('t');
    gridsleft = [];
    for (let index = 0; index < grid.length/2; index++) {
        shape = randomGrid();
        gridsleft.push(shape);
        gridsleft.push(shape);
    }
    grid = shuffle(gridsleft);
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
    for (let i = 0; i < gridSize; i++) {
        if (mouseX > cellSize*i && mouseX < cellSize*(i+1) && mouseY > (scoreHeight+cellSize*i) && mouseY < scoreHeight+cellSize*(i+1) ){
            grid[i] = 'n';
            drawGrid();
        }
    }
        

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
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize-cellSize/2.5)
}

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize-cellSize/2.5)
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
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
            if (grid[idx] === 's'){
                drawSquare(row,col);
            } else if (grid[idx] === 'c'){
                drawCircle(row,col);
            } else if (grid[idx]  === 't'){
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