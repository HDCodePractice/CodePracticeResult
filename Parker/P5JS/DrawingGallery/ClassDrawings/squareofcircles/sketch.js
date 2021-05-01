function setup() {
  createCanvas(500, 500);
}

function draw() {
  background(220);
  for (let i = 50; i < 500; i+=50){
      circle(i,i,30); 
      circle(500-i,i,30);
      for (let j = 50; j < 500; j+=200){
          circle(i,j,30); 
          circle(j,i,30);        
      }
  }
}