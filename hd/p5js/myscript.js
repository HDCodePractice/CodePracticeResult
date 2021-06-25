let words = [];

class Word{
    constructor(word){
        this.word = word;
        this.reset();
    }
    reset(){
        this.x = random(50,width-50);
        this.y = 50;
        this.randomColor();
    }
    display(){
        fill(this.color);
        text(this.word,this.x,this.y);
    }
    randomColor(){
        this.color = random(["rgb(255,255,0)","rgb(255,0,255)","rgb(0,255,255)"])
    }
}

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    for (let index = 0; index < 6; index++) {
        word = new Word('hello');
        words.push(word);
    }
}

function windowResized() {
    setup();
}

function draw(){
    background(220);
    for (let index = 0; index < words.length; index++) {
        words[index].display();
        if (words[index].y>height){
            words[index].reset();
        }else{
            words[index].y += 5;
        }
    }
}
