var width;
var height;
var img;
var img2;

function setup() {
  // 正常操作的时候 width = windowWidth 和 height = windowHeight
  // 可以把 width 和 height 的值改成不同大小的屏幕测试

  width = windowWidth
  height = windowHeight
    
  createCanvas(width, height);
  img = createImg('https://cdn.wallpapersafari.com/62/78/TrLPm7.jpg');
  img.hide();
  img2 = createImg('https://lh3.googleusercontent.com/proxy/HxIUwF19uwxSDXVy4DVy5DRx5piL_IK0iEJmPSztkqm4y3MIqc0t_IWHlAkTqrIkiJnRYHQs_QCgHaicTSwbTqSWUi5mzk-Qoo6fByegnP5jbibHmgVBPU8YVNDbPRWSiJV5lTGL5Ju0c1yWL4pAanVTLrQE3zg');
  img2.hide();
}

function draw() {
  background(90,193,253);
  image(img,0,0)
  fill(169,173,176)
  rect(100,600,850,300)
  // ---------------------
  fill(28,161,251)
  // stroke()
  triangle(width/2-100, 200, width/2+100, 200, width/2, 50);
  fill(169,173,176)
  rect(width/2-75,200,150,500)
  fill(168,86,20)
  circle(width/2,300,110)
  fill(5,5,5)
  circle(width/2,300,100)
  fill(241,238,237)
  if (minute() < 10) {
    text(hour() + ':0' + minute(),width/2-5,300)
  } else {
    text(hour() + ':' + minute(),width/2-5,300)
  }
  // ---------------------
  fill(168,86,20)
  ellipse(255, 660, 100, 200);
  fill(28,161,251)
  triangle(150, 400, 365, 400, 265, 250);
  fill(169,173,176)
  rect(180,400,150,300)
  fill(5,5,5)
  rect(205,450,35,50,5)
  rect(265,450,35,50,5)
  fill(168,86,20)
  ellipse(255, 660, 100, 200);
  // ---------------------
  fill(28,161,251)
  triangle(650, 400, 865, 400, 765, 250);
  fill(169,173,176)
  rect(680,400,150,300)
  fill(5,5,5)
  rect(705,450,35,50,5)
  rect(765,450,35,50,5)
  fill(168,86,20)
  ellipse(755, 660, 100, 200);
  // ---------------------
  fill(28,161,251)
  triangle(100, 450, 25, 550, 175, 550);
  fill(169,173,176)
  rect(60,550,75,140)
  fill(5,5,5)
  rect(80,580,35,50,5)
  // ---------------------
  fill(28,161,251)
  triangle(950, 450, 875, 550, 1025, 550);
  fill(169,173,176)
  rect(910,550,75,140)
  fill(5,5,5)
  rect(930,580,35,50,5)
  // ---------------------
  image(img2,430,550,120,160)
}