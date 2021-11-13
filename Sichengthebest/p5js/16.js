const cellSize = 20;
const gridSize = 15;
const scoreHeight = 150;
const inputWidth = 550;
const resetHeight = 40;

let grid = [];
let apple = [];
let completed = false;
let appleCount = 10;
let speed = 7;
let hpMax = 100;
let turnMax = 0;

let human = {
    name: 'Sichengthebest',
    snake: [],
    direction: '',
    turn: 0,
    score: 0,
    hp: hpMax,
    gameOver: false,
    deathMessage: '',
    color: [0],
    ai: 'human'
}
let ai = {
    name: 'Sichengtheworse',
    snake: [],
    direction: '',
    turn: 0,
    score: 0,
    hp: hpMax,
    gameOver: false,
    deathMessage: '',
    color: [255,0,0],
    ai: 'sicheng'
}
let ai2 = {
    name: 'Sichengthebad',
    snake: [],
    direction: '',
    turn: 0,
    score: 0,
    hp: hpMax,
    gameOver: false,
    deathMessage: '',
    color: [0,255,0],
    ai: 'sicheng'
}
let ai3 = {
    name: 'Parker (aka terrible)',
    snake: [],
    direction: '',
    turn: 0,
    score: 0,
    hp: hpMax,
    gameOver: false,
    deathMessage: '',
    color: [255,255,0],
    ai: 'sicheng'
}
let ai4 = {
    name: 'Other Sichengthebad',
    snake: [],
    direction: '',
    turn: 0,
    score: 0,
    hp: hpMax,
    gameOver: false,
    deathMessage: '',
    color: [0,255,255],
    ai: 'sicheng'
}
let ai5 = {
    name: 'Other other Sichengthebad',
    snake: [],
    direction: '',
    turn: 0,
    score: 0,
    hp: hpMax,
    gameOver: false,
    deathMessage: '',
    color: [255,0,255],
    ai: 'sicheng'
}

let members = [human,ai,ai2,ai3,ai4,ai5]
let memberslist = [human,ai,ai2,ai3,ai4,ai5]

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
    button.mousePressed(newGame);
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
    let inp5 = createColorPicker(members[0].color);
    inp5.position(gridSize*cellSize+150,140);  
    inp5.input(myInputEvent5);
    let inp6 = createColorPicker(members[1].color);
    inp6.position(gridSize*cellSize+150,190);  
    inp6.input(myInputEvent6);
    let inp7 = createColorPicker(members[2].color);
    inp7.position(gridSize*cellSize+150,240);  
    inp7.input(myInputEvent7);
    let inp8 = createColorPicker(members[3].color);
    inp8.position(gridSize*cellSize+150,290);  
    inp8.input(myInputEvent8);
    let inp9 = createColorPicker(members[4].color);
    inp9.position(gridSize*cellSize+150,340);  
    inp9.input(myInputEvent9);
    let inp10 = createColorPicker(members[5].color);
    inp10.position(gridSize*cellSize+150,390);
    inp10.input(myInputEvent10);
    memberSelect = []
    for (let index = 0; index < 6; index++) {
        let sel = createSelect();
        sel.position(gridSize*cellSize+370, 100+50*(index+1));
        if (index == 0){
            sel.option("human");
        }
        sel.option("sicheng");
        sel.option("sicheng-goaround");
        sel.option('parker')
        sel.changed(memberSelectEvent);
        memberSelect.push(sel);
    }
    // let inp11 = createSelect(members[1].ai);
    // inp11.position(gridSize*cellSize+370,200);
    // inp11.option('sicheng')
    // inp11.option('sicheng-goaround')
    // inp11.option('parker')
    // inp11.changed(myInputEvent11)
    // let inp12 = createSelect(members[2].ai);
    // inp12.position(gridSize*cellSize+370,250);
    // inp12.option('sicheng')
    // inp12.option('sicheng-goaround')
    // inp12.option('parker')
    // inp12.changed(myInputEvent12)
    // let inp13 = createSelect(members[3].ai);
    // inp13.position(gridSize*cellSize+370,300);
    // inp13.option('sicheng')
    // inp13.option('sicheng-goaround')
    // inp13.option('parker')
    // inp13.changed(myInputEvent13)
    // let inp14 = createSelect(members[4].ai);
    // inp14.position(gridSize*cellSize+370,350);
    // inp14.option('sicheng')
    // inp14.option('sicheng-goaround')
    // inp14.option('parker')
    // inp14.changed(myInputEvent14)
    // let inp15 = createSelect(members[5].ai);
    // inp15.position(gridSize*cellSize+370,400);
    // inp15.option('sicheng')
    // inp15.option('sicheng-goaround')
    // inp15.option('parker')
    // inp15.changed(myInputEvent15)
    // let inp16 = createSelect(members[0].ai);
    // inp16.position(gridSize*cellSize+370,150);
    // inp16.option('human')
    // inp16.option('sicheng')
    // inp16.option('sicheng-goaround')
    // inp16.option('parker')
    // inp16.changed(myInputEvent16)
    let checkbox = createCheckbox('',true);
    let checkbox2 = createCheckbox('',true);
    let checkbox3 = createCheckbox('',true);
    let checkbox4 = createCheckbox('',true);
    let checkbox5 = createCheckbox('',true);
    checkbox.position(gridSize*cellSize+330,190);
    checkbox2.position(gridSize*cellSize+330,240);
    checkbox3.position(gridSize*cellSize+330,290);
    checkbox4.position(gridSize*cellSize+330,340);
    checkbox5.position(gridSize*cellSize+330,390);
    checkbox.changed(myCheckedEvent);
    checkbox2.changed(myCheckedEvent2);
    checkbox3.changed(myCheckedEvent3);
    checkbox4.changed(myCheckedEvent4);
    checkbox5.changed(myCheckedEvent5);
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

