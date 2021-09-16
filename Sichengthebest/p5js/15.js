const cellSize = 20;
const gridSize = 20;
const scoreHeight = 150;
const inputWidth = 200
const resetHeight = 40

let score;
let snake = [];
let grid = [];
let direction = 0; // 0 = right, 1 = left, 2 = down, 3 = up
let apple = [];
let gameOver = false;
let completed = false;
let appleCount = 1;
let speed = 7;

function setup() {
    frameRate(speed);
    newGame();
    createCanvas(cellSize * gridSize + inputWidth, cellSize * gridSize + 2 + scoreHeight+ resetHeight);
    background(220);
    button = createButton('New Game');
    button.position(gridSize*cellSize/2,scoreHeight+gridSize*cellSize+resetHeight+20);
    button.mousePressed(newGame);
    let inp = createInput(appleCount);
    inp.position(gridSize*cellSize+10,cellSize * gridSize/2+20);
    inp.size(100);
    inp.input(myInputEvent);
    let inp2 = createInput(speed);
    inp2.position(gridSize*cellSize+10,cellSize * gridSize/2+70);
    inp2.size(100);
    inp2.input(myInputEvent2);
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
    direction = 5;
}

function drawScore() {
    background(220)
    fill(0, 220, 0);
    textSize(15);
    text(`Score: ${score}\nNumber of apples: ${appleCount}\nSpeed: ${speed}\nTo start game, press any arrow key (except the left).`,gridSize*cellSize / 2-200,scoreHeight/2.5);
    text('Number of apples:',gridSize*cellSize+10,cellSize * gridSize/2-40);
    text('Speed:',gridSize*cellSize+10,cellSize * gridSize/2+10);
}

function drawRect(txt,x,y,fillColor,size,textcolor) {
    textSize(14);
    fill(fillColor);
    rect(x,y,size,size);
    fill(textcolor);
    text(txt,x+5,y+25);
}

function drawGrid() {
    drawRect(" + 🍎",gridSize*gridSize*0.8,20,[100,205,200],40,200);
    drawRect(" - 🍎",gridSize*gridSize*0.95,20,[107,215,105],40,200);
    drawRect(" + ⚡️",gridSize*gridSize*0.65,20,[200,205,10],40,200);
    drawRect(" - ⚡️",gridSize*gridSize*0.5,20,[207,15,15],40,200);
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
    notsnake = []
    for (let index = 0; index < gridSize*gridSize; index++) {
        if (!snake.includes(index) && !apple.includes(index)) {
            notsnake.push(index);
        }
    }
    apple.splice(appleidx,1);
    apple.push(int(random(notsnake)));
}

function checkOnApple() {
    isApple = false;
    for (let checkedidx = 0; checkedidx < apple.length; checkedidx++) {
        const checkedApple = apple[checkedidx];
        if (direction === 0) {
            if (snake[0] === checkedApple-1) {
                resetApple(apple.indexOf(snake[0]+1));
                score += 1;
                isApple = true;
            }
        } else if (direction === 1) {
            if (snake[0] === checkedApple+1) {
                resetApple(apple.indexOf(snake[0]-1));
                score += 1;
                isApple = true;
            }
        } else if (direction === 2) {
            if (snake[0] === checkedApple-gridSize) {
                resetApple(apple.indexOf(snake[0]+gridSize));
                score += 1;
                isApple = true;
            }
        } else if (direction === 3) {
            if (snake[0] === checkedApple+gridSize) {
                resetApple(apple.indexOf(snake[0]-gridSize));
                score += 1;
                isApple = true;
            }
        }
    }
    return isApple;
}

function updateSnake() {
    if (direction === 0) {
        if (snake[0]%gridSize === gridSize-1) {
            gameOver = true;
        } else {
            if (!checkOnApple()) {
                snake.splice(snake.length-1, 1)
            }
            snake.splice(0,0,snake[0]+1)
        }
    } else if (direction === 1) {
        if (snake[0]%gridSize === 0) {
            gameOver = true;
        } else {
            if (!checkOnApple()) {
                snake.splice(snake.length-1, 1)
            }
            snake.splice(0,0,snake[0]-1)
        }
    } else if (direction === 2) {
        if (snake[0] >= gridSize * (gridSize-1)) {
            gameOver = true;
        } else {
            if (!checkOnApple()) {
                snake.splice(snake.length-1, 1)
            }
            snake.splice(0,0,snake[0]+gridSize)

        }
    } else if (direction === 3) {
        if (snake[0] < gridSize) {
            gameOver = true;
        } else {
            if (!checkOnApple()) {
                snake.splice(snake.length-1, 1)
            }
            snake.splice(0,0,snake[0]-gridSize)
        }
    }
    for (let s = 1; s < snake.length; s++) {
        if (snake[0] == snake[s]) {
            gameOver = true;
        }
    }
}

function draw() {
    if (gameOver === false) {
        drawScore();
        drawGrid();
        updateSnake()
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
    button.html('Restart');
}

function keyPressed() {
    if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
        direction = 1;
    } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
        direction = 0;
    } else if (keyCode === UP_ARROW && snake[1] != snake[0] - gridSize) {
        direction = 3;
    } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
        direction = 2;
    }
}

function mousePressed() {
    if (mouseX > gridSize*gridSize*0.8 && mouseX < gridSize*gridSize*0.8+40 && mouseY > 20 && mouseY < 60) {
        appleCount += 1;
        notsnake = []
        for (let index = 0; index < gridSize*gridSize; index++) {
            if (!snake.includes(index) && !apple.includes(index)) {
                notsnake.push(index);
            }
        }
        if (apple.length < appleCount) {
            apple.push(int(random(notsnake)));
        }
    } else if (mouseX > gridSize*gridSize*0.95 && mouseX < gridSize*gridSize*0.95+40 && mouseY > 20 && mouseY < 60) {
        if (appleCount > 1) {
            appleCount -= 1;
            if (apple.length > appleCount) {
                apple.splice(random(0,apple.length-1),1);
            }
        }
    } else if (mouseX > gridSize*gridSize*0.65 && mouseX < gridSize*gridSize*0.65+40 && mouseY > 20 && mouseY < 60) {
        speed += 1;
        frameRate(speed)
    } else if (mouseX > gridSize*gridSize*0.5 && mouseX < gridSize*gridSize*0.5+40 && mouseY > 20 && mouseY < 60) {
        if (speed > 1) {
            speed -= 1;
            frameRate(speed)
        }
    } else if (mouseX > gridSize*cellSize/2 && mouseX < gridSize*cellSize/2+40 && mouseY > scoreHeight+gridSize*cellSize && mouseY < scoreHeight+gridSize*cellSize+40) {
        setup();
    }
}