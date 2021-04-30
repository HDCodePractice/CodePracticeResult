let circleY = 250;
let circleX = 25;
let speedX = 5;
let speedY = 5;

function setup() {
    createCanvas(500, 500);
    
}
  
function draw() {
    background(220);
    if (circleX > width-26){
        speedX = -5;
    }else if (circleX < 26){
        speedX = 5;
    }

    if (speedX > 0){
        if (circleX <width/2){
            speedY = -1;
        }else{
            speedY = 1;
        }    
    }else{
        if (circleX <width/2){
            speedY = 1;
        }else{
            speedY = -1;
        }
    
    }

    circleX += speedX;
    circleY += speedY;
    circle(circleX, circleY,50);
}
//     let x = 20;
//     for (let i = 1; i < 8; i++) {
//         circle(x,y,10)
        
//         if( y <width/2 ){
//             x=x+1
//         }else{
//             y+=1
        
//         }
//     }
// }












    // circle(circleX,circleY,50);
    // if (circleY < 250 && circleY >= 25 && circleX >= 250 && circleX < 475) {
    //     circleY += speed;
    //     circleX += speed;
    //     circle(circleX,circleY,50)
  
    // } else if (circleX <= 475 && circleX > 250 && circleY >= 250 && circleY < 475) {
    //     circleY += speed;
    //     circleX -= speed;
    // } else if (circleX <= 250 && circleX > 25 && circleY <= 475 && circleY > 250) {
    // //     circleY -= speed;
    // //     circleX -= speed;
    // } else if (circleX >= 25 && circleX < 250 && circleY <= 250 && circleY > 25) {
    //     circleY -= speed;
    //     circleX += speed;
    //     circle(circleX, circleY,50)
    // }
    


  
    
    
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

