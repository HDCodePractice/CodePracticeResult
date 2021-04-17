function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(220);
  circle(width/3.333,height/4,width/4);
  // left ear (black)
  fill(30,30,30);
  // fill black
  circle(width*3/1.455,height*3/4,width/4);
  // right ear (black)
  fill(30,30,30);
  // fill black
  circle(width/2,height/1.739,width/16);
  circle(width/2.667,height/2.268,width/8);
  // left big eye (black)
  fill(30,30,30);
  // fill black
  circle(width*3/1.633,height*3/2.268,width/8);
  // right big eye (black)
  fill(30,30,30);
  // fill black
  circle(width*3/1.633,height*3/2.286,width/26.667);
  // right tiny eye (black)
  fill(30,30,30);
  // fill black
  circle(width/2.667,height/2.286,width/26.667);
  // left tiny eye (black)
  fill(30,30,30);
  // fill black
  circle(width/2,height/2,width/2);
  // face (white)
  fill(250,250,250);
  // fill white
  circle(width/2.667,height/2.286,width/16);
  // left small eye (white)
  fill(250,250,250);
  // fill white
  circle(width/1.633,height/2.286,width/16);
  // right small eye (white)
  fill(250,250,250);
  // fill white
}
