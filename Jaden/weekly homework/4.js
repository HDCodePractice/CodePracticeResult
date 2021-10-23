

function findnum()  { 
    let tries  = 0 
    let b = 100;
    let x = Math.floor(Math.random(1,100)*b)
    const readline =  require('readline'). createInterface({
        input:process.stdin,
        output: process.stdout
    })
    var waitForUserInput = function() {
    readline.question('What number do you guess?', function(reply){
        c = Number(reply)
    if( x == c){
        console.log("You got it right","You took",tries,"tries")

    }else if( c > x){
        tries += 1
        console.log("Your number is too high")
        waitForUserInput()
    }else if(c<x){
        tries +=1
        console.log("Your number is too low")
        waitForUserInput()
    }
        
    })

} 

}
findnum()
waitForUserInput();
answer = findnum()
