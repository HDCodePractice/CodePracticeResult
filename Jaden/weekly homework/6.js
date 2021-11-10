var readline = require('readline');
var terminal = readline.createInterface(
    {
      input : process.stdin,
      output : process.stdout
    });
    
    terminal.setPrompt('Put in a year!');
    // let you imput number
    terminal.prompt();
    terminal.on('line', function(answer)
    {
        var x = parseInt(answer);
        if(x>0){
            if(x%4==0){
                if(x%100==0){
                    if(x%400==0){
                        console.log("yes")
                    }else{
                        console.log("no")
                    }
                }else{
                    console.log("yes")
                }
            }else{
                console.log("no")
            }
        }else{
            console.log("THATS NOT A YEAR")
        }
        terminal.prompt();
    })
    
    
