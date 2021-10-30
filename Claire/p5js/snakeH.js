
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
let maxai = 5;
let aicount = 1
let font;

let human = {
    name: "human",
    snake: [],
    direction: "",
    score: 0,
    hp: 0,
    turn: 0,
    color: 0,
    dead:false
};


let members = [];
let snakecolors = []

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

function drawSquare(row, col, color) {
    fill(color);
    square(col*cellSize+1+cellSize/5,row*cellSize+1+scoreHeight+cellSize/5, cellSize*3/5);
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

    members = [human]

    for (let index = 0; index < aicount; index++) {
        members.push({
            name: "ai"+index,
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            color: 0,
            dead:false
        });
        
    }
    for (let index = 0; index < members.length; index++) {
        members[index].dead = false
    }


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
        element.color = snakecolors[index];
    }
}

function setup() {
    createCanvas(cellSize * gridSize + 2 + selectWidth, cellSize * gridSize + 2 + scoreHeight);
    snakecolors = [
        color(0, 0, 255),
        color(255, 0, 0),
        color(0, 255, 0),
        color(255,165,0),
        color(255,255,0),
        color(230,230,250),
        color(255,192,203)
    ]
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

    let aiInput = createInput(aicount);
    aiInput.position(width - selectWidth + 60, 200);
    aiInput.size(selectWidth - 100, 20);
    aiInput.input(inputAiCount);

    frameRate(speed);
}

function inputmaxTurn(){
    val = this.value();
    if (val === "" || val == null || isNaN(val)){
        return;
    }
    maxTurn = int(val);
}

function inputAiCount(){
    val = this.value();
    if (val > maxai){
        aicount = maxai
    }
    else{
        aicount = val
    }

    newGame
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

// function keyPressed() {
//     snake = members[0].snake;
//     if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
//             direction = "l";
//     } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
//             direction = "r";
//     } else if (keyCode === UP_ARROW && snake[1] != snake[0] - gridSize) {
//         direction = "u";
//     } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
//         direction = "d";
//     }
//         copyright{: cy :}
//     members[0].direction = direction;
// }

function keyPressed() {
    snake = members[0].snake;
    if (keyCode === LEFT_ARROW && snake[1] != snake[0] - 1) {
            direction = "l";
    } else if (keyCode === RIGHT_ARROW && snake[1] != snake[0] + 1) {
            direction = "r";
    } else if (keyCode === UP_ARROW && snake[1] != snake[0] - gridSize) {
        direction = "u";
    } else if (keyCode === DOWN_ARROW && snake[1] != snake[0] + gridSize) {
        direction = "d";
    }
    members[0].direction = direction;
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

function checkOnApple(member) {
    member.hp -= 1;
    member.turn += 1;
    if (apples.includes(member.snake[0])){
        idx = apples.indexOf(member.snake[0]);
        apples[idx] = newApple();
        member.hp = maxHp;
        member.score += 1;
    } else {
        member.snake.splice(member.snake.length-1, 1)
    }
}

function updateSnake(member) {
    snake = member.snake;
    direction = member.direction;
    hp = member.hp;
    turn = member.turn;
    if (!member.dead){
        if (direction === "r"){
            if (snake[0] % gridSize === gridSize - 1){
                member.dead = true;
            }else{
                checkOnApple(member);
                snake.splice(0,0,snake[0]+1)
            }
        }else if (direction === "u"){
            if (snake[0] < gridSize){
                member.dead = true;
            }else{
                checkOnApple(member);
                snake.splice(0,0,snake[0]-gridSize);
            }
        }else if (direction === "d"){
            if (snake[0] >= gridSize * (gridSize-1)){
                member.dead = true;
            }else{
                checkOnApple(member);
                snake.splice(0,0,snake[0]+gridSize);
            }
        }else if (direction === "l"){
            if (snake[0] % gridSize === 0){
                member.dead = true;
            }else{
                checkOnApple(member);
                snake.splice(0,0,snake[0]-1);
            }
        } 
        for (let index = 1; index < members.length; index++) {
            const m = members[index];
            if (m.snake[0] === snake[0]){
                for (let s = 1; s < m.snake.length; s++) {
                    if (snake[0] == m.snake[s]) {
                        member.dead = true;
                    }
                }
            }else{
                for (let s = 0; s < m.snake.length; s++) {
                    if (snake[0] == m.snake[s]) {
                        member.dead = true;
                    }
                }                
            }
        }
        if (hp <= 0 || (turn >= maxTurn && maxTurn != 0)){
            member.dead = true;
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
        if (members[0].direction != ""){
            for (let index = 1; index < members.length; index++) {
                members[index].direction = jaden2_getDirection(
                    gridSize, 
                    members[index].snake, 
                    apples, 
                    members[index].direction)
            }
        }
        for (let index = 0; index < members.length; index++) {
            const member = members[index];
            updateSnake(member);
        }
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
                            drawSquare(row,col,members[index].color);
                        }
                    } 
                }
            }
        }
        startButton.html("Restart Game");
    }
    fill(0,0,0);
    textSize(10);
    textFont("cursive")
    text("Speed:",width - selectWidth + 20, 47);
    text("Apples:",width - selectWidth + 17, 75);
    text("MaxHP:",width - selectWidth + 14, 105);
    text("MaxTurn:",width - selectWidth + 7, 135);
    text("AI Count:",width - selectWidth + 8, 165);
    textSize(15);

    for (let index = 0; index < members.length; index++) {
        strokeWeight(1)
        fill(members[index].color) 
        rect(310, 180+index*25, 160 * (members[index].hp/maxHp)/1.5,20);
        fill(0,0,0)
        text("HP:" + members[index].hp,310, 195+index*25)
        text("Score:" + members[index].score,355, 195+index*25)
        if(members[index].dead === true){
            fill(255,0,0);
            text("RIP",415, 195+index*25)
            members[index].snake = []
        }
    }
    if(members[0].direction !== ""){
        let deadcount = 0
        for (let index = 0; index < members.length; index++) {
            if(members[index].dead === true){
            deadcount += 1
            }
        }
        if(deadcount === members.length){
            drawGameOver()
        }
    }
    
}