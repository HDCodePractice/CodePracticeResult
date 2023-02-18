const cellSize = 20;
const gridSize = 15;
const selectWidth = 600;
const scoreHeight = 200;
let speed = 10;
let apples = [];
let appleCount = 3;
let gameOver = false;
let maxHp = 25;
let maxTurn = 0;
let maxAI = 5;

let sel;
let sel2;
let sel3;
let sel4;
let sel5; 
let sel6;

// let sels = [];

let human = {name: "", snake: [], direction: "", score: 0, hp: 0, turn: 0, color: 0, gameOver: false};

// let ai = {name: "ai", snake: [], direction: "", score: 0, hp: 0, turn: 0, color: 0, gameOver: false};

let members = [human];
let snakecolors = []

function colRowToIndex(col, row) {return row * gridSize + col;}

function indexToRowCol(index) {return [int(index / gridSize), index % gridSize];}

function drawCircle(row,col) {
    fill(0,0,0);
    circle(col*cellSize+1+cellSize/2, row*cellSize+1+scoreHeight+cellSize/2, cellSize);
}

function drawSquare(row, col, color) {
    fill(color);
    square(col*cellSize+1,row*cellSize+1+scoreHeight, cellSize);
}

function drawApple(row, col) {
    fill(0, 102, 153);
    textSize(cellSize*3/4);
    text("🔴",col*cellSize+cellSize/13,scoreHeight+row*cellSize+cellSize/1.225);
}

