let inconsolata;
function preload() {
  inconsolata = loadFont('assets/inconsolata.otf');
}
function setup() {
  createCanvas(100, 100, WEBGL);
  textFont(inconsolata);
  textSize(width / 3);
  textAlign(CENTER, CENTER);
}
function draw() {
  background(0);
  let time = millis();
  rotateX(time / 1000);
  rotateZ(time / 1234);
  text('p5.js', 0, 0);
}
