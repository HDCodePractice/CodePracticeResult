function setup() {
    createCanvas(windowHeight-100,windowHeight-100);
    
    
}
  
  function draw() {   
   let beeX = random(0,width)
   let beeY = random(0,height)
   let beeSize = random(25,100)
   let beeDist = beeSize/2
   let beeColor =  random(0,255)
   background(220)
   fill(0,0,0)
    triangle(beeX + beeSize,beeY + beeDist/2,beeX + beeSize + beeDist,beeY + beeDist,beeX + beeDist,beeY + beeDist)
    fill(255,255,0)
    ellipse(beeX + beeDist + beeDist/2,beeY + beeDist*7/8,beeSize+beeDist/4,beeSize - beeDist*2/3)
    circle(beeX + beeDist/2,beeY + beeDist/2,beeSize - beeDist/4)
    fill(0,0,0)
    line(beeX + beeDist*3/2,beeY + beeDist*1/5,beeX + beeDist + beeDist/2,beeY + beeDist + beeDist/2)
    line(beeX + beeDist*2 + beeDist/4,beeY + beeDist/3,beeX + beeDist*2 + beeDist/4,beeY + beeDist + beeDist/3)
    circle(beeX + beeDist/5,beeY + beeDist/5,beeSize - beeDist*2/1.23)
    circle(beeX + beeDist/1.2,beeY + beeDist/5,beeSize - beeDist*2/1.23)
    line(beeX + beeDist/1.1,beeY - beeDist/4,beeX + beeDist/1.1,beeY - beeDist/2)
    line(beeX + beeDist/5,beeY - beeDist/4,beeX + beeDist/5,beeY - beeDist/2)
    circle(beeX + beeDist/5,beeY - beeDist/1.5,beeSize - beeDist - beeDist/1.5)
    circle(beeX + beeDist/1.1,beeY -  beeDist/1.5,beeSize - beeDist - beeDist/1.5)
    fill(255,255,255)
    arc(beeX + beeDist/2,beeY + beeDist/1.1,beeSize - beeDist - beeDist/4,beeSize - beeDist - beeDist/4,PI,QUARTER_PI,CHORD)

  }
  function windowResized() {
    setup();
}