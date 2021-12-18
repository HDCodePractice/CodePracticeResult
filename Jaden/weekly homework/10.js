function highScore(sum){
    a=sum[0][0]
    b=sum[0][1]
    x=sum[0][0]
    y=sum[0][1]
    for (let index = 0; index < sum.length; index++) {
        for (let j = 0; j < sum[index].length; j++) {
            if(a-sum[index][0]<0){
                a= sum[index][0]
            }
            if(b-sum[index][1]<0){
                b= sum[index][1]
            }
            if(x-sum[index][0]>0){
                x= sum[index][0]
            }
            if(y-sum[index][1]>0){
                y= sum[index][1]
            }


            
        }
        
    }
    console.log(a,b,x,y)
}
highScore([[3,9],[4,2],[5,3],[10,20]])