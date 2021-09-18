const cellSize = 20;
const gridSize = 20;
const scoreHeight = 150;
const inputWidth = 200;
const resetHeight = 40;

let score;
let snake = [];
let grid = [];
let direction = '';
let apple = [];
let gameOver = false;
let completed = false;
let appleCount = 1;
let speed = 7;
let hpMax = 100;
let hp = hpMax;
let turn = 0;
let turnMax = 0;


function setup() {
    frameRate(speed);
    newGame();
    createCanvas(cellSize * gridSize + inputWidth, cellSize * gridSize + 2 + scoreHeight+ resetHeight);
    background(220);
    button = createButton('New Game');
    button.position(gridSize*cellSize/2,scoreHeight+gridSize*cellSize+resetHeight+20);
    button.mousePressed(setup);
    let inp = createInput(appleCount);
    inp.position(gridSize*cellSize+10,cellSize * gridSize/2+20);
    inp.size(100);
    inp.input(myInputEvent);
    let inp2 = createInput(speed);
    inp2.position(gridSize*cellSize+10,cellSize * gridSize/2+70);
    inp2.size(100);
    inp2.input(myInputEvent2);
    let inp3 = createInput(hpMax);
    inp3.position(gridSize*cellSize+10,cellSize * gridSize/2+120);
    inp3.size(100);
    inp3.input(myInputEvent3);
    let inp4 = createInput(turnMax);
    inp4.position(gridSize*cellSize+10,cellSize * gridSize/2+290);
    inp4.size(100);
    inp4.input(myInputEvent4);
    hp = hpMax;
    turn = 0;
}

function myInputEvent() {
    inp = int(this.value());
    if (!isNaN(inp)) {
        if (inp > appleCount) {
            while (inp > appleCount) {
                appleCount += 1
                for (let index = 0; index < gridSize*gridSize; index++) {
                    if (!snake.includes(index) && !apple.includes(index)) {
                        notsnake.push(index);
                    }
                }
                apple.push(int(random(notsnake)));
            }
        } else if (inp < appleCount) {
            while (inp < appleCount) {
                appleCount -= 1;
                if (apple.length > appleCount) {
                    apple.splice(random(0,apple.length-1),1);
                }
            }
        }
    }
}

function myInputEvent2() {
    inp = int(this.value());
    if (!isNaN(inp)) {
        speed = inp;
        frameRate(speed);
    }
}

function myInputEvent3() {
    inp = int(this.value());
    if (!isNaN(inp)) {
        hpMax = inp;
        if (hp > hpMax) {
            hp = hpMax;
        }
    }
}

function myInputEvent4() {
    inp = int(this.value());
    if (!isNaN(inp)) {
        turnMax = inp;
        if (turn > turnMax && turnMax !== 0) {
            gameOver = true;
        }
    }
}

function newGame() {
    grid = new Array(gridSize * gridSize).fill('n');
    snake = [int(gridSize/2)*gridSize+3,int(gridSize/2)*gridSize+2,int(gridSize/2)*gridSize+1];
    apple = []
    notsnake = []
    for (let index = 0; index < appleCount; index++) {
        for (let index = 0; index < gridSize*gridSize; index++) {
            if (!snake.includes(index) && !apple.includes(index)) {
                notsnake.push(index);
            }
        }
        apple.push(int(random(notsnake)));
    }
    score = 0;
    gameOver = false;
    completed = false;
    direction = '';
}

function drawScore() {
    background(220)
    fill(0, 220, 0);
    textSize(25);
    text(`Score: ${score}\nTo start game, press any arrow key (except the left).`,10,scoreHeight/2.5);
    textSize(15);
    text('Number of apples:',gridSize*cellSize+10,cellSize * gridSize/2-40);
    text('Speed:',gridSize*cellSize+10,cellSize * gridSize/2+10);
    text('Maximum HP:',gridSize*cellSize+10,cellSize * gridSize/2+60);
    text('Maximum number of turns:',gridSize*cellSize+10,cellSize * gridSize/2+230);
}

function drawGrid() {
    for (let row = 0; row < gridSize; row++) {
        for (let col = 0; col < gridSize; col++) {
            currentlydrawing = ((row)*gridSize)+col;
            
            const idx = row * gridSize + col;
            stroke(0);
            strokeWeight(2);
            fill(235);
            rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
            if (snake.includes(idx)) {
                if (idx === snake[0]) {
                    fill(0,0,255);
                    circle(col * cellSize + 1+cellSize/2, row * cellSize + 1+cellSize/2 + scoreHeight, cellSize);
                } else {
                    fill(0);
                    rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize);
                }
            }
            for (let checkedidx = 0; checkedidx < apple.length; checkedidx++) {
                const checkedApple = apple[checkedidx];
                if (idx === checkedApple) {
                    drawApple(row,col);
                }
            }
        }
    }
}

