function fun(start,end,space){
    total = start
    x="NO"
    if(start<=0||end<=0||space<=0){
        return x
        // check if number is negative
    }
    for (let index = 0; index < end/space; index++) {
        start+=space
        if(start>end){
            total-=start
            //check if the number went too high
        }

        total += start
        // add each time

        
        
        
    }
    console.log(total)
    // print total
    


}
fun(8,19,-2)