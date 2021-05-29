let speed = 3;
let word1 = "";
let x1 = 0;
let y1 = 50;
let word2 = "";
let x2 = 0;
let y2 = 50;
let typeWord = "";

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    word1 = getRandomWord();
    word2 = getRandomWord();
    x1 = random(50,width-50);
    x2 = random(50,width-50);
}

function windowResized() {
    setup();
}

function getRandomWord(){
    let words = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy.On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market.";
    return random(words.split(" "));
}

function showWord(w,x,y,color){
    textSize(20);
    fill(color);
    text(w,x,y);
}

function resetWorld(w){
    if (w === 1){
        y1 = 50;
        x1 = random(50,width-50);
        word1 = getRandomWord();
    }else if (w === 2){
        y2 = 50;
        x2 = random(50,width-50);
        word2 = getRandomWord();
    }
}

function draw(){
    background(220);
    showWord(word1,x1,y1,"rgb(0,102,153)");
    showWord(word2,x2,y2,"rgb(0,102,153)");
    showWord(typeWord,width/2,height-100,"rgb(244,123,158)");
    if (y1 < height){
        y1 += speed;
    }else{
        resetWorld(1);
    }
    if (y2 < height){
        y2 += speed;
    }else{
        resetWorld(2);
    }
}

function keyTyped() {
    if (keyCode === BACKSPACE || keyCode === DELETE){
    typeWord=typeWord.slice(0,-1);
    }else{
    typeWord += key
    }
    if (word1 === typeWord) {
        resetWorld(1);
        typeWord = ""
    }
    if (word2 === typeWord) {
        resetWorld(2);
        typeWord = ""
    }    
}