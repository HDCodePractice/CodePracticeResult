function setup() {
  createCanvas(500, 400);  
}

function draw() {
  fill("lightgrey");
  triangle(160, 45, 200, 65, 175, 95);
  triangle(280, 45, 240, 65, 265, 95);
  ellipse(220, 110, 100, 100);
  line(180, 120, 140, 120);
  line(190, 130, 150, 140);
  line(260, 120, 300, 120);
  line(250, 130, 290, 140);
  fill("black");
  triangle(210, 120, 230, 120, 220, 130);
  ellipse(200, 100, 10, 10);
  ellipse(240, 100, 10, 10);
}