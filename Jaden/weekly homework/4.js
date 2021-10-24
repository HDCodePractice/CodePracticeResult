
var readline = require('readline');
let tries = 0
var randomNumber = Math.round(Math.random() * 100);


var terminal = readline.createInterface(
{
  input : process.stdin,
  output : process.stdout
});

terminal.setPrompt('Guess the number!');
terminal.prompt();
terminal.on('line', function(answer)
{
  var answerNum = parseInt(answer);
  
  if (answerNum > randomNumber){
    tries +=1
    console.log('Too high!',"Tries:", tries);

  }else if (answerNum < randomNumber){
    tries +=1
    console.log('Too low!',"Tries:", tries);

  }else if (answerNum === randomNumber){
    tries +=1
    console.log('You got it', "You took",tries,"tries");

  }else{
    console.log("That wasn't a number I recognise. Put in an actual number!");

  }

 
  
  terminal.prompt();
});

terminal.on('close', function()
{})
;