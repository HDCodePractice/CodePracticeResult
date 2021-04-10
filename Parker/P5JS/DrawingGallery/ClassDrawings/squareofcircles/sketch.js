function setup() {
  createCanvas(500, 500);
}

function draw() {
  background(220)
  for (let i = 1; i < 6; i++){
    circle(50*i,50,30)
  }
  for (let i = 50; i < 250; i+=50){
    circle(50,i,30)
  }
  for (let i = 1; i < 6; i++){
    circle(50*i,250,30)
  }
  for (let i = 50; i < 300; i+=50){
    circle(250,i,30)
  }
}