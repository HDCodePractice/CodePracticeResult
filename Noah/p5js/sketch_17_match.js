const cellSize = 60;
const gridSize = 10;
const scoreHeight = 100;
let grid = [];
let gameOver;
let score;
let completed;
let linePosition = [];
let gridnum1;
let gridnum2;

function randomGrid(){
    opts = ['t','s','c','t','s','c','t','s','c','t','s','c','t','s','c','t','s','c','n']
    return opts[floor(random(opts.length))];
}

function newGame() {
    grid = new Array(gridSize * gridSize).fill('t');
    gridsnew = [];
    for (let index = 0; index < grid.length/2; index++) {
        shape = randomGrid();
        gridsnew.push(shape);
        gridsnew.push(shape);
    }
    grid = shuffle(gridsnew);
    gameOver = false;
    completed = false;
    score = 0;
}

function setup() {
    createCanvas(cellSize*gridSize+2, cellSize*gridSize+2+scoreHeight);
    newGame();
    noLoop();
    updateCanvas();
}

function mousePressed() {
    linePosition.push(mouseX);
    linePosition.push(mouseY);
    gridnum1 = int(int((linePosition[1]-scoreHeight)/cellSize)*gridSize)+int(linePosition[0]/cellSize)
    updateCanvas();
    if (linePosition.length == 4) {
        gridnum2 = int(int((linePosition[3]-scoreHeight)/cellSize)*gridSize)+int(linePosition[2]/cellSize)
        if (grid[gridnum1] == grid[gridnum2]) {
            if (gridnum1 != gridnum2) {
                print(gridnum1)
                print(gridnum2)
                // line(linePosition[0],linePosition[1],linePosition[2],linePosition[3]);
                grid[gridnum1] = 'n';
                grid[gridnum2] = 'n';
                updateCanvas();
            }
            gridnum1 = 99999999;
            gridnum2 = 99999999;
            updateCanvas()
            linePosition = [];
        }
    }
}

function updateCanvas() {
    background(245);
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
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize-(cellSize*2/5))
}

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize-(cellSize*2/5))
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
            const idx = row * gridSize + col;
            // if (gridnum1 != 99999999 || gridnum2 != 99999999) {
            //     if (idx == gridnum1) {
            //         fill(0);
            //     } else if (grid[gridnum1] == grid[gridnum2] && idx == gridnum2) {
            //         fill(0);
            //     } else {
            //         fill(235);
            //     }   
            // } else {
            //     fill(235);
            // }
            fill(235);
            stroke(64);
            strokeWeight(2);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
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
    drawText('Good job! You completed the Linking Game!\r\nPress [Enter] to continue.',
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