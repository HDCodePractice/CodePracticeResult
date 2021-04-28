let circleY = 25;
let circleX = 250;
let speed = 5;

function setup() {
    createCanvas(500, 500);
    
}
  
function draw() {
    background(220);
    rectangle(circleX,circleY,50, 50);
    if (circleY < 250 && circleY >= 25 && circleX >= 250 && circleX < 475) {
        circleY += speed;
        circleX += speed;
  
    } else if (circleX <= 475 && circleX > 250 && circleY >= 250 && circleY < 475) {
        circleY += speed;
        circleX -= speed;
    } else if (circleX <= 250 && circleX > 25 && circleY <= 475 && circleY > 250) {
        circleY -= speed;
        circleX -= speed;
    } else if (circleX >= 25 && circleX < 250 && circleY <= 250 && circleY > 25) {
        circleY -= speed;
        circleX += speed;
    }
    


  
    
    
//     if (circleX > width - 30) {
//         speed = -5;
//     }
//     if(circleY < 30){
        
//         speed = 5;
    
//     }
//     if(circleX < 30){
        
//         speed = -5;
    
//     }
    

    
//     circleY += speed;
//     circleX -= speed;
    
 }

// function draw() {
//     background(220);
//     circle(circleX,circleY,50); 
//     if (circleY > height - 30) {
//         speed = -5;
//     }
//     if(circleY < 30){
        
//         speed = 5;
//     }
//     circleY += speed;
// }
// function draw() {
//     background(220);
//     circle(circleX,circleY,50); 
//     if (circleY > height - 30) {
//         speed = 0;
//     }
//     else{
//          speed = 5;
//     }
//     circleY += speed;
// }

