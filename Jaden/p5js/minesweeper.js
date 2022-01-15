const cellSize = 50;
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
let mine = 20;
let flag;
let linePosition = [];
let gameOver = false;

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
    document.addEventListener('contextmenu', event => event.preventDefault());
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

function checkBlank(col,row){
    const idx = row * gridSize + col;
    if ("012345678".includes(grid[idx])) {
        flags[idx] = grid[idx];
        return true;
    }
    return false;
}

function clickBlank(row, col) {
    const srow = (row===0) ? row : row-1;
    const scol = (col===0) ? col : col-1;
    const erow = (row>=gridSize-1) ? row : row+1;
    const ecol = (col>=gridSize-1) ? col : col+1;
    const idx = row * gridSize + col;
    // 野蛮方案
    var num = 0;
    if (flags[idx] === 0){
        for (let i = srow; i <= erow; i++) {
            for (let j = scol; j <= ecol; j++) {
                const index = i * gridSize + j;
                if (flags[index] !== 0 && grid[index] === 0) {
                    num +=1; // 点击后，新出的空格的数量加1
                }
                flags[index] = grid[index];
            }
        }
    }
    return num; // 返回空格的数量

    // 优化(sicheng)方案
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
    if (! gameOver){
        if (mouseButton === RIGHT) {
            if (flags[clickindex] == 'n' || flags[clickindex] == "t") {
                if (flags[clickindex] != 't') {
                    if (flag > 0) {
                        flags[clickindex] = 't';
                        flag -= 1;
                    }
                } else {
                    flags[clickindex] = 'n';
                    flag += 1;
                }  
            }        
        }else{
            if ( ! checkBlank(mousecol,mouserow)){
                gameOver = true;
            }
            // 野蛮方案
            let bnum = clickBlank(mouserow,mousecol);
            while (bnum > 0) {
                bnum = 0;
                for (let col = 0; col < gridSize; col++) {
                    for (let row = 0; row < gridSize; row++) {
                        const index = row * gridSize + col;
                        if (flags[index] === 0){
                            bnum += clickBlank(row,col);
                        }
                    }
                }
                print(bnum);
            }

            // 优化(sicheng)方案
        }
    }

    updateCanvas();
}

function updateCanvas() {
    background(235);
    drawScore();
    drawGrid();
}

function drawCircle(row,col) {
    fill(0,250,0)
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize*4/5)
}

function drawNumber(row, col, num) {
    fill(0, 102, 153);
    text(num,col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
}

function drawNumber1(row, col, num) {
    fill(255, 255, 255);
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
            stroke(0);
            strokeWeight(2);
            fill(235);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);

            if (flags[idx] === 't') {
                drawFlag(row, col);
            }else if (flags[idx] === 0) {
                fill(255,248,220);
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            }else if ("12345678".includes(flags[idx])) {
                fill(255,248,220);
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
                drawNumber(row,col,grid[idx]);
            }else if (grid[idx] === 'm'){
                if(gameOver){
                    drawCircle(row,col);
                }
            }else if ("12345678".includes(grid[idx])){
                if(gameOver){
                    drawNumber1(row,col,grid[idx]);
                }
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