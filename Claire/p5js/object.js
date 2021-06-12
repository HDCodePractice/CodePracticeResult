let vs = [];

class Word{
    constructor(w){
        this.w = w;
        this.reset();
    }
    reset(){
        this.x = random(50,width-50);
        this.y = -50;
        this.color = randomColor();
    }
    display(){
        fill(this.color)
        text(this.w,this.x,this.y);
    }
    randomColor(){
        this.color = random(["rgb(255,0,0","rgb(0,255,0)","rgb(0,0,255)"])
    }
}

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    for (let index = 0; index < 5; index++) {
        word = new Word("hello",random(50,width-50),100,"rgb(255,20,0)");
        vs.push(word);
    }

}

function windowResized() {
    setup();
}

function draw(){
    background(220);
    for (let index = 0; index < vs.length; index++) {
        vs[index].display();
        if (vs[index].y>height){
            vs[index].reset()
        }else{
            vs[index].y += 5;
        }
    }
}