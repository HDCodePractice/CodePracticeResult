let wordselection = "When will life return to normal? While the best vaccines are thought to be 95% effective, it takes a coordinated campaign to stop a pandemic. Anthony Fauci, the top infectious-disease official in the U.S., has said that vaccinating 70% to 85% of the U.S. population would enable a return to normalcy.On a global scale, that’s a daunting level of vaccination. At the current pace of 26.8 million a day, it would take another year to achieve a high level of global immunity. The rate, however, is steadily increasing, and new vaccines by additional manufacturers are coming to market."
let vs = [];
let typeWord = ''
let hp = 100
let score = 0
let alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

class Word{
  constructor(w,x,y,color){
      this.w = w;
      this.x = x;
      this.y = y;
      this.color = color;
  }
  display(){
      fill(this.color);
      text(this.w,this.x,this.y);
  }
}

function getRandomWord(){
  return random(wordselection.split(" "));
}

function setup() {
  createCanvas(windowWidth,windowHeight-60);
  background(220);
  for (let index = 0; index < 3; index++) {
      word = new Word(getRandomWord(),random(50,width-50),100,"rgb(0,0,0)");
      vs.push(word);
  }
}

function showWord(w,x,y,xsize,ysize){
  textSize(20);
  text(w,x,y,xsize,ysize);
} 

function windowResized() {
    setup();
}

function draw(){
  background(220);
  for (let index = 0; index < vs.length; index++) {
      vs[index].display();
      if (vs[index].y>height){
          hp -= vs[index].w.length
          vs[index].w = getRandomWord();
          vs[index].y = 50;
          vs[index].x = random(50,width-50);
          typeWord = "";
      }else{
          vs[index].y += 3;
      }
  }

  for (let index = 0; index < vs.length; index++) {
    if (typeWord === vs[index].w){
      score += vs[index].w.length
      vs[index].w = getRandomWord();
      vs[index].y = 50;
      vs[index].x = random(50,width-50);
      typeWord = "";
    }
  }

  showWord(typeWord,width/2,height-100,1000,1000)
  showWord("Your HP:" + hp,100,100,1000,1000)
  showWord("Your Score:" + score,100,200,1000,1000)
}

function keyTyped() {
    if (key === ' '){
      return
    }
    if (keyCode === BACKSPACE || keyCode === DELETE){
      typeWord=typeWord.slice(0,-1);
    } else if (keyCode === ENTER){
      typeWord = ''
    } else{
      typeWord += key
    }
  }