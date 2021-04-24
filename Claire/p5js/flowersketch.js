function setup() {
    createCanvas(windowWidth,windowHeight-100);
  }
  
  function draw() {
    background(220);
    let flowerX = random(0,width);
    let flowerY = random(0,height);
    let flowerSize = random(25,125);
    let flowerDistance = flowerSize/2;
    
    // fill(255,0,0);
    // circle(width/4,height/4,width/2);
    // circle(width*3/4,height*3/4,width/2);
    // circle(width*3/4,height/4,width/2);
    // circle(width/4,height*3/4,width/2);
    // fill(255,255,0);
    // circle(width/2,height/2,width/2);  
      fill(255,0,0);
    circle(flowerX-flowerDistance,flowerY-flowerDistance,flowerSize);
    circle(flowerX-flowerDistance,flowerY+flowerDistance,flowerSize);
    circle(flowerX+flowerDistance,flowerY+flowerDistance,flowerSize);
    circle(flowerX+flowerDistance,flowerY-flowerDistance,flowerSize);
    fill(255,255,0)
    circle(flowerX, flowerY, flowerSize)
    }


  function windowResized() {
    setup();
  }