function sumScore(sum){
    // console.log(sum.length)
    a=0
    b=0
    for (let index = 0; index < sum.length; index++) {
        for (let j = 0; j < sum[index].length; j++) {
    
            a+=sum[index][0]

            b+=sum[index][1]
            //i learned how to pull a number from an array in an array
            
        }
        
    }
    a=a/2
    b=b/2
    console.log(a,b)



}
sumScore([[3,9],[4,2],[4,3]])