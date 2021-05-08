var width;
var height;
var img;
let circleX = -15;
let circleY = 300;
let speed = 10;
let speedY = speed/3;
let speedX = speed;

var isDay;

function setup() {
    // 正常操作的时候 width = windowWidth 和 height = windowHeight
    // 可以把 width 和 height 的值改成不同大小的屏幕测试

    width = windowWidth;
    height = windowHeight;

    createCanvas(width, height-50);

    // 图片背景
    img = createImg('https://www.pennington.com/-/media/Images/Pennington2-NA/US/blog/seed/how-to-identify-your-grass/Kentucky_31.jpg?h=800&la=en&w=1000&hash=7AF84F56C78ACAD83BABBF310157577B92EFB857')
    img.hide();
    isDay = true;
    background(220)
}

function draw() {
    // 显示图片
    image(img,0,0,width,height);
    drawBackground();
    drawFlower(8,width/2,height,[120,209,249])
    drawFlower(15,width/4,height,[199,2,199])
    drawFlower(12,width/1.3,height,[32,329,2])
}

function drawBackground() {
    if (isDay) {
        fill(241,203,2);
        background(66,196,251);
    } else {
        fill(250,250,250)
        background(0);
    }
    if (circleX < 25){
        speedX = speed;
    }
    if (circleX < width+55){
        if (circleX < width/2){
            circleY -= speedY;
        } else {
            circleY += speedY;
        }
    } else {
        if (isDay) {
            isDay = false;
            
        } else {
            isDay = true;
        }
        circleX = -15;
        circleY = 300;
    }
    circleX += speedX;
    circle(circleX,circleY,50); 
}

function drawFlower(size,x,y,nightcolor) {
    fill(35,209,108);
    rect(x-width/(size*2)-5,y-height/size-height/(size*2)-5,10,1000)

    Petals: {
        if (isDay) {
            fill(135,40,158);
        } else {
            fill(nightcolor)
        }
        // // 左上角的花瓣
        ellipse(x-width/size,y-2*height/size,width/size,height/size);    
    
        // // 左下角的花瓣
        ellipse(x-width/size,y-height/size,width/size,height/size);

        // // 右下角的花瓣
        ellipse(x,y-height/size,width/size,height/size);
    
        // // 右上角的花瓣
        ellipse(x,y-2*height/size,width/size,height/size);
    }
    Stamen: {
        // 花蕊
        fill(253,242,99)
        ellipse(x-width/(size*2),y-height/size-height/(size*2),width/size,height/size)
        
    }
}

function windowResized() {
    setup();
}