function newGame(){
    createSelects()
    human = {name: "", snake: [], direction: "", score: 0, hp: 0, turn: 0, color: 0, gameOver: false};
    gameOver = false;
    members = [human];
    members.push({name: "AI - jaden2", snake: [], direction: "", score: 0, hp: 0, turn: 0, color: 0, gameOver: false});
    for (let index = 0; index < maxAI-1; index++){
        members.push({name: "---------------", snake: [], direction: "", score: 0, hp: 0, turn: 0, color: 0, gameOver: false});
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
    apples = [];
    apples.push(colRowToIndex(int(gridSize* 3/4), int(gridSize/2)));
    for (let index = 1; index < appleCount; index++) {
        apples.push(newApple());
    }
}

function createSelects() {
    sel = createSelect();
    sel.position(width - selectWidth + 185, height/2 + 39);
    sel.option('Player');
    sel.option('AI - jaden2');
    sel.option('AI - noah_map_255');
    sel.option('AI - sicheng');
    sel.option('AI - parker');
    sel.option('---------------');
    sel.disable('AI - noah_map_255');
    sel.disable('AI - sicheng')
    sel.disable('AI - parker');
    sel.selected('Player');
    sel.changed(mySelectEvent);

    sel2 = createSelect();
    sel2.position(width - selectWidth + 185, height/2 + 79);
    sel2.option('AI - jaden2');
    sel2.option('AI - noah_map_255');
    sel2.option('AI - sicheng');
    sel2.option('AI - parker');
    sel2.option('---------------');
    sel.disable('AI - noah_map_255');
    sel2.disable('AI - sicheng')
    sel2.disable('AI - parker');
    sel2.selected('AI - jaden2');
    sel2.changed(mySelectEvent2);

    sel3 = createSelect();
    sel3.position(width - selectWidth + 185, height/2 + 119);
    sel3.option('AI - jaden2');
    sel3.option('AI - noah_map_255');
    sel3.option('AI - sicheng');
    sel3.option('AI - parker');
    sel3.option('---------------');
    sel.disable('AI - noah_map_255');
    sel3.disable('AI - sicheng')
    sel3.disable('AI - parker');
    sel3.selected('---------------');
    sel3.changed(mySelectEvent3);

    sel4 = createSelect();
    sel4.position(width - selectWidth + 185, height/2 + 159);
    sel4.option('AI - jaden2');
    sel4.option('AI - noah_map_255');
    sel4.option('AI - sicheng');
    sel4.option('AI - parker');
    sel4.option('---------------');
    sel.disable('AI - noah_map_255');
    sel4.disable('AI - sicheng')
    sel4.disable('AI - parker');
    sel4.selected('---------------');
    sel4.changed(mySelectEvent4);

    sel5 = createSelect();
    sel5.position(width - selectWidth + 185, height/2 + 199);
    sel5.option('AI - jaden2');
    sel5.option('AI - noah_map_255');
    sel5.option('AI - sicheng');
    sel5.option('AI - parker');
    sel5.option('---------------');
    sel.disable('AI - noah_map_255');
    sel5.disable('AI - sicheng')
    sel5.disable('AI - parker');
    sel5.selected('---------------');
    sel5.changed(mySelectEvent5);

    sel6 = createSelect();
    sel6.position(width - selectWidth + 185, height/2 + 239);
    sel6.option('AI - jaden2');
    sel6.option('AI - noah_map_255');
    sel6.option('AI - sicheng');
    sel6.option('AI - parker');
    sel6.option('---------------');
    sel.disable('AI - noah_map_255');
    sel6.disable('AI - sicheng')
    sel6.disable('AI - parker');
    sel6.selected('---------------');
    sel6.changed(mySelectEvent6);
}

function setup() {
    createCanvas(cellSize * gridSize + 2 + selectWidth, cellSize * gridSize + 2 + scoreHeight);
    snakecolors = [
        color(0,0,255),
        color(255,0,0),
        color(0,255,0),
        color(255,165,0),
        color(255,255,0),
        color(230,230,250),
        color(255,192,203)
    ]
    newGame();
    let speedInput = createInput(speed);
    speedInput.position(60, 72);
    speedInput.size(100, 20);
    speedInput.input(inputSpeed);
    let appleCountInput = createInput(appleCount);
    appleCountInput.position(60, 102);
    appleCountInput.size(100, 20);
    appleCountInput.input(inputAppleCount);
    let maxhpInput = createInput(maxHp);
    maxhpInput.position(60, 132);
    maxhpInput.size(100, 20);
    maxhpInput.input(inputMaxhp);
    let maxTurnInput = createInput(maxTurn);
    maxTurnInput.position(60, 162);
    maxTurnInput.size(100, 20);
    maxTurnInput.input(inputmaxTurn);
    startButton = createButton("");
    startButton.position(37, 210);
    startButton.size(100,20);
    startButton.mousePressed(newGame);

    createSelects()

    // for (let i = 0; i < maxAI+1; i++) {
    //     sel = createSelect();
    //     sel.position(width - selectWidth + 185, height/2 + i * 40 + 39);
    //     sel.option('Player');
    //     sel.option('AI - jaden2');
    //     sel.option('AI - noah_map_255');
    //     sel.option('AI - sicheng');
    //     sel.option('AI - parker');
    //     sel.option('---------------');
    //     sel.disable('AI - sicheng')
    //     sel.disable('AI - parker');
    //     sel.selected('Player');
    //     sels.push(sel)
    //     sels[i].changed(mySelectEvent);
    // }

    frameRate(speed);
}

// function mySelectEvent() {
//     choice = this.value();
//     print(choice)
//     members[0].name = choice;
// }

function mySelectEvent() {
    choice = sel1.value();
    members[0].name = choice;
}

function mySelectEvent2() {
    choice = sel2.value();
    members[1].name = choice;
}

function mySelectEvent3() {
    choice = sel3.value();
    print(choice)
    members[2].name = choice;
}

function mySelectEvent4() {
    choice = sel4.value();
    members[3].name = choice;
}

function mySelectEvent5() {
    choice = sel5.value();
    members[4].name = choice;
}

function mySelectEvent6() {
    choice = sel6.value();
    members[5].name = choice;
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
    if (!gameOver){
        if (direction === "r"){
            if (snake[0] % gridSize === gridSize - 1){
                member.gameOver = true;
            } else {
                checkOnApple(member);
                snake.splice(0,0,snake[0]+1)
            }
        } else if (direction === "u") {
            if (snake[0] < gridSize){
                member.gameOver = true;
            }else{
                checkOnApple(member);
                snake.splice(0,0,snake[0]-gridSize);
            }
        }else if (direction === "d"){
            if (snake[0] >= gridSize * (gridSize-1)){
                member.gameOver = true;
            }else{
                checkOnApple(member);
                snake.splice(0,0,snake[0]+gridSize);
            }
        }else if (direction === "l"){
            if (snake[0] % gridSize === 0){
                member.gameOver = true;
            }else{
                checkOnApple(member);
                snake.splice(0,0,snake[0]-1);
            }
        } 
        for (let s = 1; s < snake.length; s++) {
            if (snake[0] == snake[s]) {
                hp = 0;
                member.gameOver = true;
            }
        }
        if (turn > maxTurn && maxTurn !== 0) {
            hp = 0;
            member.gameOver = true;
        }
        for (let index = 0; index < members.length; index ++) {
            const each = members[index];
            for (let s = 0; s < each.snake.length; s++) {
                if (each != member) {
                    if (snake[0] == each.snake[s]) {
                        hp = 0
                        member.gameOver = true;
                    }
                }
            }
        }
        if (member.hp < 1) {
            member.gameOver = true;
        }
    }
}

function drawGameOver() {
    fill(255,0,0);
    textSize(int(width/20));
    text(
        'GAME OVER',
        225,
        70
    );
}

function checkIfGameOver() {
    gameovers = []
    let count = 0;
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        const member = members[memberIndex];
        gameovers.push(member.gameOver);
    }
    for (each in members) {
        if (members[each].snake.length <= 0) {
            count += 1
        }
    }
    print(count)
    if (gameovers.includes(false) && count != maxAI+1) {
        return false;
    }
    return true;
}

