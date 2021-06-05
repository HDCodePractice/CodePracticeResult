let wordSpeed = 2;
let word1 = "";
let word1X = 0;
let word1Y = 50;
let word2X = "";
let word2Y = 50;
let word2 = "";
let word3 = "";
let word3X = "";
let word3Y = "";
let inputWord = "";
var score = 1;
var wordBeenTyped = 0;

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    word1 = getRandomWord();
    word2 = getRandomWord();
    word3 = getRandomWord();
    word1X = random(50,width-50);
    word1Y = 50;
}

function windowResized() {
    setup();
}

function getRandomWord(){
    let paragraph = "Hypertension Intravenous Malignant Outpatient Epidermis Chronis Contusion Accumulation Decomposition Electrocardiogram Physician Maintaining Cardiopulmonary Resuscitation Abbreviations Acronyms Lipoprotein Cholesterol";
    return random(paragraph.split(" "));
}

function showWord(w,x,y,color){
    textSize(20);
    fill(color);
    text(w,x,y);
}

function resetWorld(word){
    if (word === 1){
        word1Y = 50;
        word1X = random(50,width-100);
        word1 = getRandomWord();
    }
    if (word === 2){
        word2Y = 50;
        word2X = random(50,width-100);
        word2 = getRandomWord();
    }
    if (word === 3){
        word3Y = 50;
        word3X = random(50,width-100);
        word3 = getRandomWord();
    }

}

function draw(){
    background(96,199,209);
    fill(255,255,255)
    strokeWeight(3)
    rect(width/1.75,height/1.5,-200,50)
    text("Your Score: " + score, width/20,height/13);
    showWord(word1,word1X,word1Y,"rgb(0,102,153)");
    showWord(word2,word2X,word2Y,"rgb(0,102,153)");
    showWord(word3,word3X,word3Y,"rgb(0,102,153)");
    showWord(inputWord,width/2.4,height/1.4,"rgb(244,123,158)");
    if (word1Y < height){
        word1Y += wordSpeed;
    } else {
        resetWorld(1);
        score -= 1;
        wordSpeed -= 0.5;
    }
    if (word2Y < height){
        word2Y += wordSpeed;
    } else {
        resetWorld(2);
        score -= 1;
    }
    if (word3Y < height){
        word3Y += wordSpeed;
    } else {
        resetWorld(3);
        score -= 1;
    }
    if (wordSpeed === 0){
        textSize(120);
        background(0,0,0)
        showWord("you lose, please refresh to start from start :(", width/7,height/1.8,'rgb(255,0,0)')
        textSize(60)
        showWord("OH NO!!!",width/2.5,height/2,'rgb(255,0,0)')
    }
}

function keyTyped() {
    if (keyCode === BACKSPACE || keyCode === DELETE){
        inputWord = inputWord.slice(0,-1);
    } else {
        inputWord += key
    }
    if (word1 === inputWord) {
        resetWorld(1);
        inputWord = ""
        score += 1;
        wordSpeed += 0.5;
    }
    if (word2 === inputWord) {
        resetWorld(2);
        inputWord = ""
        score += 1;
        wordSpeed += 0.5;
    }
    if (word3 === inputWord) {
        resetWorld(3);
        inputWord = ""
        score += 1;
        wordSpeed += 0.5;
    }
}