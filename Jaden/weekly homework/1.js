function reversenum(x)  { 
    let b = x.toString().split('').reverse().join('');
    if (b == x){
        return true
    }else{
        return false
    }
    
    }
    answer = reversenum(576)
    process.stdout.write(answer + "") 