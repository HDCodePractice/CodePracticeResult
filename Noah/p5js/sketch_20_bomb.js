const cellSize = 50;
const gridSize = 8;
const scoreHeight = 100;

let mousecol = 0;
let mouserow = 0;
let grid = [];
let clickindex
let lastclick
let currentlydrawing
let click = 1

let score;
let linePosition = [];

function randomGrid(){
    opts = ['y','n','n','n','n','n','n']
    return opts[floor(random(opts.length))];
}

function newGame() {
    grid = new Array(gridSize * gridSize).fill('t');
    gridsleft = [];
    for (let index = 0; index < grid.length/2; index++) {
        shape = randomGrid();
        gridsleft.push(shape);
        gridsleft.push(shape);
    }
    grid = shuffle(gridsleft);
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

function updateCanvas() {
    background(235);
    drawScore();
    drawGrid();
}


function drawCircle(row,col) {
    fill(0,250,0)
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, (cellSize-cellSize*2/5))
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

function drawText(msg, inkColor, size, x, y) {
    textAlign(CENTER, CENTER);
    textSize(size);
    fill(inkColor);
    noStroke();
    text(msg, x, y);
}

function detectBombs(idx) {
    let total = 0;
    try {
        let first = idx - gridSize - 1;
        if (grid[first] == "y") {
            total += 1;
        } 
    } catch {

    }
    try {
        let second = idx - gridSize;
        if (grid[second] == "y") {
            total += 1;
        } 
    } catch {

    }
    try {
        let third = idx - gridSize + 1;
        if (grid[third] == "y") {
            total += 1;
        } 
    } catch {

    }
    try {
        let fourth = idx - 1;
        if (grid[fourth] == "y") {
            total += 1;
        } 
    } catch {

    }
    try {
        let fifth = idx + 1;
        if (grid[fifth] == "y") {
            total += 1;
        } 
    } catch {

    }
    try {
        let sixth = idx + gridSize - 1;
        if (grid[sixth] == "y") {
            total += 1;
        } 
    } catch {

    }
    try {
        let seventh = idx + gridSize;
        if (grid[seventh] == "y") {
            total += 1;
        } 
    } catch {

    }
    try {
        let eigth = idx + gridSize + 1;
        if (grid[eigth] == "y") {
            total += 1;
        } 
    } catch {

    }
    return total
}

function drawGrid() {
    print(grid)
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
            stroke(0);
            strokeWeight(2);
            
            if (grid[idx] === 'y'){
                drawTriangle(row,col);
            } else if (grid[idx] === 'n') {
                print(detectBombs(idx))
                text(detectBombs(idx), col*cellSize+25,row*cellSize+scoreHeight+25 )
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

