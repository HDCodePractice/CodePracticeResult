const cellSize = 20;
const gridSize = 15;
const selectWidth = 600;
const scoreHeight = 200;
let sel1;
let sel2;
let sel3;
let sel4;
let sel5;
let sel6;

// General variables
let speed = 10;
let apples = [];
let appleCount = 50;
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

let human = {name: "human", snake: [], direction: "", score: 0, hp: 0, turn: 0, invis: false};
let ai1 = {name: "ai1", snake: [], direction: "", score: 0, hp: 0, turn: 0, invis: false};
let ai2 = {name: "ai2", snake: [], direction: "", score: 0, hp: 0, turn: 0, invis: true};
let ai3 = {name: "ai3", snake: [], direction: "", score: 0, hp: 0, turn: 0, invis: true};
let ai4 = {name: "ai4", snake: [], direction: "", score: 0, hp: 0, turn: 0, invis: true};
let ai5 = {name: "ai5", snake: [], direction: "", score: 0, hp: 0, turn: 0, invis: true};

let members = [human, ai1, ai2, ai3, ai4, ai5];

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
    members[0].invis = false;
    members[1].invis = false;
    isStarted = false;
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

function activate1() {
    if (this.checked()) {
        members[0].invis = false;
    } else {
        members[0].invis = true;
    }
}

function activate2() {
    if (this.checked()) {
        members[1] = {
            name: "ai1",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: false
        }
    } else {
        members[1] = {
            name: "ai1",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: true
        }
    }
}

function activate3() {
    if (this.checked()) {
        members[2] = {
            name: "ai2",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: false
        }
    } else {
        members[2] = {
            name: "ai2",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: true
        }
    }
}

function activate4() {
    if (this.checked()) {
        members[3] = {
            name: "ai3",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: false
        }
    } else {
        members[3] = {
            name: "ai3",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: true
        }
    }
}

function activate5() {
    if (this.checked()) {
        members[4] = {
            name: "ai4",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: false
        }
    } else {
        members[4] = {
            name: "ai4",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: true
        }
    }
}

function activate6() {
    if (this.checked()) {
        members[5] = {
            name: "ai5",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: false
        }
    } else {
        members[5] = {
            name: "ai5",
            snake: [],
            direction: "",
            score: 0,
            hp: 0,
            turn: 0,
            invis: true
        }
    }
}

function setup() {
    createCanvas(cellSize * gridSize + 2 + selectWidth, cellSize * gridSize + 2 + scoreHeight);
    newGame();
    let speedInput = createInput(speed);
    speedInput.position(width - selectWidth + 460, 75);
    speedInput.size(selectWidth - 500, 20);
    speedInput.input(inputSpeed);
    let appleCountInput = createInput(appleCount);
    appleCountInput.position(width - selectWidth + 460, 105);
    appleCountInput.size(selectWidth - 500,20);
    appleCountInput.input(inputAppleCount);
    let maxhpInput = createInput(maxHp);
    maxhpInput.position(width - selectWidth + 460, 135);
    maxhpInput.size(selectWidth - 500, 20);
    maxhpInput.input(inputMaxhp);
    let maxTurnInput = createInput(maxTurn);
    maxTurnInput.position(width - selectWidth + 460, 165);
    maxTurnInput.size(selectWidth - 500, 20);
    maxTurnInput.input(inputmaxTurn);
    startButton = createButton("");
    startButton.position(width - selectWidth + 50, height/2+195);
    startButton.size(100,20);
    startButton.mousePressed(newGame);
    checkbox1 = createCheckbox(' Player', true)
    checkbox1.position(330, 275);
    checkbox1.changed(activate1);
    checkbox2 = createCheckbox(' Ai 1', true)
    checkbox2.position(330, 315);
    checkbox2.changed(activate2);
    checkbox3 = createCheckbox(' Ai 2', false)
    checkbox3.position(330, 355);
    checkbox3.changed(activate3);
    checkbox4 = createCheckbox(' Ai 3', false)
    checkbox4.position(330, 395);
    checkbox4.changed(activate4);
    checkbox5 = createCheckbox(' Ai 4', false)
    checkbox5.position(330, 435);
    checkbox5.changed(activate5);
    checkbox6 = createCheckbox(' Ai 5', false)
    checkbox6.position(330, 475);
    checkbox6.changed(activate6);
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
    if (keyCode === LEFT_ARROW && members[0].snake[1] != members[0].snake[0] - 1) {
        isStarted = true;
        members[0].direction = "l";
    } else if (keyCode === RIGHT_ARROW && members[0].snake[1] != members[0].snake[0] + 1) {
        isStarted = true;
        members[0].direction = "r";
    } else if (keyCode === UP_ARROW && members[0].snake[1] != members[0].snake[0] - gridSize) {
        isStarted = true;
        members[0].direction = "u";
    } else if (keyCode === DOWN_ARROW && members[0].snake[1] != members[0].snake[0] + gridSize) {
        isStarted = true;
        members[0].direction = "d";
    }
}

