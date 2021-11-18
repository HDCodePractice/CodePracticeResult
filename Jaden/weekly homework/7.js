
var readline = require('readline');
var terminal = readline.createInterface(
    {
      input : process.stdin,
      output : process.stdout
    });
    
    terminal.setPrompt('Put in the height of the jump');
    // let you imput number
    terminal.prompt();
    terminal.on('line', function(answer)
    {

        var x = parseInt(answer);
        if(x>0){
            var readline = require('readline');
            var terminal = readline.createInterface(
                {
                input : process.stdin,
                output : process.stdout
                });
                
                terminal.setPrompt('Put in how many times it bounces');
                // let you imput number
                terminal.prompt();
                terminal.on('line', function(answer2)
                {
                    var y = parseInt(answer2);
                    if(x>0 && y>0){
                        for (let i = 0; i < y; i++) {
                            x=x/2
                            
                        }
                        console.log(x)
                        terminal.prompt();
                    
                    }else{
                        console.log("THATS NOT A YEAR")
                    }
                    terminal.prompt();
                })
        
        
        }else{
            console.log("THATS NOT A YEAR")
        }
       


    
        })
