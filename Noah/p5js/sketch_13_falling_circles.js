var ys = [];
let num;

function setup() {
    createCanvas(500,500);
    background(50);
    num = random(5,10);
}

function windowResized() {
    setup();
}

function draw(){
    background(50);
    for (let i = 0; i < num; i++) {
        ys.push(random(50,450));
    }
    for (let index = 0; index < ys.length; index++) {
        let x = (index + 1) * (450/num);
        circle(x,ys[index],30);
        if (ys[index] > height+30) {
            ys[index] = 0;
        } else {
            if (index == 2) {
                ys[index] += 10;
            } else {
                ys[index] += 5;
            }
        }            
    }
}