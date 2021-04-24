var width;
var height;
var img;

function setup() {
    // 正常操作的时候 width = windowWidth 和 height = windowHeight
    // 可以把 width 和 height 的值改成不同大小的屏幕测试

    width = windowWidth;
    height = windowHeight;

    createCanvas(width, height-50);

    // 图片背景
    img = createImg('https://www.pennington.com/-/media/Images/Pennington2-NA/US/blog/seed/how-to-identify-your-grass/Kentucky_31.jpg?h=800&la=en&w=1000&hash=7AF84F56C78ACAD83BABBF310157577B92EFB857')
    img.hide();
    frameRate(5);
}

function draw() {
    
    let flowerX = random(0,width);
    let flowerY = random(0,height);
    // let flowerRadius = random(25,150);
    let flowerWidth = random(25,150);
    let flowerHeight = random(25,150);
    let flowerXDistance = flowerWidth/2;
    let flowerYDistance = flowerHeight/2;


    
    // 显示图片
    image(img,0,0,width,height);
    for (let i = 0; i < 9; i++) {
        Petals: {
            fill(135,40,158)

            // // 左上角的花瓣
            ellipse(flowerX-flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
        
            // // 左下角的花瓣
            ellipse(flowerX-flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)

            // // 右下角的花瓣
            ellipse(flowerX+flowerXDistance,flowerY+flowerYDistance,flowerWidth,flowerHeight)
        
            // // 右上角的花瓣
            ellipse(flowerX+flowerXDistance,flowerY-flowerYDistance,flowerWidth,flowerHeight)
            
        }
        
        Stamen: {
            // 花蕊
            fill(253,242,99)
            ellipse(flowerX,flowerY,flowerWidth,flowerHeight);
        }
        flowerX = random(0,width);
        flowerY = random(0,height);
        flowerWidth = random(25,150);
        flowerHeight = random(25,150);
        flowerXDistance = flowerWidth/2;
        flowerYDistance = flowerHeight/2;
    }  
}

function windowResized() {
    setup();
}