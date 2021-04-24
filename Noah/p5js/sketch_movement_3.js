var img;

function setup() {
    createCanvas(windowWidth, windowHeight-50);
    // 图片背景
    img = createImg('https://m.media-amazon.com/images/I/51w18F1VSnL._SL500_.jpg')
    img.hide();
    frameRate(2);
    r = height * 0.45
    speed = 0.02;
    axis = 0
}

function draw() {
    let flowerX = random(50,windowWidth-50);
    let flowerY = random(50,windowHeight-50);
    // let flowerRadius = random(25,150);
    let flowerSize = random(50,150);
    // let flowerXDistance = flowerWidth/2;
    // let flowerYDistance = flowerHeight/2;
    var x = r* cos(radians(axis));
    var y = r* sin(radians(axis));
    
    image(img,0,0,windowWidth,windowHeight-50);

    for (let i = 0; i < 9; i++) {
        fill(168,86,20)
        circle(flowerX,flowerY,flowerSize);
        fill(5,5,5);
        circle(flowerX,flowerY,flowerSize-10);
        fill(241,238,237)
        stroke(255);
        line(x, y+flowerSize/2.5, flowerX, flowerY);
        // quad(flowerX-flowerSize/30, flowerY-flowerSize/2.5, flowerX+flowerSize/30, flowerY-flowerSize/2.5, flowerX+flowerSize/30, flowerY, flowerX-flowerSize/30, flowerY);
        fill(241,238,237)
        line(x+flowerSize/3.5, y, flowerX, flowerY);
        // quad(flowerX+flowerSize/3.5, flowerY-flowerSize/30, flowerX+flowerSize/3.5, flowerY+flowerSize/30, flowerX, flowerY+flowerSize/30, flowerX, flowerY-flowerSize/30);
        fill(168,86,20)
        circle(flowerX,flowerY,flowerSize/10);
        flowerX = random(50,windowWidth-50);
        flowerY = random(50,windowHeight-50);
        flowerSize = random(50,150);
  
        x = r* cos(radians(axis));
        y = r* sin(radians(axis));
    }
    
    // if (minute() < 10) {
    //     text(hour() + ':0' + minute(),flowerX-5,flowerY);
    //     textSize(flowerSize/5);
    // } else {
    //     text(hour() + ':' + minute(),flowerX-5,flowerY);
    //     textSize(flowerSize/5);
    // }
}

function windowResized() {
    setup();
}