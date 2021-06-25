let speed = 3;
let words = [];
let wordselection = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy.On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
let wordsx = [] ;
let wordsy = [];
let wordsCount = 10;
let typeWord = ""
let HP = 100
let score = 0
let luck = 0
let luckywordx = 0
let cursornumid = 0
let luckyword = ""
let hasluckyword = false
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
    return random(wordselection.split(" "));
}
function bonusworddecide(){
    luck = Math.floor(Math.random() * 101); 
    if (luck === 1){
     let words = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy. On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
      luckyword = random(words.split(" "));
      hasluckyword = true
    }
  }
function showWord(w,x,y){
    textSize(20); 
    text(w,x,y);
}

function resetWorld(w){
    wordsy[w] = 50;
    wordsx[w] = random(50,width-50);
    words[w] = getRandomWord();
}

function draw(){
    background(220);
    showWord("Your Score: " + score,width/10,50);
    showWord("HP: " + HP,width/10,100);
    if(HP<=0){
        background(0)
        textSize(50)
        fill(255,255,255)
        text("Game Over",width/2,height/2)
        fill(0,0,0)
    }
    for (let index = 0; index < wordsCount; index++) {
      showWord(words[index],wordsx[index],wordsy[index])
      wordsy[index] += speed;
      if (wordsy[index] >= height){
        resetWorld(index);
        HP -= wordselection.length/500
      }
    }
    if (hasluckyword === true){
        luckywordx += speed;
        fill(255,0,0);
        showWord(luckyword,luckywordx,height/2);
      }if (luckywordx >= width){
          hasluckyword = false;
          luckyword = '';
          bonusworddecide();
        }
      
      fill(0,0,0)
      textSize(20);
      if (cursornumid=30){
        showWord(typeWord + "|",width/2,height-60);
      } else {
        showWord(typeWord,width/2,height-60);
        cursornumid += 1;
      }
  }

function keyTyped() {
    if (keyCode === BACKSPACE || keyCode === DELETE){
      typeWord=typeWord.slice(0,-1);
    }else if(key === " "){
      typeWord=typeWord.slice(0,-1);
    }else{
      typeWord += key
    }
    
    for (let index = 0; index < wordsCount; index++) {
      if (typeWord == words[index]){
        resetWorld(index);
        typeWord = "";
        score += 1
      }
    }
  }