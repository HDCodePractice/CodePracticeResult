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

let mine = 10;
let flag;
let linePosition = [];
let gameOver = false;
let completed = false;

function newGame() {
    flag = mine;
    grid = new Array(gridSize * gridSize - mine).fill('n');
    flags = new Array(gridSize * gridSize).fill('n');
    for (let index = 0; index < mine; index++) {
        grid.push("m");
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
        return true;
    }
    return false;
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

    // Savage way
    // num = 0;
    // if (flags[idx] === 0){
    //    for (let i = srow; i <= erow; i++) {
    //        for (let j = scol; j <= ecol; j++) {
    //            const index = i * gridSize + j;
    //            if (flags[index] !== 0 && grid[index] === 0) {
    //                num += 1;
    //            }
    //            flags[index] = grid[index];
    //        }
    //    }
    // }
    // return num;

    // Sicheng (better) way
    blanks = [];
    if (flags[idx] === 0){
        for (let i = srow; i <= erow; i++) {
            for (let j = scol; j <= ecol; j++) {
                const index = i * gridSize + j;
                if (flags[index] !== 0 && grid[index] === 0 && flags[index] !== 'm') {
                    blanks.push(index);
                }
                if (flags[index] !== 'm') {
                    flags[index] = grid[index];
                }
            }
        }
    }
    return blanks;
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

    clickindex = ((mouserow)*gridSize)+mousecol;
    if (! gameOver){
        if (mouseButton === RIGHT) {
            if (flags[clickindex] == 'n' || flags[clickindex] == 'm') {
                if (flags[clickindex] != 'm') {
                    if (flag > 0) {
                        flags[clickindex] = 'm';
                        flag -= 1;
                        if (flags === grid) {
                            completed = true;
                        }
                    }
                } else {
                    flags[clickindex] = 'n';
                    flag += 1;
                }
            }        
        }else{
            if ( ! checkBlank(mousecol,mouserow)){
                gameOver = true;
            } else {
                // Savage way
                // num2 = clickBlank(mouserow,mousecol);
                // while (num2 > 0) {
                //     num2 = 0
                //     for (let i = 0; i < gridSize; i++) {
                //         for (let j = 0; j < gridSize; j++) {
                //             const index = i * gridSize + j;
                //             if (flags[index] === 0) {
                //                 num2 += clickBlank(i,j);
                //             }
                //         }
                //     }
                // }

                // Sicheng (better) way
                blanks2 = clickBlank(mouserow,mousecol);
                let tempblanks = [];
                while (blanks2.length > 0) {
                    for (let index = 0; index < blanks2.length; index++) {
                        row = int(blanks2[index]/gridSize);
                        col = blanks2[index]%gridSize;
                        tempblanks.push.apply(tempblanks,clickBlank(row,col));
                    }
                    blanks2 = tempblanks;
                    tempblanks = [];
                }
            }
        }
    }

    updateCanvas();
}

function updateCanvas() {
    background(235);
    drawScore();
    drawGrid();
    if (gameOver === true) {
        fill(255,0,0)
        textSize(cellSize*gridSize/10);
        text('GAME OVER\nClick [Enter] to restart',width/2,height/2)
    }
    if (completed === true) {
        fill(0,255,0)
        textSize(cellSize*gridSize/10);
        text('You won!\nClick [Enter] to restart',width/2,height/2)
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

            if (flags[idx] === 'm') {
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
    drawText(`Press [Enter] to restart game.\r\n🚩 left: ${flag}`,
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