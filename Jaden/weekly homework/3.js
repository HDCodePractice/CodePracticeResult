function pattern(month,day,year){
    if(month == 1){
        a = 0
    }else if(month == 2){
        a =31
    }else if(month == 3){
        a= 59
    }else if(month == 4 ){
        a = 90
    }else if(month == 5){
        a = 120
    }else if(month == 6){
        a = 151
    }else if(month == 7){
        a = 181
    }else if(month == 8){
        a = 212
    }else if(month == 9){
        a = 243
    }else if(month == 10){
        a = 273
    }else if(month == 11){
        a = 304
    }else if(month == 12){
        a = 334
    }
    total = a + day
    //find all numbers in the day
    if(year%4==0){
        if(month>2){
            total+=1
            console.log(total)
            // check leap year
        }
    }
    return total
  
  
}


answer = pattern(1,1,2018)
console.log(answer)
