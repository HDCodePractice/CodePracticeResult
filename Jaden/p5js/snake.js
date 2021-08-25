const cellSize = 30;
const gridSize = 10;
const scoreHeight = 100;

let grid = [];
let snake = [];
let direction = "r";  // l, r, u, d
let score;
let apple = 0;

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

function drawApple(row, col) {
    fill(0, 102, 153);
    textSize(28)
    text("🍎",col*cellSize+10,scoreHeight+(row+1)*cellSize-10);
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
    print(snake);
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

}