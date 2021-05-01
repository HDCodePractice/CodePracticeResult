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
}

function draw() {

    
    // 显示图片
    image(img,0,0,width,height);
    
    Petals: {
        fill(135,40,158)

        // // 左上角的花瓣
        ellipse(width/4,1*(height/4),width/2,height/2)    
    
        // // 左下角的花瓣
        ellipse(width/4,3*(height/4),width/2,height/2)

        // // 右下角的花瓣
        ellipse(3*(width/4),3*(height/4),width/2,height/2)
    
        // // 右上角的花瓣
        ellipse(3*(width/4),height/4,width/2,height/2)
        
    }
    
    Stamen: {
        // 花蕊
        fill(253,242,99)
        ellipse(width/2,height/2,width/2,height/2)
        text("🙂",width/2-5,height/2)
    }
}

function windowResized() {
    setup();
}