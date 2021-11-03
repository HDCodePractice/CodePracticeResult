function setup() {
  createCanvas(600, 600);
  frameRate(1)
}

function draw() {
  background(220);
  let rocketX = 200
  let rocketY = 200
  let rocketSize = 200
  fill(255,255,255)
  rect(rocketX,rocketY-rocketSize/2,rocketX-rocketSize/4,rocketX+rocketSize/4);
  fill(255,0,0);
  triangle(rocketX,rocketX-rocketSize/2,275,0,350,100);
  fill(0,255,255);
  circle(rocketX+3*rocketSize/8,rocketY-rocketSize/4,rocketSize);
  circle(275,230,60);
  circle(275,310,60);
  fill(0,0,255);
  triangle(200,150,100,400,200,300);
  triangle(350,150,450,400,350,300);
  fill(255,160,0);
  ellipse(225,450,40,200);
  ellipse(280,450,40,200);
  ellipse(335,450,40,200);
  fill(255,255,0);
  ellipse(225,410,40,125);
  ellipse(280,410,40,125);
  ellipse(335,410,40,125);
  fill(255,0,0);
  ellipse(225,383,40,70);
  ellipse(280,383,40,70);
  ellipse(335,383,40,70);
  fill(0,0,0);
  rect(315,345,40,30);
  rect(260,345,40,30);
  rect(200,345,45,30);
  fill(0,0,0)
  triangle(200,345,200,375,193,375)
  triangle(260,345,260,375,253,375)
  triangle(315,345,315,375,309,375)
  triangle(245,345,245,375,253,375)
  triangle(300,345,300,375,309,375)
  triangle(355,345,355,375,363,375)

  


}