function myInputEvent5() {
    members[0].color = this.value()
}
function myInputEvent6() {
    members[1].color = this.value()
}
function myInputEvent7() {
    members[2].color = this.value()
}
function myInputEvent8() {
    members[3].color = this.value()
}
function myInputEvent9() {
    members[4].color = this.value()
}
function myInputEvent10() {
    members[5].color = this.value()
}
function memberSelectEvent() {
    for (let index = 0; index < memberSelect.length; index++) {
        members[index].ai = memberSelect[index].value();
    }
}

function myCheckedEvent() {
    if (this.checked()) {
        members.push(memberslist[1])
    } else {
        members.splice(members.indexOf(memberslist[1]),1)
    }
}
function myCheckedEvent2() {
    if (this.checked()) {
        members.push(memberslist[2])
    } else {
        members.splice(members.indexOf(memberslist[2]),1)
    }
}
function myCheckedEvent3() {
    if (this.checked()) {
        members.push(memberslist[3])
    } else {
        members.splice(members.indexOf(memberslist[3]),1)
    }
}
function myCheckedEvent4() {
    if (this.checked()) {
        members.push(memberslist[4])
    } else {
        members.splice(members.indexOf(memberslist[4]),1)
    }
}
function myCheckedEvent5() {
    if (this.checked()) {
        members.push(memberslist[5])
    } else {
        members.splice(members.indexOf(memberslist[5]),1)
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
        member.direction = '';
        member.deathMessage = '';
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
    textSize(15);
    text1 = ''
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        const member = members[memberIndex]
        text1 += `${member.name}'s score: ${member.score}\n`
    }
    text1 += 'To start game, press any arrow key (except the left).'
    text(text1,10,25);
    textSize(15);
    text('Number of apples:',gridSize*cellSize+10,cellSize * gridSize/2-40);
    text('Speed:',gridSize*cellSize+10,cellSize * gridSize/2+10);
    text('Maximum HP:',gridSize*cellSize+10,cellSize * gridSize/2+60);
    text('Maximum number of turns:',gridSize*cellSize+10,cellSize * gridSize/2+230);
    textSize(10)
    text('Which AI code should this AI use?',gridSize*cellSize+370,150)
    text('Which AI code should this AI use?',gridSize*cellSize+370,200)
    text('Which AI code should this AI use?',gridSize*cellSize+370,250)
    text('Which AI code should this AI use?',gridSize*cellSize+370,300)
    text('Which AI code should this AI use?',gridSize*cellSize+370,350)
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
                        fill(member.color)
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
    if (members[0].direction != '' || members[0].ai != 'human') {
        for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
            if (members[memberIndex].ai == 'sicheng') {
                members[memberIndex].direction = sicheng_getDirection(gridSize,members,memberIndex,apple,members[memberIndex].direction)
            } else if (members[memberIndex].ai == 'sicheng-goaround') {
                members[memberIndex].direction = sicheng2_getDirection(gridSize,members,memberIndex,apple,members[memberIndex].direction)
            } else if (members[memberIndex].ai == 'parker') {
                members[memberIndex].direction = parker_getDirection(gridSize,members,memberIndex,apple,members[memberIndex].direction)
            } else if (members[memberIndex].ai == 'human') {

            } else {
                members[memberIndex].direction = sicheng2_getDirection(gridSize,members,memberIndex,apple,members[memberIndex].direction)
            }
        }
    }
    if (member.gameOver != true) {
        if (member.direction != '') {
            member.turn += 1;
            member.hp -= 1;
        }
        if (member.direction === "r"){
            if (member.snake[0] % gridSize === gridSize - 1){
                member.deathMessage = 'Collided with wall'
                member.hp = 0
                member.gameOver = true;
            }else{
                if (!checkOnApple(member)) {
                    member.snake.splice(member.snake.length-1, 1)
                }
                member.snake.splice(0,0,member.snake[0]+1)
            }
        }else if (member.direction === "u"){
            if (member.snake[0] < gridSize){
                member.deathMessage = 'Collided with wall'
                member.hp = 0
                member.gameOver = true;
            }else{
                if (!checkOnApple(member)) {
                    member.snake.splice(member.snake.length-1, 1)
                }
                member.snake.splice(0,0,member.snake[0]-gridSize);
            }
        }else if (member.direction === "d"){
            if (member.snake[0] >= gridSize * (gridSize-1)){
                member.deathMessage = 'Collided with wall'
                member.hp = 0
                member.gameOver = true;
            }else{
                if (!checkOnApple(member)) {
                    member.snake.splice(member.snake.length-1, 1)
                }
                member.snake.splice(0,0,member.snake[0]+gridSize);
            }
        }else if (member.direction === "l"){
            if (member.snake[0] % gridSize === 0){
                member.deathMessage = 'Collided with wall'
                member.hp = 0
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
                member.deathMessage = 'Collided with own self'
                member.hp = 0
                member.gameOver = true;
            }
        }
        if (member.turn > turnMax && turnMax !== 0) {
            member.deathMessage = 'Ran out of turns'
            member.hp = 0
            member.gameOver = true;
        }
        for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
            const member2 = members[memberIndex];
            for (let s = 0; s < member2.snake.length; s++) {
                if (member2 != member) {
                    if (member.snake[0] == member2.snake[0]) {
                        member.deathMessage = 'Collided with another snake'
                        member2.deathMessage = 'Collided with another snake'
                        member.hp = 0
                        member2.hp = 0
                        member.gameOver = true;
                        member2.gameOver = true;
                    } else if (member.snake[0] == member2.snake[s]) {
                        member.deathMessage = 'Collided with another snake'
                        member.hp = 0
                        member.gameOver = true;
                    }
                }
            }
        }
        if (member.hp < 1 && member.deathMessage == '') {
            member.deathMessage = 'Starved to death'
            member.gameOver = true;
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
    background(220);
    drawScore();
    drawGrid();
    drawHp();
    drawTurn();
    if (checkIfGameOver()) {
        drawGameOver();
    } else {
        for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
            const member = members[memberIndex];
            if (member.gameOver == true) {
                member.snake = []
            }
            updateSnake(member);
        }
    }
}

