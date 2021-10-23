const cellSize = 20;
const gridSize = 15;
const selectWidth = 200;
const scoreHeight = 50;

// General variables
let speed = 10;
let apples = [];
let appleCount = 3;
let gameOver = false;
let isStarted = false;
let maxHp = 100;
let maxTurn = 0;

// Ai variables
let isOnTop = false;
let twirlMode = false;
let isAtEnd = true;
let twirl = 0;
let num = 0;
let duoApples;

let human = {
    name: "human",
    snake: [],
    direction: "",
    score: 0,
    hp: 0,
    turn: 0,
    ko: false
};

let ai = {
    name: "ai",
    snake: [],
    direction: "",
    score: 0,
    hp: 0,
    turn: 0,
    ko: false
};

let members = [human,ai];

function colRowToIndex(col, row) {
  return row * gridSize + col;
}

function indexToRowCol(index) {
  return [ int(index / gridSize) , index % gridSize];
}

function get_apples_in_row(row,array) {
    num = 0;
    for (let i = row*gridSize; i < (row+1)*gridSize; i++) {
        print(i)
        if (array.includes(i)) {
            num += 1
        }
    }
    return num;
}

function drawSquare(row, col, colour) {
    fill(colour)
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5)
}

function drawApple(row, col) {
    fill(0, 102, 153);
    textSize(cellSize*3/4);
    text("🍎",col*cellSize+cellSize/7,scoreHeight+row*cellSize+cellSize/1.3);
}

function newGame(){
    human.ko = false;
    ai.ko = false;
    isStarted = false;

    for (let index = 0; index < members.length; index++) {
        const element = members[index];
        element.snake = [
            colRowToIndex(3,int(gridSize/(members.length+1))*(index+1)),
            colRowToIndex(2,int(gridSize/(members.length+1))*(index+1)),
            colRowToIndex(1,int(gridSize/(members.length+1))*(index+1))                
        ];
        element.direction = "";
        element.score = 0;
        element.hp = maxHp;
        element.turn = 0;
    }
    apples = [];
    apples.push(colRowToIndex(int(gridSize* 3/4), int(gridSize/2)));
    for (let index = 1; index < appleCount; index++) {
        apples.push(newApple());
    }
    duoApples = apples;
    direction = "r";
    isOnTop = false;
    twirlMode = false;
    isAtEnd = true;
    twirl = 0;
    num = 0;
}

