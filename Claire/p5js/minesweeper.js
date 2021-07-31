const cellSize = 50;
const gridSize = 9;
const scoreHeight = 100;

let mousecol = 0;
let mouserow = 0;
let grid = [];
let tags = [];
let clickindex;
let currentlydrawing;
let click = 1;

let score;
let mine = 10;
let tag;
let linePosition = [];

function newGame() {
    tag = mine;
    grid = new Array(gridSize * gridSize - mine).fill('n');
    tags = new Array(gridSize * gridSize).fill('n');
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
    let num = 1;
    print(num);
    return num;
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

function drawNumber(row, col, num) {
    fill(0, 102, 153);
    text(num,col*cellSize+cellSize/2,scoreHeight+row*cellSize+cellSize/2);
}

function drawGrid() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            currentlydrawing = ((row)*gridSize)+col
            
            const idx = row * gridSize + col;
            fill(235);

            // if (currentlydrawing === lastclick && click === 1){
            //     strokeWeight(5);
            //     stroke(255,0,0)
            //     click = 2
            // }else{
            //     strokeWeight(2);
            //     stroke(64);
            //     click = 1
            // }

            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
            stroke(0);
            strokeWeight(2);
            if (grid[idx] === 'm'){
                drawCircle(row,col);
            }else if ("1234567".includes(grid[idx])){
                drawNumber(row,col,grid[idx]);
            }
        }
    }
}

function drawScore() {
    drawText(`Tag: ${tag}`,
    color(0, 220, 0, gameOver ? 128 : 255),
    32,
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