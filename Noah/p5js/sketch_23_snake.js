const cellSize = 30;
const gridSize = 17;
const scoreHeight = 100;

let mousecol = 0;
let mouserow = 0;
let grid = [];
let snake = [];
let direction = ""

let score;
let gameOver = false;

function newGame() {
    grid = new Array(gridSize * gridSize).fill('n');
    snake = new Array(gridSize * gridSize).fill('n');
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            const idx = row*gridSize+col;
            if (row == (gridSize-3)/2+1) {
                if (col == int(gridSize*2/3)) {
                    grid[idx] = 'a';
                }
                snake[row*gridSize+1] = 's'
                snake[row*gridSize+2] = 's'
                snake[row*gridSize+3] = 's'
                snake[row*gridSize+4] = 'h'
            }
        }
    }
    gameOver = false;
    score = 0;
}

function setup() {
    createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    updateCanvas();
    frameRate(5)
}

function checkApple(col,row){
    const idx = row * gridSize + col;
    if (grid[idx] == "a"){
        return true
    }
    return false
}

// function checkBlank(col,row){
//     const idx = row * gridSize + col;
//     if ("012345678".includes(grid[idx])) {
//         flags[idx] = grid[idx];
//         return true;
//     }
//     return false;
// }

// function calNum(row, col) {
//     const srow = (row===0) ? row : row-1;
//     const scol = (col===0) ? col : col-1;
//     const erow = (row>=gridSize-1) ? row : row+1;
//     const ecol = (col>=gridSize-1) ? col : col+1;
//     var num = 0;
//     for (let i = srow; i <= erow; i++) {
//         for (let j = scol; j <= ecol; j++) {
//             if (checkMine(j,i)) {
//                 num += 1;
//             }
//         }
//     }
//     return num;
// }

// function mousePressed() {
//     linePosition.push(mouseX);
//     linePosition.push(mouseY);

//     mousecol = Math.ceil(mouseX/cellSize)-1;
//     mouserow = Math.ceil((mouseY-scoreHeight)/cellSize)-1;

//     clickindex = ((mouserow)*gridSize)+mousecol
//     if (! gameOver){
//         if (mouseButton === RIGHT) {
//             if (flags[clickindex] == 'n' || flags[clickindex] == "t") {
//                 if (flags[clickindex] != 't') {
//                     if (flag > 0) {
//                         flags[clickindex] = 't';
//                         flag -= 1;
//                     }
//                 } else {
//                     flags[clickindex] = 'n';
//                     flag += 1;
//                 }  
//             }        
//         }else{
//             if ( ! checkBlank(mousecol,mouserow)){
//                 gameOver = true;
//             }
//         }
//     }

//     updateCanvas();
// }

function updateCanvas() {
    background(235);
    // drawScore();
    drawGrid();
}

function kisp(direction) {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            const idx = row * gridSize + col;
            if (grid[idx] == "h") {
                if (direction == "r") {
                    grid[idx+1] = "h"
                    grid[idx] = "n"
                } else if (direction == "l") {
                    grid[idx-1] = "h"
                    grid[idx] = "n"
                } else if (direction == "d") {
                    grid[idx+gridSize] = "h"
                    grid[idx] = "n"
                } else if (direction == "u") {
                    grid[idx-gridSize] = "h"
                    grid[idx] = "n"
                }
            }
        } 
    }
    print(grid)
    updateCanvas()
}


function keyTyped() {
    if (keyCode == RIGHT_ARROW) {
        if (direction != "left") {
            direction = "right"
            kisp("r")
        }
    } else if (keyCode == LEFT_ARROW) {
        if (direction != "right") {
            direction = "left"
            kisp("l")
        }
    } else if (keyCode == UP_ARROW) {
        if (direction != "down") {
            direction = "up"
            kisp("u")
        }
    } else if (keyCode == DOWN_ARROW) {
        if (direction != "up") {
            direction = "down"
            kisp("d")
        }
    }
}

// function drawCircle(row,col) {
//     fill(0,250,0)
//     circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize*4/5)
// }

// function drawNumber(row, col, num) {
//     fill(0, 102, 153);
//     text(num,col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
// }

// function drawNumber1(row, col, num) {
//     fill(255, 255, 255);
//     text(num,col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
// }

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1,row*cellSize+scoreHeight+1, cellSize)
}

function drawHead(row, col) {
    fill(150,0,250)
    square(col*cellSize+1,row*cellSize+scoreHeight+1, cellSize)
}

function drawApple(row, col) {
    fill(250,0,0)
    square(col*cellSize+1,row*cellSize+scoreHeight+1, cellSize)
}

function drawGrid() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            const idx = row * gridSize + col;
            stroke(0);
            strokeWeight(2);
            fill(235);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
            if (grid[idx] == 'a') {
                drawApple(row,col)
            } 
            if (snake[idx] == 's') {
                drawSquare(row,col)
            } else if (snake[idx] == 'h') {
                drawHead(row,col)
            }
            // if (flags[idx] === 't') {
            //     drawFlag(row, col);
            // }else if (flags[idx] === 0) {
            //     fill(255,248,220);
            //     rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            // }else if ("12345678".includes(flags[idx])) {
            //     fill(255,248,220);
            //     rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            //     drawNumber(row,col,grid[idx]);
            // }else if (grid[idx] === 'm'){
            //     if(gameOver){
            //         drawCircle(row,col);
            //     }
            // }else if ("12345678".includes(grid[idx])){
            //     if(gameOver){
            //         drawNumber1(row,col,grid[idx]);
            //     }
            // }
        }
    }
}

// function drawScore() {
//     drawText(`Score: ${score}\r\nPress [Enter] to restart game.\r\n🚩 left: ${flag}`,
//     color(0, 220, 0, gameOver ? 128 : 255),
//     24,
//     width / 2,
//     scoreHeight / 2);
// }

// function drawText(msg, inkColor, size, x, y) {
//     textAlign(CENTER, CENTER);
//     textSize(size);
//     fill(inkColor);
//     noStroke();
//     text(msg, x, y);
// }

// function keyTyped() {
//     if (key === 'Enter') {
//         newGame();
//         setup();
//     }
// }