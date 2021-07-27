const cellSize = 50;
const gridSize = 8;
const scoreHeight = 100;

let mousecol = 0;
let mouserow = 0;
let grid = [];
let tags = [];
let clickindex;
let lastclick;
let currentlydrawing;
let click = 1;

let score;
let mine = 10;
let tag;
let linePosition = [];



function newGame() {
    tag = mine;
    grid = new Array(gridSize * gridSize - mine).fill('n');
    tags = new Array(gridSize * gridSize).fill('n')
    for (let index = 0; index < mine; index++){
        grid.push('m')
    }
    grid = shuffle(grid)
    gameOver = false;
    completed = false;
    score = 0;
}

function calNum(row,col) {
    let num = 0;
    for (let index1 = row-1; index1 <= row + 1; index1++) {
        for (let index2 = col-1; index2 <= col + 1; index2++) {
            if (index1 > 0 && index2 > 0 ) {
                if (index1 <= gridSize && index2 <= gridSize) {
                    print(`${col},${row}`,`${index2-1},${index1-1}`)
                    if (grid[index2-1*gridSize+index1-1] === 'm') {
                         num += 1;
                    }
                }
            }
        }
    }
    return num;
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

    mousecol = Math.ceil(mouseX/cellSize)-1;
    mouserow = Math.ceil((mouseY-scoreHeight)/cellSize)-1;

    clickindex = ((mouserow)*gridSize)+mousecol

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

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function drawGrid() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            currentlydrawing = ((row)*gridSize)+col
            
            const idx = row * gridSize + col;
            fill(235);

            if (currentlydrawing === lastclick && click === 1){
                strokeWeight(5);
                stroke(255,0,0)
                click = 2
            }else{
                strokeWeight(2);
                stroke(64);
                click = 1
            }
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            drawText(`${calNum(row,col)}`, color(0, 0, 0, gameOver ? 128 : 255), 20, col * cellSize + 30,row * cellSize + 130);
            stroke(0);
            strokeWeight(2);
            if (grid[idx] === 'm'){
                drawCircle(row,col);
            }
        }
    }
}

function drawScore() {
    drawText(`Score: ${score}\r\nPress [Enter] to restart game.\r\n🏴 left: ${tag}`,
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