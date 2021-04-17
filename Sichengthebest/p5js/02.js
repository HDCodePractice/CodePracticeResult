function setup() {
    // 正常操作的时候 width = windowWidth 和 height = windowHeight
    // 可以把 width 和 height 的值改成不同大小的屏幕测试
    
    r = random(1,255)
    g = random(1,255)
    b = random(1,255)
    r2 = random(1,255)
    g2 = random(1,255)
    b2 = random(1,255)

    createCanvas(800,600);

    // 图片背景
    img = createImg('https://images.unsplash.com/photo-1490750967868-88aa4486c946?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80')
    img.hide();
}

function draw() {
    
    // 显示图片
    image(img,0,0,width,height)
    
    Petals: {
        fill(r,g,b)
        // 左上角的花瓣
        ellipse(width/4,1*(height/4),width/2,height/2)
    
        // 左下角的花瓣
        ellipse(width/4,3*(height/4),width/2,height/2)

        // 右下角的花瓣
        ellipse(3*(width/4),3*(height/4),width/2,height/2)
    
        // 右上角的花瓣
        ellipse(3*(width/4),height/4,width/2,height/2)
        
    }
    Stamen: {
        fill(r2,g2,b2)
        // 花蕊
        ellipse(width/2,height/2,width/2,height/2)
    }
}