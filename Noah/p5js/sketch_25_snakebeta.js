const cellSize = 30;
const gridSize = 15;
const scoreHeight = 75;
let appleCount = 5;
let previous = appleCount;

let speed = 5;
let difficulty =  "medium"
let grid = [];
let snake = [];
let direction = "";  // l, r, u, d
let score = 0;
let apple = [];
let gameOver = false;

function colRowToIndex(col, row) {
  return row * gridSize + col;
}

function indexToColRow(index) {
  return [ int(index / gridSize) , index % gridSize];
}

function drawHead(row,col) {
    fill(100,0,100)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function drawSquare(row, col) {
    fill(0,0,250)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function drawApple(row, col) {
    fill(250,0,0)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function newGame(){
    snake = [
        colRowToIndex(3,int(gridSize/2)),
        colRowToIndex(2,int(gridSize/2)),
        colRowToIndex(1,int(gridSize/2))
    ];
    direction = "";
    apple = [] 
    apple.push(colRowToIndex(int(gridSize* 3/4), int(gridSize/2)));
    for (let count = 1; count < appleCount; count++) {        
        apple.push(resetApple())
    }
}

function setup() {
    createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight + 100);
    newGame();
    gameOver = false;
    score = 0;

    speedInput = createInput();
    speedInput.position(11,625);
    speedInputButton = createButton('submit');
    speedInputButton.position(speedInput.x + speedInput.width, speedInput.y);
    speedInputButton.mousePressed(response);
    speedGreeting = createElement('h', ' Speed');
    speedGreeting.position(11, 600);

    appleInput = createInput();
    appleInput.position(231,625);
    appleInputButton = createButton('submit');
    appleInputButton.position(appleInput.x + appleInput.width, appleInput.y);
    appleInputButton.mousePressed(response2);
    appleGreeting = createElement('h', ' AppleCount');
    appleGreeting.position(231, 600);
}

function response() {
    const r1 = speedInput.value();
    speedInput.value('');
    r1.replaceAll("[^\\d.]", "");
    speed = int(r1);
}

function response2() {
    const r2 = appleInput.value();
    appleInput.value('');
    r2.replaceAll("[^\\d.]", "");
    appleCount = int(r2);
}

function keyPressed() {
    if (key === 'Enter') {
        setup();
    }
    if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
            direction = "l";
    } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
            direction = "r";
    } else if (keyCode === UP_ARROW && snake[1] != snake[0] - gridSize) {
        direction = "u";
    } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
        direction = "d";
    }
}

function resetApple() {
    notfilled = []
    for (let index = 0; index < gridSize*gridSize; index++) {
        if (!snake.includes(index) && !apple.includes(index)) {
            notfilled.push(index)
        }
    }
    return int(random(notfilled));
    
}

function removeApple() {
    while (apple.length > appleCount) {
        apple.splice(random(0,apple.length-1),1)
    }
}

function checkOnApple() {
    ate = false;
    for (each in apple) {
        for (part in snake) {
            if (snake[part] == apple[each]){
                apple[each] = resetApple();
                ate = true;
                score += 1;
            } 
        }       
    }
    print(ate)
    if (ate == false) {
        snake.splice(snake.length-1, 1)
    }
}

function updateSnake(){
    if (!gameOver){
        if (direction === "r"){
            if (snake[0] % gridSize === gridSize - 1){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]+1)
            }
        }else if (direction === "u"){
            if (snake[0] < gridSize){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]-gridSize);
            }
        }else if (direction === "d"){
            if (snake[0] >= gridSize * (gridSize-1)){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]+gridSize);
            }
        }else if (direction === "l"){
            if (snake[0] % gridSize === 0){
                gameOver = true;
            }else{
                checkOnApple();
                snake.splice(0,0,snake[0]-1);
            }
        }
        for (let s = 1; s < snake.length; s++) {
            if (snake[0] == snake[s]) {
                gameOver = true;
            }
        }
    }
}

function drawGameOver() {
    fill(255,0,0);
    textSize(int(width/10));
    text(
        'GAME OVER\nClick [Enter] to restart',
        5,
        height/2-10
    );
}

function drawRect(txt,x,y,fillColor,w,h,textcolor) {
    if (gridSize <= 10) {
        textSize(gridSize-3)
    } else {
        textSize(gridSize)
    }
    fill(fillColor)
    rect(x,y,w,h)
    fill(textcolor)
    text(txt,x+w/2-gridSize*2,y+h/2+5)
}

function draw() {
    if (previous != appleCount) {
        removeApple()
        previous = appleCount
    }
    frameRate(speed);
    if (gameOver){
        drawGameOver();
    }else{
        background(0,150,0);
        
        // drawRect("Speed + 1",11,cellSize*gridSize+2+scoreHeight+10,[107,215,105],((cellSize*gridSize+2)-20)/2-10,35,250)
        // drawRect("Speed - 1",((cellSize*gridSize+2)-20)/2+1+10,cellSize*gridSize+2+scoreHeight+10,[107,215,105],((cellSize*gridSize+2)-20)/2-10,35,250)
        // drawRect("Apple + 1",11,cellSize*gridSize+2+scoreHeight+10+50,[107,215,105],((cellSize*gridSize+2)-20)/2-10,35,250)
        // drawRect("Apple - 1",((cellSize*gridSize+2)-20)/2+1+10,cellSize*gridSize+2+scoreHeight+10+50,[107,215,105],((cellSize*gridSize+2)-20)/2-10,35,250)
        stroke(0);
        strokeWeight(1.5);
        textSize(20)
        fill(0)
        text(`Score: ${score}`,cellSize*gridSize/4,50)
        text(`Speed: ${speed}`,cellSize*gridSize/4*2,50)
        text(`Apples: ${appleCount}`,cellSize*gridSize/4*3,50)
        updateSnake();
        for (let col = 0; col < gridSize; col++) {
            for (let row = 0; row < gridSize; row++) {
                const idx = colRowToIndex(col, row);
                
                fill(0,random(100,107),0);
                
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 1);
                if (snake.includes(idx)){
                    if (idx == snake[0]){
                        drawHead(row,col);
                    } else {
                        drawSquare(row,col);
                    }
                } else if (apple.includes(idx)) {
                    drawApple(row,col);
                }
            }
        }
    }
}