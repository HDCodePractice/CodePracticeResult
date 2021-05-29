var select
function setup() {
  createCanvas(600,600,600);
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
function drawBee(beeX,beeY,beeSize,color1,color2,color3){
  let beeDist = beeSize/2;
  triangle(beeX + beeSize,beeY + beeDist/2,beeX + beeSize + beeDist,beeY + beeDist,beeX + beeDist,beeY + beeDist);
  fill(color1,color2,color3);
  ellipse(beeX + beeDist + beeDist/2,beeY + beeDist*7/8,beeSize+beeDist/4,beeSize - beeDist*2/3);
  circle(beeX + beeDist/2,beeY + beeDist/2,beeSize - beeDist/4);
  fill(0,0,0);
  line(beeX + beeDist*3/2,beeY + beeDist*1/5,beeX + beeDist + beeDist/2,beeY + beeDist + beeDist/2);
  line(beeX + beeDist*2 + beeDist/4,beeY + beeDist/3,beeX + beeDist*2 + beeDist/4,beeY + beeDist + beeDist/3);
  circle(beeX + beeDist/5,beeY + beeDist/5,beeSize - beeDist*2/1.23);
  circle(beeX + beeDist/1.2,beeY + beeDist/5,beeSize - beeDist*2/1.23);
  line(beeX + beeDist/1.1,beeY - beeDist/4,beeX + beeDist/1.1,beeY - beeDist/2);
  line(beeX + beeDist/5,beeY - beeDist/4,beeX + beeDist/5,beeY - beeDist/2);
  circle(beeX + beeDist/5,beeY - beeDist/1.5,beeSize - beeDist - beeDist/1.5);
  circle(beeX + beeDist/1.1,beeY -  beeDist/1.5,beeSize - beeDist - beeDist/1.5);
  fill(255,255,255);
  arc(beeX + beeDist/2,beeY + beeDist/1.1,beeSize - beeDist - beeDist/4,beeSize - beeDist - beeDist/4,PI,QUARTER_PI,CHORD);
}
function panda(x,y,size,black,white) {
  var pandaX=x;
  var pandaY=y;
  var pandaSize=size;
  var pandaDistance=pandaSize/2;
  circle(pandaX,pandaY,pandaSize);
  fill(black)
  circle(pandaX-pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
  fill(black)
  circle(pandaX+pandaSize*2/5,pandaY-pandaSize/2,pandaSize/2);
  fill(black)
  circle(pandaX,pandaY+pandaSize*1/10,pandaSize/8);
  fill(black)
  circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
  fill(white)
  circle(pandaX-pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
  circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/4);
  circle(pandaX+pandaSize/5,pandaY-pandaSize/8,pandaSize/8);
}
function myflower(x,y,size,color1,color2){
  let flowerX = x
  let flowerY = y
  let flowerWidth = size
  let flowerHeight =size
  let flowerXDistance = flowerWidth/2;
  let flowerYDistance = flowerHeight/2;
  fill(color2)
  // // 左上角的花瓣
  ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
  // // 左下角的花瓣
  ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
  // // 右下角的花瓣
  ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
  // // 右上角的花瓣
  ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
  // 花蕊
  fill(color1)
  ellipse(flowerX,flowerY,flowerWidth,flowerHeight); 
}
function draw() {
  myclown(80,99,60,'rgb(263,242,100)','rgb(135,40,158)'); 
  drawBee(160,85,50,255, 255, 0); 
  panda(300,100,50,'rgb(255,255,255)','rgb(0,0,0)') 
  myflower(430,90,35,'rgb(251,212,1)','rgb(255,0,0)');
  //rect(390,50,90); 
}
function mouseClicked() {
  if (mouseX>50&&mouseX<140&&mouseY>60&&mouseY<130){
    select = "clown"
  }
  if (mouseX>150&&mouseX<230&&mouseY>60&&mouseY<140){
    select = "bee"
  }
  if (mouseX>250&&mouseX<340&&mouseY>50&&mouseY<140){
    select = "panda"
  }
  if (mouseX>390&&mouseX<780&&mouseY>50&&mouseY<140){
    select = "myflower"
  }
}
function doubleClicked(){
  if(select=="clown"){
    myclown(mouseX,mouseY,60,'rgb(263,242,100)','rgb(135,40,158)');
  }
  if(select=="bee"){
    drawBee(mouseX,mouseY,50,255, 255, 0);
  }
  if(select=="panda"){
    panda(mouseX,mouseY,50,'rgb(255,255,255)','rgb(0,0,0)');
  }
  if(select=="myflower"){
    myflower(mouseX,mouseY,50,'rgb(251,212,1)','rgb(255,0,0)');
  }
} 
function windowResized() {
    setup();

}
