let word = ""
let typeWord = ""

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    word = getRandomWord();
}

function windowResized() {
    setup();
}


function getRandomWord(){
    let words = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy.On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
    return random(words.split(" "));
}


function draw(){
    background(220);
    textSize(20);
    text(word,100,100);
    textSize(20);
    text(typeWord,100,200);
}

function keyTyped() {
    typeWord += key;
}