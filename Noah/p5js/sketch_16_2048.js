var formation;

function rules() {
    return "Welcome to 2048. \nWhen two equal tiles collide, they combine\n to give you one greater tile that displays their \nsum. The more you do this, obviously, the higher \nthe tiles get and the more crowded the board \nbecomes. Every move you make, if the board \nis not filled, that is, a new tile will spawn in an \nempty space of the board. \n\nYour objective is to reach 2048 before the board \nfills up.\n\nGood Luck!"
}

function setup() {
    createCanvas(windowWidth, windowHeight-50);
    formation = [
        [0,0,0,0],    
        [0,0,0,0],    
        [0,0,0,0],    
        [0,0,0,0]
    ]
    formation = generate(formation)
    formation = generate(formation)
}

function display() {
    fill(0,0,0)
    for (let line = 0; line < formation.length; line++) {
        textSize(20)
        for (let each = 0; each < formation[line].length; each++) {
            text(formation[line][each],width/2-(2*height/7.5)+(each*(height/7.5))+height/15-8,200+(line*(height/7.5))+height/15)
        }
        
    }
}

function generate(list) {
    var array = list;
    var zeroes = 0;
    var randomLine = int(random(0,4));
    var randomNumber = int(random(0,4));
    print(randomLine)
    print(randomNumber)
    let RandomNumberChoices = [2,2,2,4];

    for (line in array) {
        for (each in line) {
            if (each == 0) {
                zeroes += 1;
            }
        }
    }
    // print(zeroes)

    while (array[randomLine][randomNumber] != 0 && zeroes != 0) {
        randomLine = int(random(0,4));
        randomNumber = int(random(0,4));
    }
    // print(randomLine)
    // print(randomNumber)

    array[randomLine][randomNumber] = random(RandomNumberChoices);
    print(array)
    return array
}

function reset() {
    background(90,193,253);
    drawGrids()
    display()
}

function drawGrids() {
    for (let i = 0; i < 4; i++) {
        square(width/2-(2*height/7.5)+(i*(height/7.5)),200,height/8,20)
        for (let j = 0; j < 4; j++) {
            square(width/2-(2*height/7.5)+(i*(height/7.5)),200+(j*(height/7.5)),height/8,20)
        }
    }
}

// function drawGridFills() {
//     let correspondent = {
//         0: [0,0,0],
//         2: [0,20,0],
//         4: [0,40,0],
//         8: [0,60,0],
//         16: [0,80,0],
//         32: [0,100,0],
//         64: [0,120,0],
//         128: [0,140,0],
//         256: [0,160,0],
//         512: [0,180,0],
//         1024: [0,200,0],
//         2048: [0,220,0]
//     }
//     for (let line = 0; line < formation.length; line++) {
//         for (let each = 0; each < formation[line].length; each++) {
//             square
//             text(formation[line][each],width/2-(2*height/7.5)+(each*(height/7.5))+height/15-8,200+(line*(height/7.5))+height/15)
//         }
        
//     }
// }

// formation = generate(formation)
        // } else {
        //     show("The tiles won't move if you move that way! Choose a different way!")
           
function draw() {
    background(90,193,253);
    drawGrids()
    display()
    fill(250,250,250)
    textSize(width/72)
    text(rules(),50,150)
    if (keyIsPressed) {
        if (keyCode == RIGHT_ARROW) {
            if (formation != moveRight(formation)) {
                formation = moveRight(formation)
                print(generate(formation))
                formation = generate(formation)
                reset()
            }
        } else if (keyCode == LEFT_ARROW) {
            if (formation != moveLeft(formation)) {
                formation = moveLeft(formation)
                formation = generate(formation)
                reset()
            }
        } else if (keyCode == UP_ARROW){
            if (formation != moveUp(formation)) {
                formation = moveUp(formation)
                formation = generate(formation)
                reset()
            }
        } else if (keyCode == DOWN_ARROW) {
            if (formation != moveDown(formation)) {
                formation = moveDown(formation)
                formation = generate(formation)
                reset()
            }
        }
    }
}

Array.prototype.swapItems = function(a, b){
    this[a] = this.splice(b, 1, this[a])[0];
    return this;
}

function moveZeroes(list,direction) {
    var array = list
    if (direction == "Right" || direction == "Down") {
        for (let double = 1; double < 3; double++) {
            for (let each = 3; each > 0; each--) {
                for (let position = 3; position > 0; position--) {
                    if (array[position] == 0) {
                        for (let i = 0; i < each+1; i++) {
                            array.swapItems(position, position-1)
                        }
                    }
                }
            }
        }
    } else if (direction == "Left"  || direction == "Up") {
        for (let double = 0; double < 2; double++) {
            for (let each = 0; each < 3; each++) {
               for (let position = 0; position < 3; position++) {
                    if (array[position] == 0) {
                        for (let i = 0; i < (4-each+1); i++) {
                            array.swapItems(position, position+1)          
                        }
                    }         
               }    
            }
        }
    }
    return array 
}

function Combine(list,direction) {
    var array = list
    if (direction == "Right" || direction == "Down") {
        if (array[3] == array[2]) {
            array[3] = array[3] + array[2]
            array[2] = 0
        } else if (array[2] == array[1]) {
            array[2] = array[1] + array[2]
            array[1] = 0
        }
        if (array[1] == array[0]){
            array[1] = array[1] + array[0]
            array[0] = 0
        }
        array = moveZeroes(array,direction)
    } else if (direction == "Left" || direction == "Up") {
        if (array[0] == array[1]){
            array[0] = array[1] + array[0]
            array[1] = 0
        } else if (array[2] == array[1]) {
            array[1] = array[1] + array[2]
            array[2] = 0
        }
        if (array[2] == array[3]){
            array[2] = array[2] + array[3]
            array[3] = 0
        } 
        array = moveZeroes(array,direction)
    }
    return array
}

function moveRight(list) {
    var array = list
    for (let line = 0; line < 4; line++) {
        array[line] = moveZeroes(array[line],"Right")
        array[line] = Combine(array[line],"Right")
    }
    return array
}

function moveLeft(list) {
    var array = list
    for (let line = 0; line < 4; line++) {
        array[line] = moveZeroes(array[line],"Left")
        array[line] = Combine(array[line],"Left")
    }
    return array
}

function moveUp(list) {
    var array = list
    var verticalLines = [[],[],[],[]];
    for (let line = 0; line < 4; line++) {
        for (let each = 0; each < 4; each++) {
            verticalLines[each].push(array[line][each])
        }
    }
    for (let line = 0; line < 4; line++) {
        verticalLines[line] = moveZeroes(verticalLines[line], "Up")        
        verticalLines[line] = Combine(verticalLines[line], "Up")
    }
    for (let each = 0; each < 4; each++) {
        for (let line = 0; line < 4; line++) {
            array[each][line] = verticalLines[line][each]
        }
    }
    return array
} 

function moveDown(list) {
    var array = list
    var verticalLines = [[],[],[],[]];
    for (let line = 0; line < 4; line++) {
        for (let each = 0; each < 4; each++) {
            verticalLines[each].push(array[line][each])
        }
    }
    for (let line = 0; line < 4; line++) {
        verticalLines[line] = moveZeroes(verticalLines[line], "Down")        
        verticalLines[line] = Combine(verticalLines[line], "Down")
    }
    for (let each = 0; each < 4; each++) {
        for (let line = 0; line < 4; line++) {
            array[each][line] = verticalLines[line][each]
        }
        
    }
    return array
}

function windowResized() {
    setup();
}