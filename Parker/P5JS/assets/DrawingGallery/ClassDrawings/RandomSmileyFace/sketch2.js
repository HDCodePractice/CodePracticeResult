// function setup() {
//   createCanvas(windowWidth, windowHeight);
// }

function getRandomNumber(min, max) {
  return Math.random() * (max - min) + min;
}

// function draw() {
  
//   happyFace(getRandomNumber(width/4,width/3), getRandomNumber(height/4,height/3), windowWidth/2);
//   delay(100);
//   happyFace(getRandomNumber(width/4,width/3), getRandomNumber(height/4,height/3), windowWidth/2);
//   delay(100);
//   happyFace(getRandomNumber(width/4,width/3), getRandomNumber(height/4,height/3), windowWidth/2);
//   delay(100);
//   happyFace(getRandomNumber(width/4,width/3), getRandomNumber(height/4,height/3), windowWidth/2);
//   delay(100);
//   happyFace(getRandomNumber(width/4,width/3), getRandomNumber(height/4,height/3), windowWidth/2);
//   delay(100);
// }

function happyFace (x, y, diam) {
      // Face
      fill(255, 255, 0);
      stroke(0);
      strokeWeight(2);
      ellipse(x, y, diam, diam);
      
      // Smile
      var startAng = .1*PI
      var endAng = .9*PI
      var smileDiam = .6*diam;
      arc(x, y, smileDiam, smileDiam, startAng, endAng);
      
      // Eyes
      var offset = .2*diam;
      var eyeDiam = .1*diam;
      fill(0);
      ellipse(x-offset, y-offset, eyeDiam, eyeDiam);
      ellipse(x+offset, y-offset, eyeDiam, eyeDiam);
}

function setup() {
  createCanvas(windowWidth, windowHeight);
}

function draw() {
  clear();
  happyFace(getRandomNumber(1, width), getRandomNumber(1, width), getRandomNumber(windowWidth/2,windowWidth/10))
}