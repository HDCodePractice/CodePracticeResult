function setup() {
    createCanvas(170, 170);
  }
  
  function draw() {
    background(220);
    fill(255,0,0)
    beginShape();
    vertex(1,1);
    bezierVertex(55,45,30,57.6,37);
    bezierVertex(45,164,170,68,1,1);
    endShape();
    beginShape();
    vertex(170,1);
    bezierVertex(55,45,90,57,78,37);
    bezierVertex(-30,150,170,88,170,1);
    endShape();
    beginShape();
    vertex(1,170);
    bezierVertex(28,45,30,78,78,37);
    bezierVertex(28,123,170,88,1,170);
    endShape();
    beginShape();
    vertex(170,170);
    bezierVertex(55,100,90,57,78,37);
    bezierVertex(80,30,170,88,170,170);
    endShape();
    fill(255,255,0 )
    circle(85,85,100)
    fill(0,0,0)
    triangle(130,85,135,80,150,85)
    fill(255,255,0)
    ellipse(105,85,70,40)
    circle(75,75,50)
    fill(0,0,0)
    line(105,65,105,105)
    line(125,70,125,100)
    circle(65,65,10)
    circle(85,65,10)
    line(85,53,85,40)
    line(65,53,65,40)
    circle(65,40,10)
    circle(85,40,10)
    fill(255,255,255)
    arc(75,85,20,20,PI,QUARTER_PI,CHORD)
    
    }
        

    


