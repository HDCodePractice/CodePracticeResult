document.addEventListener('contextmenu', event => event.preventDefault());

const cellSize = 50;
const gridSize = 7;
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
    rect(0 * cellSize + 1, 0 * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
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
    print(flags)
    print(grid)
    linePosition.push(mouseX);
    linePosition.push(mouseY);

    mousecol = Math.ceil(mouseX/cellSize)-1;
    mouserow = Math.ceil((mouseY-scoreHeight)/cellSize)-1;

    clickindex = ((mouserow)*gridSize)+mousecol

    if (mouseButton === RIGHT) {
        if (flags[clickindex] == 'n' || flags[clickindex] == "t") {
            if (flags[clickindex] != 't') {
                flags[clickindex] = 't';
            } else {
                flags[clickindex] = 'n';
            }  
        }        
    } else if (mouseButton === LEFT) {
        if (grid[clickindex] == 'm') {
            for (let row = 0; row < gridSize; row++) {
                for (let col = 0; col < gridSize; col++) {
                    if (grid[row * gridSize + col] == "m") {
                        if (flags[row * gridSize + col] != "t") {
                            flags[row * gridSize + col] = "m"
                        } 
                    }
                    if (flags[row * gridSize + col] == "t" && grid[row * gridSize + col] != "m") {
                        flags[row * gridSize + col] == "x"
                    }
                }
            }
        } else if (grid[clickindex] != 0) {
            flags[clickindex] = grid[clickindex]
            score += 1
        } else {
            flags[clickindex] = "z"
            score += 1
        }
    }
    let fcount = 0
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            if (flags[row * gridSize + col] == "t") {
                fcount += 1
            }
        }
    }
    flag = 10-fcount
    updateCanvas()
    
}

function updateCanvas() {
    background(235);
    drawScore();
    drawGrid();
}

function drawTriangle(row, col) {
    stroke(0)
    fill(250,0,0)
    triangle(col*cellSize+1+cellSize/1.2,row*cellSize+1+scoreHeight+(cellSize-cellSize/5),
        col*cellSize+1+cellSize/2,row*cellSize+1+scoreHeight+(cellSize-cellSize/1.25),
        col*cellSize+1+(cellSize-cellSize/1.2),row*cellSize+1+scoreHeight+(cellSize-cellSize/5))
}

function drawNumber(row, col, num) {
    fill(0, 100, 0);
    stroke(0,100,0)
    strokeWeight(3)
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
            if (flags[idx] == 'n' || flags[idx] == 't' || flags[idx] == 'm') {
                fill(0,250,0);
            } else {
                fill(255,248,220)
            }
            stroke(100,250,100);
            strokeWeight(2);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
            
            
            if (flags[idx] === 't') {
                drawFlag(row, col);
            } else if (flags[idx] === 'm'){
                drawTriangle(row,col);
            } else if ("1234567".includes(flags[idx])){
                drawNumber(row,col,flags[idx]);
            } else if (flags[idx] === 'x'){
                drawNumber(row,col,"❌");
            }
        }
    }
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