function checkIfGameOver() {
    gameovers = []
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        const member = members[memberIndex];
        gameovers.push(member.gameOver);
    }
    if (gameovers.includes(false)) {
        return false;
    }
    return true;
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
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        const member = members[memberIndex]
        rectLength = int(member.hp*100/hpMax);
        originalLength = 106;
        if (rectLength > 100) {
            rectLength = 100;
        }
        fill(0, 220, 0);
        text(`${member.name}'s HP: ${member.hp}`,gridSize*cellSize+210,80+50*memberIndex);
        stroke(0);
        strokeWeight(6);
        fill(220);
        rect(gridSize*cellSize+210,-45+133+50*memberIndex,originalLength,26)
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
        rect(gridSize*cellSize+213,-45+136+50*memberIndex,rectLength,20)
        textSize(8)
        text(member.deathMessage,gridSize*cellSize+213,-45+153+50*memberIndex)
        textSize(15)
        stroke(0);
        strokeWeight(2);
    }
}

function drawTurn() {
    fill(0, 220, 0);
    textSize(10);
    text1 = ''
    for (let memberIndex = 0; memberIndex < members.length; memberIndex++) {
        const member = members[memberIndex]
        text1 += `\n${member.name}'s turn: ${member.turn}`
    }
    text(text1,gridSize*cellSize+10,gridSize*cellSize/2+260);
}

function keyPressed() {
    if (members[0].ai == 'human') {
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
}