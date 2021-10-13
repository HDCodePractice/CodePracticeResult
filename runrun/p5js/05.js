let word1 = ""
let word2 = ""
let word3 = ""
let typeWord = ""
let x1 = 0
let y1 =0
let x2 = 0
let y2 =0
let x3 = 0
let y3 =0
speed = 2
function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    word1 = getRandomWord();
    x1 = random(50,width-50);
    y1 = 50;
    word2 = getRandomWord();
    x2 = random(50,width-50);
    y2 = 50;
    word3 = getRandomWord();
    x3 = random(50,width-50);
    y3 = 50;
}
function windowResized() {
    setup();
}
function showWord(w,x,y) {
    textSize(20);
    text(w,x,y);
}
function getRandomWord(){
    let word = 　"Consider… YOU. In all time before now and in all time to come, there has never been and will never be anyone just like you. You are unique in the entire history and future of the universe. Wow! Stop and think about that. Youre better than one in a million, or a billion, or a gazillion… You are the only one like you in a sea of infinity!"
    return random(word.split(" "));
}
function draw() {
background(220)
showWord(word1,x1,y1);
showWord(word2,x2,y2);
showWord(word3,x3,y3);
showWord(typeWord,100,200);
if (y1< height) {
   y1 += speed; 
   
}else{
    y1 = 50;
    x1 = random(50,width-50)
    word1 = getRandomWord();
    if (y1 < height){
        y1 += speed;
    }else{
        resetWorld(1);
    }
    
}
if (y2< height) {
    y2 += speed; 
    
 }else{
     y2 = 50;
     x2 = random(50,width-50)
     word2 = getRandomWord();
     if (y2 < height){
        y2 += speed;
    }else{
        resetWorld(2);
    } 
 }
 if (y3< height) {
    y3 += speed; 
    
 }else{
     y3 = 50;
     x3 = random(50,width-50)
     word3 = getRandomWord();
     if (y3 < height){
        y3 += speed;
    }else{
        resetWorld(3);
    } 
 }
}
function resetWord(w){
    if (w===1) {
        y1 = 50;
        x1 = random(50,width-50) 
    }
    if (w===2) {
        y2 = 50;
        x2 = random(50,width-50) 
    }
    if (w===3) {
        y3 = 50;
        x3 = random(50,width-50) 
    }
}
function keyTyped() {
    if (keyCode === BACKSPACE || keyCode === DELETE){
    typeWord=typeWord.slice(0,-1);
    }else{
    typeWord += key
    }
    if (word1 === typeWord) {
        resetWord(1);
        typeWord = ""
    }
    if (word2 === typeWord) {
        resetWord(2);
        typeWord = ""
    }
    if (word3 === typeWord) {
        resetWord(3);
        typeWord = ""
    }
}