function setup() {
    createCanvas(cellSize * gridSize + 2 + selectWidth, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    let speedInput = createInput(speed);
    speedInput.position(width - selectWidth + 60, 75);
    speedInput.size(selectWidth - 100, 20);
    speedInput.input(inputSpeed);
    let appleCountInput = createInput(appleCount);
    appleCountInput.position(width - selectWidth + 60, 105);
    appleCountInput.size(selectWidth - 100,20);
    appleCountInput.input(inputAppleCount);
    let maxhpInput = createInput(maxHp);
    maxhpInput.position(width - selectWidth + 60, 135);
    maxhpInput.size(selectWidth - 100, 20);
    maxhpInput.input(inputMaxhp);
    let maxTurnInput = createInput(maxTurn);
    maxTurnInput.position(width - selectWidth + 60, 165);
    maxTurnInput.size(selectWidth - 100, 20);
    maxTurnInput.input(inputmaxTurn);
    startButton = createButton("");
    startButton.position(width - selectWidth + 50, height/2+195);
    startButton.size(selectWidth - 100,20);
    startButton.mousePressed(newGame);
    frameRate(speed);
}

function inputmaxTurn(){
    val = this.value();
    if (val === "" || val == null || isNaN(val)){
        return;
    }
    maxTurn = int(val);
}

function inputMaxhp(){
    val = this.value();
    if (val === "" || val == null || isNaN(val)){
        return;
    }
    maxHp = int(val);
}

function inputSpeed(){
    val = this.value();
    if (val === "" || val == null || isNaN(val)){
        return;
    }
    speed = int(val);
    frameRate(speed);
}

function inputAppleCount(){
    val = this.value();
    if (val === "" || val == null || isNaN(val)){
        return;
    }
    appleCount = int(val);
    if (appleCount < apples.length){
        while (apples.length != appleCount){
            apples.pop();
        }
    }else if(appleCount > apples.length){
        while (apples.length != appleCount){
            apples.push(newApple());
        }
    }
}

function keyPressed() {
    if (keyCode === LEFT_ARROW && human.snake[1] != human.snake[0] - 1) {
        isStarted = true;
        human.direction = "l";
    } else if (keyCode === RIGHT_ARROW && human.snake[1] != human.snake[0] + 1) {
        isStarted = true;
        human.direction = "r";
    } else if (keyCode === UP_ARROW && human.snake[1] != human.snake[0] - gridSize) {
        isStarted = true;
        human.direction = "u";
    } else if (keyCode === DOWN_ARROW && human.snake[1] != human.snake[0] + gridSize) {
        isStarted = true;
        human.direction = "d";
    }
}

function chickenMoves(){
    let head = indexToRowCol(ai.snake[0])
    let headidx = ai.snake[0]
    let headrow = head[0]
    let headcol = head[1]

    let apple = indexToRowCol(apples[0])
    let appleidx = apples[0]
    let applerow = apple[0]
    let applecol = apple[1]

    if (isStarted == true && ai.ko == false) {
        if (get_apples_in_row(headrow,duoApples) >= 4 || twirlMode == true || isOnTop == true || isAtEnd == false) {
            isAtEnd = false;
            if (twirlMode == false) {
                if (ai.direction == "l") {
                    if (headidx == 0 || isOnTop == true) {
                        isOnTop = true;
                        ai.direction = "d";
                        return;
                    } 
                    if (headidx % gridSize == 1 && headidx > gridSize - 1 && isOnTop == false) {
                        isAtEnd = true;
                        ai.direction = "u";
                        return; 
                    } 
                } else if (ai.direction == "d") {
                    if (headidx == (gridSize * (gridSize-1))){
                        isOnTop = false;
                        ai.direction = "r";
                        return;
                    } 
                } else if (ai.direction == "r") {
                    if (headidx % gridSize == gridSize-1 && isOnTop == false){
                        ai.direction = "u";
                        return;
                    } 
                } else if (ai.direction == "u") {
                    if (headidx % gridSize == gridSize - 1 && headidx != (gridSize * 2)-1){
                        ai.direction = "l";
                        return;
                    } else if (headidx % gridSize == gridSize-1) {
                        twirlMode = true;
                        twirl = 0
                    } else {
                        ai.direction = "r";
                        return;
                    }
                } else {
                    ai.direction = "r";
                    return;
                }
            } else {
                if (headidx != 1) {
                    if (twirl == 0) {
                        twirl = 1
                        ai.direction = "l";
                        return;
                    } else if (twirl == 1) {
                        twirl = 2
                        ai.direction = "d";
                        return;
                    } else if (twirl == 2) {
                        twirl = 3
                        ai.direction = "l";
                        return;
                    } else if (twirl == 3) {
                        twirl = 0
                        ai.direction = "u";
                        return;
                    }
                } else {
                    twirlMode = false;
                    ai.direction = "l";
                    return;
                }  
            }
        } else {
            if (headrow == 1) {
                twirlMode = true;
                isOnTop = true;
            } else {
                ai.direction = "u";
                return;
            }
        }
    } 
}

function isOnSnake(idx) {
    for (let index = 0; index < members.length; index++) {
        const snake = members[index].snake;
        if (snake.includes(idx)){
            return true;
        }
    }
    return false;
}

function newApple() {
    notsnake = [];
    for (let index = 0; index < gridSize*gridSize; index++) {
        if (!isOnSnake(index) && !apples.includes(index)){
            notsnake.push(index);
        }
    }
    return int(random(notsnake));
}

function checkOnApple(element) {
    element.hp -= 1;
    element.turn += 1;
    if (apples.includes(element.snake[0])){
        idx = apples.indexOf(element.snake[0]);
        apples[idx] = newApple();
        element.hp = maxHp;
        element.score += 1;
    } else {
        element.snake.splice(element.snake.length-1, 1)
    }
}

function updateSnake(element){
    if (!element.ko){
        if (element.direction == "r"){
            if (element.snake[0] % gridSize === gridSize - 1){
                element.ko = true;
            } else {
                element.snake.splice(0,0,element.snake[0]+1)
                checkOnApple(element); 
                element.hp -= 1;
            }
        }else if (element.direction === "u"){
            if (element.snake[0] < gridSize){
                element.ko = true;
            } else {
                element.snake.splice(0,0,element.snake[0]-gridSize);
                checkOnApple(element);
                element.hp -= 1;
            }
        }else if (element.direction === "d"){
            if (element.snake[0] >= gridSize * (gridSize-1)){
                element.ko = true;
            } else {
                element.snake.splice(0,0,element.snake[0]+gridSize);
                checkOnApple(element);
                element.hp -= 1;
            }
        }else if (element.direction === "l"){
            if (element.snake[0] % gridSize === 0){
                element.ko = true;
            } else { 
                element.snake.splice(0,0,element.snake[0]-1);
                checkOnApple(element);
                element.hp -= 1;
            }
        }
        for (let s = 1; s < element.snake.length; s++) {
            if (element.snake[0] == element.snake[s]) {
                element.ko = true;
            }
        }
        for (let b = 0; b < ai.snake.length; b++) {
            if (human.snake[0] == ai.snake[b]) {
                element.ko = true;
            }
        }
        for (let t = 0; t < human.snake.length; t++) {
            if (ai.snake[0] == human.snake[t]) {
                element.ko = true;
            }
        }
        if (element.hp <= 0 || (element.turn >= maxTurn && maxTurn != 0)){
            element.ko = true;
        }
    }
}

function drawGameOver() {
    fill(255,0,0);
    textSize(int(width/10));
    if (human.score > ai.score) {
        text(
            'GAME OVER\nHuman Victory',
            5,
            height/2-10
        );
    } else if (human.score < ai.score) {
        text(
            'GAME OVER\nAI Victory',
            5,
            height/2-10
        );
    } else {
        if (human.turn > ai.turn) {
            text(
                'GAME OVER\nAI Victory',
                5,
                height/2-10
            );
        } else if (human.turn < ai.turn) {
            text(
                'GAME OVER\nHuman Victory',
                5,
                height/2-10
            );
        } else {
            text(
                'GAME OVER\nTie',
                5,
                height/2-10
            );
        }
    }
        
}

function draw() {
    if (human.ko && ai.ko){
        drawGameOver();
        startButton.html("Start Game");
    }else{
        background(220);
        chickenMoves()
        updateSnake(human);
        updateSnake(ai);
        for (let col = 0; col < gridSize; col++) {
            for (let row = 0; row < gridSize; row++) {
                const idx = colRowToIndex(col, row);
                fill(0)
                textSize(11)
                text(`Player HP: ${human.hp}`,width - selectWidth + 10,height/2+80)
                text(`Ai HP: ${ai.hp}`,width - selectWidth + 10,height/2+30)
                text(`Player Score: ${human.score}`,6,height/2-155)
                text(`Player Turns: ${human.turn}`,6,height/2-135)
                text(`Ai Score: ${ai.score}`,206,height/2-155)
                text(`Ai Turns: ${ai.turn}`,206,height/2-135)
                if ((human.hp/maxHp)*150 <= 150 && (human.hp/maxHp)*150 > 100) {
                    fill(0,200,0)
                } else if ((human.hp/maxHp)*150 <= 100 && (human.hp/maxHp)*150 > 50) {
                    fill(200,200,0)
                } else {
                    fill(200,0,0)
                }    
                rect(width - selectWidth + 10, height/2+90, (human.hp/maxHp)*150, 12)
                if ((ai.hp/maxHp)*150 <= 150 && (ai.hp/maxHp)*150 > 100) {
                    fill(193,50,209)
                } else if ((ai.hp/maxHp)*150 <= 100 && (ai.hp/maxHp)*150 > 50) {
                    fill(107,19,214)
                } else {
                    fill(15,32,186)
                }  
                rect(width - selectWidth + 10, height/2+40, (ai.hp/maxHp)*150, 12)
                fill(255,248,220);
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 1);
                if (apples.includes(idx)) {
                    drawApple(row,col);
                }
                for (let index = 0; index < members.length; index++) {
                    const snake = members[index].snake;
                    if (snake.includes(idx)){
                        if (idx == snake[0]){
                            if (index == 0) {
                                drawSquare(row,col,[0,200,0]);
                            } else if (index == 1) {
                                drawSquare(row,col,[193,50,209]);
                            }
                        } else {
                            drawSquare(row,col,[0,0,250]);
                        }
                    } 
                }
            }
        }
        startButton.html("Restart Game");
    }
    fill(0,0,0);
    textSize(10);
    text("Speed:",width - selectWidth + 10, 40);
    text("Apples:",width - selectWidth + 10, 70);
    text("MaxHP:",width - selectWidth + 10, 100);
    text("MaxTurn:",width - selectWidth + 10, 130);
    textSize(15);
    // text("HP:"+hp,width - selectWidth + 15, 20);
    // text("Score:"+score,width - selectWidth + 70, 20);
    // text("Turn:"+turn,width - selectWidth + 130, 20);
    // fill(255,0,0);
    // rect(width - selectWidth + 10, 160, 160 * hp/maxHp,10);
}