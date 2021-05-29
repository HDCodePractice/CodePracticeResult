let ys = [50,100,150,200,250];

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
}

function windowResized() {
    setup();
}

function draw(){
    background(220);
    for (let index = 0; index < ys.length; index++) {
        let x = (index + 1) * 50;
        circle(x,ys[index],30);
        if (ys[index]>height){
            ys[index] = 50;
        }else{
            if (index === 2){
                ys[index] += 10;
            }else{
                ys[index] += 5;
            }
            
        }
    }
}
