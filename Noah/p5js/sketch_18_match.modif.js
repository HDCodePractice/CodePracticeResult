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
    opts = ['t','s','c']
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

function checkNull(col,row){
    const idx = row * gridSize + col;
    if (grid[idx] === "n"){
        return true
    }
    return false
}

function checkCol(col,srow,erow){
    for (let index = srow + 1; index < erow; index++) {
        if (checkNull(col,index)===false){
            return false
        }
    }
    return true    
}

function checkRow(row,scol,ecol){
    for (let index = scol + 1; index < ecol; index++) {
        if (checkNull(index,row)===false){
            return false
        }
    }
    return true    
}

function checkOneTurn(acol,arow,bcol,brow) {
    if (checkRow(arow,acol,bcol) ){
        if (checkCol(bcol,arow,brow) ){
            if (checkNull(bcol,arow)){
                return true
            }
        }
    }
    if (checkCol(acol,arow,brow) ){
        if (checkRow(brow,acol,bcol) ){
            if (checkNull(acol,brow)){
                return true
            }
        }
    }
    return false;
}

function checkTwoTurns(acol,arow,bcol,brow) {
    for (let i = 0; i < gridSize; i++) {
        if (checkCol(acol,arow,i)) {
            if (checkRow(i,acol,bcol)) {
                if (checkCol(bcol,i,brow)) {
                    if (checkNull(acol,i)){
                        if (checkNull(i,bcol)) {
                            return true
                        }   
                    }
                }
            }
        }
    }
    for (let i = 0; i < gridSize; i++) {
        if (checkRow(arow,acol,i)) {
            if (checkCol(i,arow,brow)) {
                if (checkRow(brow,i,bcol)) {
                    if (checkNull(i,brow)){
                        if (checkNull(arow,i)) {
                            return true
                        }   
                    }
                }
            }
        }
    }
}

function checkPass(clickindex,lastindex){
    // [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    // 0,1,2,3
    // 4,5,6,7
    // 8,9,10,11
    // 12,13,14,15
    clickrow = int(clickindex / gridSize);
    clickcol = clickindex - clickrow * gridSize;
    lastrow = int(lastindex / gridSize);
    lastcol = lastindex - lastrow * gridSize;

    if (clickcol === lastcol) {
        // 同一列
        // 在边儿上
        if (clickcol === 0  || clickcol === gridSize - 1) {
            return true;
        }
        // 两行之间是空的
        if (clickrow < lastrow){
            return checkCol(clickcol,clickrow,lastrow);
        } else {
            if (checkCol(clickcol,lastrow,clickrow) == true) {
                return true
            } else {
                return checkTwoTurns(clickcol,clickrow,lastcol,lastrow)
            }  
        }
    } else if(clickrow === lastrow) {
        // 同一行
        // 在边儿上
        if (clickrow === 0  || clickrow === gridSize - 1) {
            return true;
        }
        // 两列之间是空的
        if (clickcol < lastcol){
            return checkRow(clickrow,clickcol,lastcol);
        }else{
            if (checkRow(clickrow,lastcol,clickcol) == true) {
                return true
            } else {
                return checkTwoTurns(clickcol,clickrow,lastcol,lastrow)
            }
        }
    } else {
        if (checkOneTurn(clickrow,clickcol,lastrow,lastcol)) {
            return true
        } else {
            return checkTwoTurns(clickcol,clickrow,lastcol,lastrow)
        }
    }
    return false;
}


function mousePressed() {
    linePosition.push(mouseX);
    linePosition.push(mouseY);

    mousecol = Math.ceil(mouseX/cellSize)-1;
    mouserow = Math.ceil((mouseY-scoreHeight)/cellSize)-1;

    clickindex = ((mouserow)*gridSize)+mousecol

    if (grid[lastclick] === grid[clickindex] && lastclick !== clickindex && checkPass(clickindex,lastclick)){
        grid[lastclick] = "n"
        grid[clickindex] = "n"
    }

    lastclick = clickindex


    if (linePosition.length == 4) {
        line(linePosition[0],linePosition[1],linePosition[2],linePosition[3]);
        linePosition = [];
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
            stroke(0);
            strokeWeight(2);
            if (grid[idx] === 's'){
                drawSquare(row,col);
            }else if (grid[idx] === 'c'){
                drawCircle(row,col);
            }else if (grid[idx]  === 't'){
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

function drawText(msg, inkColor, size, x, y) {
    textAlign(CENTER, CENTER);
    textSize(size);
    fill(inkColor);
    noStroke();
    text(msg, x, y);
}