function draw() {
    if (checkIfGameOver() && members[0].direction != ""){
        drawGameOver();
        startButton.html("Start Game");
    } else {
        strokeWeight(1.3)
        background(220);
        for (let index = 0; index < members.length; index++) {
            if (members[index].name == "---------------") {
                members[index].snake = []
            } else {
                if (members[index].snake.length <= 0) {
                    members[index].snake = [
                        colRowToIndex(3,int(gridSize/(members.length+1))*(index+1)),
                        colRowToIndex(2,int(gridSize/(members.length+1))*(index+1)),
                        colRowToIndex(1,int(gridSize/(members.length+1))*(index+1))
                    ]  
                }
            }
        }
        if (members[0].direction != ""){
            for (let index = 0; index < members.length; index++) {
                if (members[index].name == "AI - jaden2") {
                    members[index].direction = jaden2_getDirection(gridSize, members[index].snake, apples, members[index].direction);
                } 
            }
        }
        for (let index = 0; index < members.length; index++) {
            const member = members[index];
            if (!member.gameOver){
                updateSnake(member);
            } else {
                member.snake = []
            }
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
    text("Speed:", 10, 40);
    text("Apples:", 10, 70);
    text("MaxHP:", 10, 100);
    text("MaxTurn:", 10, 130);
    textSize(15);
    for (let index = 0; index < members.length; index++) {
        strokeWeight(2)
        fill(members[index].color)
        if (members[index].hp >= 0) {
            rect(width - selectWidth + 20, height/2 + index*40 - 5, (members[index].hp/maxHp)*150, 12)
        } else {
            rect(width - selectWidth + 20, height/2 + index*40 - 5, 0.2, 12)
        }
    }
    // text("HP:"+hp,width - selectWidth + 15, 20);
    // text("Score:"+score,width - selectWidth + 70, 20);
    // text("Turn:"+turn,width - selectWidth + 130, 20);
    // fill(255,0,0);
    // rect(width - selectWidth + 10, 160, 160 * hp/maxHp,10);
}