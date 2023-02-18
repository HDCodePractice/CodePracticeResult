const cellSize = 20;
const gridSize = 15;
const selectWidth = 200;
const scoreHeight = 50;
let speed = 10;
let apples = [];
let appleCount = 3;
let gameOver = false;
let maxHp = 25;
let maxTurn = 0;

let human = {
    name: "human",
    snake: [],
    direction: "",
    score: 0,
    hp: 0,
    turn: 0
};

let ai = {
    name: "ai",
    snake: [],
    direction: "",
    score: 0,
    hp: 0,
    turn: 0
};

let members = [human,ai];

function colRowToIndex(col, row) {
  return row * gridSize + col;
}

function indexToRowCol(index) {
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
    textSize(cellSize*3/4);
    text("🍎",col*cellSize+cellSize/7,scoreHeight+row*cellSize+cellSize/1.3);
}

function newGame(){
    apples = [];
    apples.push(colRowToIndex(int(gridSize* 3/4), int(gridSize/2)));
    for (let index = 1; index < appleCount; index++) {
        apples.push(newApple());
    }
    gameOver = false;

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
}

function setup() {
    createCanvas(cellSize * gridSize + 2 + selectWidth, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    let speedInput = createInput(speed);
    speedInput.position(width - selectWidth + 60, 80);
    speedInput.size(selectWidth - 100, 20);
    speedInput.input(inputSpeed);
    let appleCountInput = createInput(appleCount);
    appleCountInput.position(width - selectWidth + 60, 110);
    appleCountInput.size(selectWidth - 100,20);
    appleCountInput.input(inputAppleCount);
    let maxhpInput = createInput(maxHp);
    maxhpInput.position(width - selectWidth + 60, 140);
    maxhpInput.size(selectWidth - 100, 20);
    maxhpInput.input(inputMaxhp);
    let maxTurnInput = createInput(maxTurn);
    maxTurnInput.position(width - selectWidth + 60, 170);
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
    snake = human["snake"]
    if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
        human["direction"] = "l";
        print (human["direction"])
    } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
        human["direction"] = "r";
        print (human["direction"])
    } else if (keyCode === UP_ARROW && snake[1] != snake[0] - gridSize) {
        human["direction"] = "u";
        print (human["direction"])
    } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
        human["direction"] = "d";
        print (human["direction"])
    }
}

function newApple() {
    notsnake = [];
    for (let index = 0; index < gridSize*gridSize; index++) {
        notsnake.push(index);
    }
    return int(random(notsnake));
}

function checkOnApple(snake) {
    print("checkOnAppleRan")
    snake["hp"] -= 1;
    snake["turn"] += 1;
    if (apples.includes(snake["snake"][0])){
        idx = apples.indexOf(snake["snake"][0]);
        apples[idx] = newApple();
        snake["hp"] = maxHp;
        print("OnApple")
    } else {
        snake["snake"].splice(snake["snake"].length-1, 1)
    }
}

function updateSnake(){
    if (!gameOver){
        
        ai["direction"]=hdcola_getDirection(gridSize,ai["snake"],apples,ai['direction'])
        
        if (human["direction"] === "r"){
            if (human["snake"][0] % gridSize === gridSize - 1){
                gameOver = true;
            }else{
                checkOnApple(human);
                human["snake"].splice(0,0,human["snake"][0]+1)
            }
        }else if (human["direction"] === "u"){
            if (human["snake"][0] < gridSize){
                gameOver = true;
            }else{
                checkOnApple(human);
                human["snake"].splice(0,0,human["snake"][0]-gridSize);
            }
        }else if (human["direction"] === "d"){
            if (human["snake"][0] >= gridSize * (gridSize-1)){
                gameOver = true;
            }else{
                checkOnApple(human);
                human["snake"].splice(0,0,human["snake"][0]+gridSize);
            }
        }else if (human["direction"] === "l"){
            if (human["snake"][0] % gridSize === 0){
                gameOver = true;
            }else{
                checkOnApple(human);
                human["snake"].splice(0,0,human["snake"][0]-1);
            }
        }
        for (let s = 1; s < human["snake"].length; s++) {
            if (human["snake"][0] == human["snake"][s]) {
                gameOver = true;
            }
        }


        for (let s = 1; s < ai["snake"].length; s++) {
            if (human["snake"][0] == ai["snake"][s]) {
                gameOver = true;
            }
        }

        if (ai["direction"] === "r"){
            if (ai["snake"][0] % gridSize === gridSize - 1){
                gameOver = true;
            }else{
                checkOnApple(ai);
                ai["snake"].splice(0,0,ai["snake"][0]+1)
            }
        }else if (ai["direction"] === "u"){
            if (ai["snake"][0] < gridSize){
                gameOver = true;
            }else{
                checkOnApple(ai);
                ai["snake"].splice(0,0,ai["snake"][0]-gridSize);
            }
        }else if (ai["direction"] === "d"){
            if (ai["snake"][0] >= gridSize * (gridSize-1)){
                gameOver = true;
            }else{
                checkOnApple(ai);
                ai["snake"].splice(0,0,ai["snake"][0]+gridSize);
            }
        }else if (ai["direction"] === "l"){
            if (ai["snake"][0] % gridSize === 0){
                gameOver = true;
            }else{
                checkOnApple(ai);
                ai["snake"].splice(0,0,ai["snake"][0]-1);
            }
        }
        
        for (let s = 1; s < human["snake"].length; s++) {
            if (human["snake"][0] == human["snake"][s]) {
                gameOver = true;
            }
        }

        if (human["hp"] <= 0 || (human["turn"] >= maxTurn && maxTurn != 0)){
            gameOver = true;
        }
    }
}

function drawGameOver() {
    fill(255,0,0);
    textSize(int(width/10));
    text(
        'GAME OVER',
        5,
        height/2-10
    );
}

function draw() {
    if (gameOver){
        drawGameOver();
        startButton.html("Start Game");
    }else{
        background(220);
        updateSnake();
        for (let col = 0; col < gridSize; col++) {
            for (let row = 0; row < gridSize; row++) {
                const idx = colRowToIndex(col, row);
                fill(255,248,220);
                rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 1);
                if (apples.includes(idx)) {
                    drawApple(row,col);
                }
                for (let index = 0; index < members.length; index++) {
                    const snake = members[index].snake;
                    if (snake.includes(idx)){
                        if (idx == snake[0]){
                            drawCircle(row,col);
                        } else {
                            drawSquare(row,col);
                        }
                    } 
                }
            }
        }
        startButton.html("Restart Game");
    }
    fill(0,0,0);
    textSize(10);
    text("Speed:",width - selectWidth + 10, 90);
    text("Apples:",width - selectWidth + 10, 120);
    text("MaxHP:",width - selectWidth + 10, 150);
    text("MaxTurn:",width - selectWidth + 10, 180);
    textSize(15);
    // text("HP:"+hp,width - selectWidth + 15, 20);
    // text("Score:"+score,width - selectWidth + 70, 20);
    // text("Turn:"+turn,width - selectWidth + 130, 20);
    // fill(255,0,0);
    // rect(width - selectWidth + 10, 160, 160 * hp/maxHp,10);
}