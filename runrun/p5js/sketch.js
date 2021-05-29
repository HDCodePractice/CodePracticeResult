let size = 300;
    let circleX = 0;
    let circleY = 100;
    let speed = 5;
    let speedY = speed/3;
    let speedX = speed;
    let isNight = false;
function setup() {
    createCanvas(size, size);
}
function mysun(x,y,color1){
    fill(color1)
    circle(x,y,50);
}
function myclown(x,y,size,color1,color2){
  var clownX = x;
  var clownY =  y;
  var clownSize = size;
  let flowerWidth = size
  let flowerHeight =size
  fill(color1)
  circle(clownX,clownY,clownSize);
  fill(32,64,132)
  ellipse(clownX-clownSize/4,clownY-clownSize/4,clownSize/5);
  ellipse(clownX+clownSize/4,clownY-clownSize/4,clownSize/5);
  fill(255,0,0);
  circle(clownX,clownY,clownSize/3);
  fill(233,157,180);
  circle(clownX-clownSize/3,clownY,clownSize/5);
  circle(clownX+clownSize/3,clownY,clownSize/5); 
}
function draw() {
  background(220); 
  if (circleX > width) {
      circleX = 0;
      circleY = 100;
      if (isNight){
          isNight = false;
      }else{
          isNight = true;
      }
  }else if (circleX < 25){
      speedX = speed;
  }
  if (circleX < width/2){
      circleY -= speedY;
  }else{
      circleY += speedY;
  }
  circleX += speedX;
  if (isNight){
      myclown(width/2,height-height/5,width/5,'rgb(263,242,100)','rgb(135,40,158)');
      myclown(width/5,height-height/10,width/10,'rgb(50,242,100)','rgb(0,41,1008)');
      myclown(width*4/5,height-height/10,width/10,'rgb(0,242,5)','rgb(0,40,158)');
      mysun(circleX,circleY,'rgb(250,250,250)');

  }else{
      myclown(width/2,height-height/5,width/5,'rgb(250,250,100)','rgb(135,40,148)');
      myclown(width/5,height-height/10,width/10,'rgb(253,240,100)','rgb(0,50,158)');
      myclown(width*4/5,height-height/10,width/10,'rgb(253,240,5)','rgb(0,50,158)');
      mysun(circleX,circleY,'rgb(241,203,2)')
  }  
}
