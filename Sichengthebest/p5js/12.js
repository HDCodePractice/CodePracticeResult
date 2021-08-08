document.addEventListener('contextmenu', event => event.preventDefault());
const cellSize = 49;
const gridSize = 10;
const scoreHeight = 100;

let mousecol = 0;
let mouserow = 0;
let grid = [];
let flags = [];
let clickindex;
let currentlydrawing;
let click = 1;

let score;
let mine = 10;
let flag;
let linePosition = [];

function newGame() {
    flag = mine;
    grid = new Array(gridSize * gridSize - mine).fill('n');
    flags = new Array(gridSize * gridSize).fill('n');
    for (let index = 0; index < mine; index++) {
        grid.push("m")
    }
    grid = shuffle(grid);
    for (let col = 0; col < gridSize; col++) {
        for (let row = 0; row < gridSize; row++) {
            if (!checkMine(col,row)) {
                num = calNum(row, col);
                const idx = row * gridSize + col;
                grid[idx] = num;
            }
        }
    }
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

function checkMine(col,row){
    const idx = row * gridSize + col;
    if (grid[idx] === "m"){
        return true
    }
    return false
}

function calNum(row, col) {
    const srow = (row===0) ? row : row-1;
    const scol = (col===0) ? col : col-1;
    const erow = (row>=gridSize-1) ? row : row+1;
    const ecol = (col>=gridSize-1) ? col : col+1;
    var num = 0;
    for (let i = srow; i <= erow; i++) {
        for (let j = scol; j <= ecol; j++) {
            if (checkMine(j,i)) {
                num += 1;
            }
        }
    }
    return num;
}

function mousePressed() {
    linePosition.push(mouseX);
    linePosition.push(mouseY);

    mousecol = Math.ceil(mouseX/cellSize)-1;
    mouserow = Math.ceil((mouseY-scoreHeight)/cellSize)-1;

    clickindex = ((mouserow)*gridSize)+mousecol

    if (mouseButton === RIGHT) {
        if (flags[clickindex] === 'm') {
            flags[clickindex] = 'n';
            flag += 1;
        } else {
            if (flag > 0) {
                flags[clickindex] = 'm';
                flag -= 1;
            }
        }
    } else if (mouseButton === LEFT) {
        if (grid[clickindex] === 'm') {
            if (flags[clickindex] === 'n') { 
                drawGameOver();
                return
            }
        }
    }

    updateCanvas();
}

function updateCanvas() {
    background(235);
    drawScore();
    drawGrid();
    if (flags === grid) {
        drawCompleted()
    }
}

function drawCircle(row,col) {
    fill(0,250,0)
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize*4/5)
}

function drawNumber(row, col, num) {
    fill(0, 102, 153);
    text(num,col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
}

function drawFlag(row, col) {
    fill(0, 102, 153);
    text("🚩",col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
}

function drawGrid() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            currentlydrawing = ((row)*gridSize)+col
            
            const idx = row * gridSize + col;
            fill(235);

            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            stroke(0);
            strokeWeight(2);
            if (flags[idx] === 'm') {
                drawFlag(row, col);
            }else if ("1234567".includes(grid[idx])){
                drawNumber(row,col,grid[idx]);
            }
        }
    }
}

function drawGameOver() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            currentlydrawing = ((row)*gridSize)+col
            
            const idx = row * gridSize + col;
            fill(235);

            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            stroke(0);
            strokeWeight(2);
            if (flags[idx] === 'm') {
                drawFlag(row, col);
            } else if (grid[idx] === 'm') {
                drawCircle(row,col)
            }else if ("12345678".includes(grid[idx])){
                drawNumber(row,col,grid[idx]);
            }
        }
    }
    textSize(40)
    fill(255,0,0)
    text('GAME OVER',gridSize*cellSize/2,gridSize*cellSize/2+scoreHeight)
}

function drawGameOver() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            currentlydrawing = ((row)*gridSize)+col
            
            const idx = row * gridSize + col;
            fill(235);

            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            stroke(0);
            strokeWeight(2);
            if (flags[idx] === 'm') {
                drawFlag(row, col);
            } else if (grid[idx] === 'm') {
                drawCircle(row,col)
            }else if ("1234567".includes(grid[idx])){
                drawNumber(row,col,grid[idx]);
            }
        }
    }
    textSize(10)
    fill(0,255,0)
    text('Good job! Press [Enter] to restart game.',gridSize*cellSize/2,gridSize*cellSize/2+scoreHeight)
}

function drawScore() {
    drawText(`Score: ${score}\r\nPress [Enter] to restart game.\r\n🚩 left: ${flag}`,
    color(0, 220, 0, gameOver ? 128 : 255),
    24,
    width / 2,
    scoreHeight / 2);
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