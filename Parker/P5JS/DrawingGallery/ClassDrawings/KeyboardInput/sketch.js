let inputString = ""
var xspeed = 100
var yspeed = 100
var movespeed = 10;
var circlefallingx = Math.floor(Math.random() * width-50);


function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
}

function windowResized() {
    setup();
}
function draw() {
}