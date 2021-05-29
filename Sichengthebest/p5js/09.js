let ys = [50,100,150,200,250,300,350,400,450];
let speeds = [3,3,6,3,3,3,3];

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
}

function windowResized() {
    setup();
}

function draw(){
    background(220);
    for (let index = 0; index < ys.length; index++) {
        let x = (index + 1) * 50;
        circle(x,ys[index],30);
        if (ys[index] >= height) {
            ys[index] = -15
        } else {
            ys[index] += speeds[index];
        }
    }
}