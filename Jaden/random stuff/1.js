function twosum(numbers_array, total) {
    for (let i = 0; i < numbers_array.length; i++) {
        for (let j = 0; j < numbers_array.length; j++) {
            if (numbers_array[i] + numbers_array[j] == total){
                return [i,j]
            }
            
        }
        
    }


    
}


answer = twosum([78, 2, 7, 8, 25, 45, 6, 3, 4], 156)
process.stdout.write(answer + "")