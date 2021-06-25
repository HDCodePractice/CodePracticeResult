let speed = 3;
let words = [];
let wordsx = [];
let wordsy = [];
let wordsCount = 5;
let typeWord = "";

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    for (let index = 0; index < wordsCount; index++) {
        words.push(getRandomWord())
        wordsx.push(random(50,width-50));
        wordsy.push(50);
    }
}

function windowResized() {
    setup();
}

function getRandomWord(){
    let ws = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy.On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market.";
    return random(ws.split(" "));
}

function showWord(index,color){
    textSize(20);
    fill(color);
    text(words[index],wordsx[index],wordsy[index]);
}

function resetWorld(index){
    words[index] = getRandomWord();
    wordsx[index] = random(50,width-50);
    wordsy[index] = 50;
}

function draw(){
    background(220);
    for (let index = 0; index < wordsCount; index++) {
        showWord(index,"rgb(0,102,153)")
        if (wordsy[index] < height){
            wordsy[index] += speed;
        }else{
            aSound.play();
            resetWorld(index);
        }
    }
    textSize(20);
    fill("rgb(244,123,158)");
    text(typeWord,width/2,height-100);
}

function keyTyped() {
    if (key !== " "){
        if (keyCode === BACKSPACE || keyCode === DELETE){
            typeWord=typeWord.slice(0,-1);
        }else{
            typeWord += key
        }
        for (let index = 0; index < wordsCount; index++) {
            if (typeWord === words[index]){
                resetWorld(index);
                typeWord = "";
            }
        }
    }
}