function chickenMoves1(){
    let head = indexToRowCol(members[1].snake[0])
    let headidx = members[1].snake[0]
    let headrow = head[0]
    let headcol = head[1]

    let apple = indexToRowCol(apples[0])
    let appleidx = apples[0]
    let applerow = apple[0]
    let applecol = apple[1]

    if (isStarted == true && members[1].invis == false) {
        if (get_apples_in_row(headrow,duoApples) >= 4 || twirlMode == true || isOnTop == true || isAtEnd == false) {
            isAtEnd = false;
            if (twirlMode == false) {
                if (members[1].direction == "l") {
                    if (headidx == 0 || isOnTop == true) {
                        isOnTop = true;
                        members[1].direction = "d";
                        return;
                    } 
                    if (headidx % gridSize == 1 && headidx > gridSize - 1 && isOnTop == false) {
                        isAtEnd = true;
                        members[1].direction = "u";
                        return; 
                    } 
                } else if (members[1].direction == "d") {
                    if (headidx == (gridSize * (gridSize-1))){
                        isOnTop = false;
                        members[1].direction = "r";
                        return;
                    } 
                } else if (members[1].direction == "r") {
                    if (headidx % gridSize == gridSize-1 && isOnTop == false){
                        members[1].direction = "u";
                        return;
                    } 
                } else if (members[1].direction == "u") {
                    if (headidx % gridSize == gridSize - 1 && headidx != (gridSize * 2)-1){
                        members[1].direction = "l";
                        return;
                    } else if (headidx % gridSize == gridSize-1) {
                        twirlMode = true;
                        twirl = 0
                    } else {
                        members[1].direction = "r";
                        return;
                    }
                } else {
                    members[1].direction = "r";
                    return;
                }
            } else {
                if (headidx != 1) {
                    if (twirl == 0) {
                        twirl = 1
                        members[1].direction = "l";
                        return;
                    } else if (twirl == 1) {
                        twirl = 2
                        members[1].direction = "d";
                        return;
                    } else if (twirl == 2) {
                        twirl = 3
                        members[1].direction = "l";
                        return;
                    } else if (twirl == 3) {
                        twirl = 0
                        members[1].direction = "u";
                        return;
                    }
                } else {
                    twirlMode = false;
                    members[1].direction = "l";
                    return;
                }  
            }
        } else {
            if (headrow == 1) {
                twirlMode = true;
                isOnTop = true;
            } else {
                members[1].direction = "u";
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
    if (!element.invis){
        if (element.direction == "r"){
            if (element.snake[0] % gridSize === gridSize - 1){
                element.invis = true;
            } else {
                element.snake.splice(0,0,element.snake[0]+1)
                checkOnApple(element); 
                element.hp -= 1;
            }
        }else if (element.direction === "u"){
            if (element.snake[0] < gridSize){
                element.invis = true;
            } else {
                element.snake.splice(0,0,element.snake[0]-gridSize);
                checkOnApple(element);
                element.hp -= 1;
            }
        }else if (element.direction === "d"){
            if (element.snake[0] >= gridSize * (gridSize-1)){
                element.invis = true;
            } else {
                element.snake.splice(0,0,element.snake[0]+gridSize);
                checkOnApple(element);
                element.hp -= 1;
            }
        }else if (element.direction === "l"){
            if (element.snake[0] % gridSize === 0){
                element.invis = true;
            } else { 
                element.snake.splice(0,0,element.snake[0]-1);
                checkOnApple(element);
                element.hp -= 1;
            }
        }
        // for (let s = 1; s < element.snake.length; s++) {
        //     if (element.snake[0] == element.snake[s]) {
        //         element.invis = true;
        //     }
        // }
        // for (b in members[1]) {
        //     for (let c = 0; c < b.snake.length; c++) {
        //         if (members[0].snake[0] == members[1][b].snake[c]) {
        //             element.invis = true;
        //         }   
        //     }
        // }
        // for (d in members[1]) {
        //     for (e in members[1]) {
        //         for (let f = 0; f < d.snake.length; f++) {
        //             for (let g = 0; g < e.snake.length; g++) {
        //                 if (members[1][d].snake[f] == members[1][e].snake[g]) {
        //                     element.invis = true;
        //                 } 
        //             }
        //         }
        //     }
        // }
        for (let index = 1; index < members.length; index++) {
            const m = members[index];
            if (m.snake[0] === element.snake[0]){
                for (let s = 1; s < m.snake.length; s++) {
                    if (element.snake[0] == m.snake[s]) {
                        gameOver = true;
                    }
                }
            }else{
                for (let s = 0; s < m.snake.length; s++) {
                    if (element.snake[0] == m.snake[s]) {
                        gameOver = true;
                    }
                }                
            }
        }
        if (element.hp <= 0 || (element.turn >= maxTurn && maxTurn != 0)){
            element.invis = true;
        }
    } else {
        element.snake = [];
    }
}

function drawGameOver() {
    fill(0,150,150);
    textSize(int(width/10));
    text(
        'GAME OVER',
        5,
        height/2-10
    );
}

function draw() {
    for (let index = 0; index < members.length; index++) {
        if (members[index].invis == false) {
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
    if (members[0].invis && members[0].invis && members[1].invis && members[2].invis && members[3].invis && members[4].invis && members[5].invis) {
        drawGameOver();
        startButton.html("Start Game");
    }else{
        background(220);
        chickenMoves1()
        for (let index = 0; index < members; index++) {
            updateSnake(members[index])
        }
        for (let col = 0; col < gridSize; col++) {
            for (let row = 0; row < gridSize; row++) {
                const idx = colRowToIndex(col, row);
                fill(0)
                textSize(11)
                // text(`Player HP: ${human.hp}`,width - selectWidth + 10,height/2+80)
                // text(`Ai HP: ${ai.hp}`,width - selectWidth + 10,height/2+30)
                text(`Player Score: ${members[0].score}`,6,height/2-155)
                text(`Player Turns: ${members[0].turn}`,6,height/2-135)
                text(`Ai Score: ${members[1].score}`,206,height/2-155)
                text(`Ai Turns: ${members[1].turn}`,206,height/2-135)
                // if ((human.hp/maxHp)*150 <= 150 && (human.hp/maxHp)*150 > 100) {
                //     fill(0,200,0)
                // } else if ((human.hp/maxHp)*150 <= 100 && (human.hp/maxHp)*150 > 50) {
                //     fill(200,200,0)
                // } else {
                //     fill(200,0,0)
                // }    
                // rect(width - selectWidth + 10, height/2+90, (human.hp/maxHp)*150, 12)
                // if ((ai.hp/maxHp)*150 <= 150 && (ai.hp/maxHp)*150 > 100) {
                //     fill(193,50,209)
                // } else if ((ai.hp/maxHp)*150 <= 100 && (ai.hp/maxHp)*150 > 50) {
                //     fill(107,19,214)
                // } else {
                //     fill(15,32,186)
                // }  
                // rect(width - selectWidth + 10, height/2+40, (ai.hp/maxHp)*150, 12)
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
                            } else if (index == 2) {
                                drawSquare(row,col,[250,0,0]);
                            } else if (index == 3) {
                                drawSquare(row,col,[250,0,250]);
                            } else if (index == 4) {
                                drawSquare(row,col,[0,0,150]);
                            } else if (index == 5) {
                                drawSquare(row,col,[0,0,0]);
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
    text("Speed:",width - selectWidth + 410, 40);
    text("Apples:",width - selectWidth + 410, 70);
    text("MaxHP:",width - selectWidth + 410, 100);
    text("MaxTurn:",width - selectWidth + 410, 130);
    textSize(15);
    // text("HP:"+hp,width - selectWidth + 15, 20);
    // text("Score:"+score,width - selectWidth + 70, 20);
    // text("Turn:"+turn,width - selectWidth + 130, 20);
    // fill(255,0,0);
    // rect(width - selectWidth + 10, 160, 160 * hp/maxHp,10);
}