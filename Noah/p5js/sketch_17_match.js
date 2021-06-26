const cellSize = 40;
const gridSize = 12;
const scoreHeight = 100;
let grid;
let gameOver;
let score;
let completed;
let mousePosition;
let gridShapes;

function newGame() {
    grid = new Array(gridSize * gridSize).fill(0);
    gameOver = false;
    completed = false;
    score = 0;
    mousePosition = []
    gridShapes = [[],[],[],[],[],[],[],[],[],[],[],[]];
}

function setup() {
    createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    noLoop();
    updateCanvas();
}

function mousePressed() {
    mousePosition.push(mouseX);
    mousePosition.push(mouseY);
    if (mousePosition.length == 4) {
        line(mousePosition[0],mousePosition[1],mousePosition[2],mousePosition[3]);
        mousePosition = [];
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
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize-15)
}

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize-15)
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
            fill(235)
            strokeWeight(2);
            stroke(64);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
            let choices = ["C","S","T"];
            var choice = random(choices);
            if (choice == "C") {
                drawCircle(row,col);
                gridShapes[row].push("Circle");
            } else if (choice == "S") {
                drawSquare(row,col);
                gridShapes[row].push("Square");
            } else {
                drawTriangle(row,col)
                gridShapes[row].push("Triangle");
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