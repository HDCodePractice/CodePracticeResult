const cellSize = 30;
const gridSize = 10;
const scoreHeight = 100;

let grid = [];
let snake = [];
let direction = "r";  // l, r, u, d
let score;
let apple = 0;
let snakeCol = []
let speed = 7
let gameOver = false
let edges = [2
    ,11
    ,21
    ,31
    ,41
    ,51
    ,61
    ,71
    ,81
    ,91
    ,92
    ,93
    ,94
    ,95
    ,96
    ,97
    ,98
    ,99
    ,100
    ,90
    ,80
    ,70
    ,60
    ,50
    ,40
    ,30
    ,20
    ,10
    ,9
    ,8
    ,7
    ,6
    ,5
    ,4
    ,3
    ,2]

function colRowToIndex(col, row) {
  return row * gridSize + col;
}

function indexToColRow(index) {
  return [ int(index / gridSize) , index % gridSize];
}

function drawCircle(row,col) {
    fill(0,250,0)
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize*4/5)
}

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function keyPressed() {
    if(key === "ArrowLeft" && direction !== "r"){
        direction = "l"
    }else if(key === "ArrowUp" && direction !== "d"){
        direction = "u"
    }else if(key === "ArrowDown" && direction !== "u"){
        direction = "d"
    }else if(key === "ArrowRight" && direction !== "l"){
        direction = "r"
    }
}

function drawApple(row, col) {
    fill(0, 102, 153);
    textSize(28)
    text("🍎",col*cellSize+2,scoreHeight+(row+1)*cellSize-4);
}

function newGame(){
    snake = [
        colRowToIndex(3,int(gridSize/2)),
        colRowToIndex(2,int(gridSize/2)),
        colRowToIndex(1,int(gridSize/2))
    ];
    direction = "r";
    apple = colRowToIndex(int(gridSize* 3/4), int(gridSize/2));
}

function setup() {
    createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    frameRate(speed)
}

function updateSnake(){
    if (!gameOver){
        if (direction === "r"){
            snake.splice(snake.length-1, 1)
            snake.splice(0,0,snake[0]+1)
        }else if (direction === "u"){
            snake.splice(snake.length-1, 1)
            snake.splice(0,0,snake[0]-gridSize)
        }else if (direction === "d"){
            snake.splice(snake.length-1, 1)
            snake.splice(0,0,snake[0]+gridSize)
        }else if (direction === "l"){
            snake.splice(snake.length-1, 1)
            snake.splice(0,0,snake[0]-1)
        }
        if (snake.some(item => edges.includes(item))){
            print("die")
            gameOver = true
        }
    }
}

function mousePressed() {
    mousecol = Math.ceil(mouseX/cellSize)-1;
    mouserow = Math.ceil((mouseY-scoreHeight)/cellSize)-1;

    clickindex = ((mouserow)*gridSize)+mousecol
    print(clickindex)
}

function draw() {
    background(220);
    for (let col = 0; col < gridSize; col++) {
        for (let row = 0; row < gridSize; row++) {
            const idx = colRowToIndex(col, row);
            fill(255,248,220);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 1);
            if (snake.includes(idx)){
                if (idx == snake[0]){
                    drawCircle(row,col);
                } else {
                    drawSquare(row,col);
                }
            } else if (idx == apple) {
                drawApple(row,col);
            }
        }
    }
    updateSnake();
}
