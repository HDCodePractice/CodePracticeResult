const cellSize = 20;
const gridSize = 20;
const scoreHeight = 150;
const inputWidth = 200;
const resetHeight = 40;

let grid = [];
let apple = [];
let completed = false;
let appleCount = 10;
let speed = 7;
let hpMax = 100;
let turnMax = 0;

let human = {
    name: 'human',
    snake: [],
    direction: '',
    turn: 0,
    score: 0,
    hp: hpMax,
    gameOver: false
}
let ai = {
    name: 'ai',
    snake: [],
    direction: '',
    turn: 0,
    score: 0,
    hp: hpMax,
    gameOver: false
}
let members = [human,ai]

function colRowtoIndex(col,row) {
    return row*gridSize+col
}

function setup() {
    frameRate(int(speed));
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

function isOnApple(apple) {
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        const snake = members[memberIndex].snake
        if (snake.includes(apple)) {
            return true;
        }
    }
    return false;
}

function newGame() {
    grid = new Array(gridSize * gridSize).fill('n');
    apple = []
    notsnake = []
    
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        const member = members[memberIndex]
        member.score = 0;
        member.turn = 0;
        member.snake = [
            colRowtoIndex(3,int(gridSize/(members.length+1))*(memberIndex+1)),
            colRowtoIndex(2,int(gridSize/(members.length+1))*(memberIndex+1)),
            colRowtoIndex(1,int(gridSize/(members.length+1))*(memberIndex+1))
        ]
        member.hp = hpMax;
        member.gameOver = false;
        member.direction = ''
    }
    for (let index = 0; index < appleCount; index++) {
        for (let index2 = 0; index2 < gridSize*gridSize; index2++) {
            if (!isOnApple(index2) && !apple.includes(index2)) {
                notsnake.push(index2);
            }
        }
        apple.push(int(random(notsnake))); 
    };
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
            for (let index = 0; index < members.length; index++) {
                const member = members[index]
                if (member.snake.includes(idx)) {
                    if (idx === member.snake[0]) {
                        fill(0,0,255);
                        circle(col * cellSize + 1+cellSize/2, row * cellSize + 1+cellSize/2 + scoreHeight, cellSize);
                    } else {
                        if (index == 0) {
                            fill(0);
                        } else {
                            fill(255,0,0)
                        }
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
}

function resetApple(appleidx) {
    hp = hpMax;
    notsnake = []
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        for (let index = 0; index < appleCount; index++) {
            for (let index2 = 0; index2 < gridSize*gridSize; index2++) {
                if (!isOnApple(index2) && !apple.includes(index2)) {
                    notsnake.push(index2);
                }
            }
        }
    }
    apple.splice(appleidx,1);
    apple.push(int(random(notsnake)));
}

function updateSnake(member){
    members[1].direction = sicheng2_getDirection(gridSize,members[1].snake,apple,members[1].direction)
    if (member.direction != '') {
        member.turn += 1;
        member.hp -= 1;
    }
    if (member.direction === "r"){
        if (member.snake[0] % gridSize === gridSize - 1){
            member.gameOver = true;
        }else{
            if (!checkOnApple(member)) {
                member.snake.splice(member.snake.length-1, 1)
            }
            member.snake.splice(0,0,member.snake[0]+1)
        }
    }else if (member.direction === "u"){
        if (member.snake[0] < gridSize){
            member.gameOver = true;
        }else{
            if (!checkOnApple(member)) {
                member.snake.splice(member.snake.length-1, 1)
            }
            member.snake.splice(0,0,member.snake[0]-gridSize);
        }
    }else if (member.direction === "d"){
        if (member.snake[0] >= gridSize * (gridSize-1)){
            member.gameOver = true;
        }else{
            if (!checkOnApple(member)) {
                member.snake.splice(member.snake.length-1, 1)
            }
            member.snake.splice(0,0,member.snake[0]+gridSize);
        }
    }else if (member.direction === "l"){
        if (member.snake[0] % gridSize === 0){
            member.gameOver = true;
        }else{
            if (!checkOnApple(member)) {
                member.snake.splice(member.snake.length-1, 1)
            }
            member.snake.splice(0,0,member.snake[0]-1);
        }
    }
    for (let s = 1; s < member.snake.length; s++) {
        if (member.snake[0] == member.snake[s]) {
            member.gameOver = true;
        }
    }
    if (member.hp < 0) {
        member.gameOver = true;
    }
    if (member.turn > turnMax && turnMax !== 0) {
        member.hp = 0
        member.gameOver = true;
    }
    for (let s = 0; s < member.snake.length; s++) {
        if (member.name == 'human') {
            if (member.snake[0] == members[1].snake[s]) {
                member.hp = 0
                member.gameOver = true;
            }
        } else if (member.name == 'ai') {
            if (member.snake[0] == members[0].snake[s]) {
                member.hp = 0
                member.gameOver = true;
            }
        }
    }
}

function checkOnApple(member) {
    isApple = false;
    for (let checkedidx = 0; checkedidx < apple.length; checkedidx++) {
        let checkedApple = apple[checkedidx];
        if (member.direction === 'r') {
            if (member.snake[0] === checkedApple-1) {
                resetApple(apple.indexOf(member.snake[0]+1));
                member.hp = hpMax
                member.score += 1;
                isApple = true;
            }
        } else if (member.direction === 'l') {
            if (member.snake[0] === checkedApple+1) {
                resetApple(apple.indexOf(member.snake[0]-1));
                member.hp = hpMax
                member.score += 1;
                isApple = true;
            }
        } else if (member.direction === 'd') {
            if (member.snake[0] === checkedApple-gridSize) {
                resetApple(apple.indexOf(member.snake[0]+gridSize));
                member.hp = hpMax
                member.score += 1;
                isApple = true;
            }
        } else if (member.direction === 'u') {
            if (member.snake[0] === checkedApple+gridSize) {
                resetApple(apple.indexOf(member.snake[0]-gridSize));
                member.hp = hpMax
                member.score += 1;
                isApple = true;
            }
        }
    }
    return isApple;
}

function draw() {
    background(220)
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        const member = members[memberIndex]
        if (member.gameOver === false) {
            //drawScore();
            drawGrid();
            drawHp();
            //drawTurn();
            updateSnake(member);
        } else {
            drawGameOver()
        }
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
    text(`HP: ${members[0].hp}, HP: ${members[1].hp}`,gridSize*cellSize+10,gridSize*cellSize/2+120);
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
    if (keyCode === LEFT_ARROW && members[0].snake[1] != members[0].snake[0] - 1) {
        members[0].direction = 'l';
    } else if (keyCode === RIGHT_ARROW && members[0].snake[1] != members[0].snake[0] + 1) {
        members[0].direction = 'r';
    } else if (keyCode === UP_ARROW && members[0].snake[1] != members[0].snake[0] - gridSize) {
        members[0].direction = 'u';
    } else if (keyCode === DOWN_ARROW && members[0].snake[1] != members[0].snake[0] + gridSize) {
        members[0].direction = 'd';
    }
}

function sicheng2_getDirection(gridSize,snake,apples,direction){
    let row = int(snake[0]/gridSize);
    let col = snake[0]%gridSize;
    if (gridSize%2 === 0) {
        if (col === gridSize-1) {
            if (row == gridSize-1) {
                return 'l'
            } else {
                return 'd'
            }
        } else {
            if (row%2 !== 0 && col != 0) {
                return 'l'
            } else if ((row%2 === 0 &&  col < gridSize-2) || (row === 0 &&  col === gridSize-2)) {
                return 'r'
            } else {
                return 'u'
            }
        }
    } else {
        if (col === 0) {
            if (row === gridSize-1) {
                return 'r';
            } else {
                return 'd';
            }
        } else if (row < gridSize-3 && col > 0 && col < gridSize-1) {
            if ((row%2 === 0 && col !== 1) || (row === 0 && col === 1)) {
                return 'l';
            } else if (row%2 != 0) {
                return 'r';
            } else {
                return 'u';
            }
        } else if (row > gridSize-3 && row < gridSize && col > 0) {
            if ((direction === 'r' && row%2 === 0) || (row === gridSize-2 && col === gridSize-1)) {
                return 'u';
            } else if (direction === 'r' && row%2 !== 0) {
                return 'd';
            } else {
                return 'r';
            }
        } else {
            if (row%2 === 0 && col !== 1) {
                return 'l';
            } else {
                return 'u';
            }
        }
    }
}