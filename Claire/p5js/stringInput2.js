let randomWordSpeed = 1;
let words = [];
let wordsX = [] ;
let wordsY = [];
var wordsCount = 3;
var typeWord = "";
var score = 0;
var playerHealth = 20;
let shortWord = "When Off Of If The a Let We He She They All Best And Are To Be It Take Stop In Live Life Sure Love Hate Rig RIP Hair Eye Nose Foot Feet Cheese Mom Dad Like Light Save Ore Pig Cow Sheep Mini Got Get Run Ruin My His Her Night Day Date Can Camra Back Ground Physic Egg Drag Lose Lost Lot Type Bot God Set Be Lion Food Water Cloud Tree Sat Baby Boy Girl Key Board Code Pen Pencil Sharp Fish Rod Spawn Paint Wire If Else For Loop Swift Will Would Year Mounth Mouth Time Flow Fly Bird Plane Rate Fate Ever How Stand Cream Ice No Not None Nope Yep Yeah Yes Know Known Charge Chat Cat Dog Team Soft Office Come Came Market Person What Where When Why Who How Page Share Space Plant Apple Grape Grade Room Word World Rap Null Moose Test Contest Clone Death Die Dead Java Port Table Tap Tie Talk Think Blade Crime Nut Now Net Sleep Bee But Stinky Never One Two Three Four Five Six Seven Eight Nine Ten Twelve Right Left Middle Might Mad Amount Qeen King Print Paper ";
let longWord = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy.On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve high level global immunity however steadily increasing vaccines additional manufacturers coming market";
let punctuations = "";
let numbers = "";

class Word{
    constructor(word, type){
        this.word = word;
        this.type = type;
        this.reset();
    }
    reset(){
        this.xNormal = random(50, width-50);
        this.yNormal = -50;
        this.xSuper = -50;
        this.ySuper = random(50, height-50);
        this.colorNormal = 'rgb(0,0,0)'
        this.colorSuper = this.randomColor();
        if (this.type === 'super'){
            this.displaySuper();
        } else if (this.type === 'normal'){
            this.displayNormal();
        }
    }
    displaySuper(){
        fill(this.colorSuper);
        text(this.word, this.xSuper, this.ySuper);
    }
    displayNormal(){
        fill(this.colorNormal);
        text(this.word, this.xNormal, this.yNormal);
    }
    randomColor(){
        this.color = random(['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)'])
    }
}

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(156,220,254);
    for (let index = 0; index < wordsCount; index++) {
        words.push(getRandomWord());
        wordsX.push(random(50,width-50));
        wordsY.push(50);
        word = new Word (getRandomWord(), 'normal')
    }
}

function windowResized() {
    setup();
}

function getRandomWord(Thesaurus){
    let paragraph = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy.On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market.";
    return random(paragraph.split(" "));
}

function showWord(selection,color,size){
    textSize(size);
    fill(color);
    text(words[selection],wordsX[selection],wordsY[selection]);
}

function resetWorld(selection){
    words[selection] = getRandomWord();
    wordsX[selection] = random(50,width-50);
    wordsY[selection] = 50;
}

function draw(){
    background(156,220,254);
    fill(220,0,0)
    text(typeWord,100,100);
    fill(240,200,89)
    text("Your Score: " + score, width/20, height/13);
    fill(255,0,0);
    text("Your Health: " + playerHealth, width/20, height/6)
    for (let i = 0; i < wordsCount; i ++){
        showWord(i, 'rgb(255,0,0)', 20);
        if (wordsY[i] < height){
            wordsY[i] += randomWordSpeed;
        } else {
            resetWorld(i);
            score -= 1;
            playerHealth -= 1;
        }
    }
    if (score === 10){
        wordscCount += 6;
    } else {
        return;
    }
    if (playerHealth === 0){
        textSize(120);
        background(0,0,0)
        showWord("you lose, please refresh to restart :(", width/7,height/1.8,'rgb(255,0,0)')
        textSize(60)
        showWord("OH NO!!!",width/2.5,height/2,'rgb(255,0,0)')
    }
}

function keyPressed() {
    if (key !== " "){
        if (keyCode === BACKSPACE || keyCode === DELETE){
            typeWord=typeWord.slice(0,-1);
        }else{
            typeWord += key
        } 
    }
    if (key = 1){
        let paragraph = ", . ! [ ]"
    }
    for (let index = 0; index < wordsCount; index++) {
        if (typeWord == words[index]){
          resetWorld(index);
          typeWord = "";
        }
    }  
}