function resetApple(appleidx) {
    hp = hpMax;
    notsnake = []
    for (let index = 0; index < gridSize*gridSize; index++) {
        if (!snake.includes(index) && !apple.includes(index)) {
            notsnake.push(index);
        }
    }
    apple.splice(appleidx,1);
    apple.push(int(random(notsnake)));
}

function updateSnake(){
    if (!gameOver){
        if (direction != '') {
            turn += 1;
        }
        if (direction === "r"){
            if (snake[0] % gridSize === gridSize - 1){
                gameOver = true;
            }else{
                if (!checkOnApple()) {
                    snake.splice(snake.length-1, 1)
                }
                snake.splice(0,0,snake[0]+1)
            }
        }else if (direction === "u"){
            if (snake[0] < gridSize){
                gameOver = true;
            }else{
                if (!checkOnApple()) {
                    snake.splice(snake.length-1, 1)
                }
                snake.splice(0,0,snake[0]-gridSize);
            }
        }else if (direction === "d"){
            if (snake[0] >= gridSize * (gridSize-1)){
                gameOver = true;
            }else{
                if (!checkOnApple()) {
                    snake.splice(snake.length-1, 1)
                }
                snake.splice(0,0,snake[0]+gridSize);
            }
        }else if (direction === "l"){
            if (snake[0] % gridSize === 0){
                gameOver = true;
            }else{
                if (!checkOnApple()) {
                    snake.splice(snake.length-1, 1)
                }
                snake.splice(0,0,snake[0]-1);
            }
        }
        for (let s = 1; s < snake.length; s++) {
            if (snake[0] == snake[s]) {
                gameOver = true;
            }
        }
        hp -= 1;
        if (hp < 0) {
            gameOver = true;
        }
        if (turn > turnMax && turnMax !== 0) {
            gameOver = true;
        }
    }
}

function checkOnApple() {
    isApple = false;
    for (let checkedidx = 0; checkedidx < apple.length; checkedidx++) {
        let checkedApple = apple[checkedidx];
        if (direction === 'r') {
            if (snake[0] === checkedApple-1) {
                resetApple(apple.indexOf(snake[0]+1));
                score += 1;
                isApple = true;
            }
        } else if (direction === 'l') {
            if (snake[0] === checkedApple+1) {
                resetApple(apple.indexOf(snake[0]-1));
                score += 1;
                isApple = true;
            }
        } else if (direction === 'd') {
            if (snake[0] === checkedApple-gridSize) {
                resetApple(apple.indexOf(snake[0]+gridSize));
                score += 1;
                isApple = true;
            }
        } else if (direction === 'u') {
            if (snake[0] === checkedApple+gridSize) {
                resetApple(apple.indexOf(snake[0]-gridSize));
                score += 1;
                isApple = true;
            }
        }
    }
    return isApple;
}

function draw() {
    if (gameOver === false) {
        drawScore();
        drawGrid();
        drawHp();
        drawTurn();
        updateSnake();
    } else {
        drawGameOver()
    }
}

function drawApple(row, col) {
    fill(0, 102, 153);
    textSize(20);
    text("🍎",col*cellSize,scoreHeight+(row+1)*cellSize-1);
}

function drawGameOver() {
    fill(255,0,0)
    textSize(int(width/20));
    text('GAME OVER\r\nClick restart button to restart',width/5,height/2)
    button.html(':- Restart -:');
}

function drawHp() {
    fill(0, 220, 0);
    textSize(15);
    text(`HP: ${hp}`,gridSize*cellSize+10,gridSize*cellSize/2+120);
    rectLength = int(hp*100/hpMax);
    originalLength = 106;
    if (rectLength > 100) {
        rectLength = 100;
    }
    stroke(0);
    strokeWeight(6);
    fill(220);
    rect(gridSize*cellSize+10,gridSize*cellSize/2+133,originalLength,26)
    if (rectLength >= 60) {
        fill(0, 220, 0);
    } else if (rectLength >= 40 && rectLength < 60) {
        fill(230, 230, 0)
    } else if (rectLength >= 20 && rectLength < 40) {
        fill(220, 150, 0)
    } else {
        fill(220,0,0)
    }
    noStroke()
    rect(gridSize*cellSize+13,gridSize*cellSize/2+136,rectLength,20)
    stroke(0);
    strokeWeight(2);
}

function drawTurn() {
    fill(0, 220, 0);
    textSize(15);
    text(`Turn: ${turn}`,gridSize*cellSize+10,gridSize*cellSize/2+190);
}

function keyPressed() {
    if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
        direction = 'l';
    } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
        direction = 'r';
    } else if (keyCode === UP_ARROW && snake[1] != snake[0] - gridSize) {
        direction = 'u';
    } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
        direction = 'd';
    }
}