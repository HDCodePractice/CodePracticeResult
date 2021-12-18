function ways(a){
    for (let index = 0; index < 4; index++) {
        if(index ==0){
            console.log("\x1b[37m",a,a,a,a)

        }else if(index == 1){
            console.log(" ",a,a,a,
            ) 
        }else if(index ==2){
            console.log("  ",a,a,
        )  
        }else if(index ==3){
            console.log("   ",a,
            ) 
        }
       
        
        
    }

}

ways(1)
// answer = ways(1)
// console.log(answer)
