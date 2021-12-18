const cellSize = 60;
const gridSize = 8;
const scoreHeight = 100;
let grid = [];
let gameOver;
let score;
let completed;
let linePosition = [];
let chosenGrid = -1

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

function matchgrids(gridnum1,gridnum2) {
    let match = false;
    let turns = 0;

    let row1 = (gridnum1 - (gridnum1 % gridSize)) / gridSize;
    if (row1 == 0) {
        col1 = gridnum1;
    } else {
        col1 = gridnum1 % (row1*gridSize);
    }

    let row2 = (gridnum2 - (gridnum2 % gridSize)) / gridSize;
    if (row2 == 0) {
        col2 = gridnum2;
    } else {
        col2 = gridnum2 % (row2*gridSize);
    }

    if (row1 == row2) {
        if (row1 == 0 || row1 == gridSize-1) {
            match = true
        } else if ((grid[gridnum1 - Math.abs(gridnum1 - gridnum2 - 1)] == 'n' || grid[gridnum1 + Math.abs(gridnum1 - gridnum2 - 1)] == 'n') || Math.abs(col1 - col2) == 1) {
            match = true
        } 
    } else if (col1 == col2) {
        print(grid[gridSize * (row1 + Math.abs(row1 - row2))-1])
        if (col1 == 0 || col1 == gridSize-1) {
            match = true
        } else if ((grid[gridSize * (row1 - Math.abs(row1 - row2 - 1))-1] == 'n' || grid[gridSize * (row1 + Math.abs(row1 - row2 - 1))-1] == 'n') || Math.abs(row1 - row2) == 1) {
            match = true
        }
    }
    return match
}

function mousePressed() {
    linePosition.push(mouseX);
    linePosition.push(mouseY);
    chosenGrid = int(int((linePosition[1]-scoreHeight)/cellSize)*gridSize)+int(linePosition[0]/cellSize)
    row = chosenGrid
    updateCanvas()
    if (linePosition.length == 4) {
        gridnum1 = int(int((linePosition[1]-scoreHeight)/cellSize)*gridSize)+int(linePosition[0]/cellSize)
        gridnum2 = int(int((linePosition[3]-scoreHeight)/cellSize)*gridSize)+int(linePosition[2]/cellSize)
        if (matchgrids(gridnum1,gridnum2) == true) {
            if (grid[gridnum1] === grid[gridnum2]) {
                if (gridnum1 !== gridnum2) {
                    if (grid[gridnum1] != 'n' && grid[gridnum2] != 'n') {
                        grid[gridnum1] = 'n'
                        grid[gridnum2] = 'n'
                        score += 1
                        chosenGrid = -1
                    }
                }
            }
        } 
        chosenGrid = -1
        linePosition = [];
    }
    updateCanvas()
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
            const idx = row * gridSize + col;
            if (chosenGrid === idx) {
                fill(0);
            } else {
                fill(235);
            }
            strokeWeight(2); 
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
            stroke(64);
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
    drawText(`Score: ${score}\r\nPress [Enter] to restart game.`,
    color(0, gameOver ? 128 : 255),
    32,
    width / 2,
    scoreHeight / 2);
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


function keyTyped() {
    if (key === 'Enter') {
        newGame();
        setup();
    }
}