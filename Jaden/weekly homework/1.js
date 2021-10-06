function pattern(a){
    for (let i = 0; i < 4; i++) {
        for (let j = 0; j < 4; j++) {
            for (let k = 0; k < 4; k++) {
                e = a[i]
                b = a[j]
                c = a[k]
                x = e*100 + b *10 + c
                process.stdout.write(x + " ")
                
                
            }
            
        }
        
    }
 

}


answer = pattern([1,2,3,4])
process.stdout.write(answer + "      ")