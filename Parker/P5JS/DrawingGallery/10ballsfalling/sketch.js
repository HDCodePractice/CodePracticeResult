let vs = [];

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
    randomColor(){
        this.color = random(["rgb(255,0,0)","rgb(0,255,0)","rgb(0,0,255)"])
    }
}

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    for (let index = 0; index < 5; index++) {
        word = new Word('hello',random(50,width-50),100,"rgb(255,0,0)");
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
            vs[index].randomColor();
            vs[index].y = 50;
            vs[index].x = random(50,width-50);
        }else{
            vs[index].y += 5;
        }
    }
}