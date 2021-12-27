function closeNum(sum,num){
    a=0
    b=0
    x=0
    y=0
    const close = sum.reduce((a, b) => {
        return Math.abs(b - num) < Math.abs(a - num) ? b : a;
    });
    const closest = sum.reduce((x, y) => {
        return Math.abs(x + num) > Math.abs(y + num) ? x : y;
    });

    console.log(close,closest)
}
closeNum([2,50,8,1000,97],9)