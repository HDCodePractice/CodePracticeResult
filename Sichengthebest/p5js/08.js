let message = "";
let index = 0;
let yposition = 75;
let speed = 4;
let points = 3;
let pointsadd = 2;
let words = [
    "At what point does a country achieve herd immunity? What portion of the population must acquire resistance to the coronavirus, either through infection or vaccination, in order for the disease to fade away and life to return to normal?",
    "Since the start of the pandemic, the figure that many epidemiologists have offered has been 60 to 70 percent. That range is still cited by the World Health Organization and is often repeated during discussions of the future course of the disease.",
    "Although it is impossible to know with certainty what the limit will be until we reach it and transmission stops, having a good estimate is important: It gives Americans a sense of when we can hope to breathe freely again.",
    "Recently, a figure to whom millions of Americans look for guidance: Dr. Anthony S. Fauci, an adviser to both the Trump administration and the incoming Biden administration, has begun incrementally raising his herd-immunity estimate.",
    "In the pandemic's early days, Dr. Fauci tended to cite the same 60 to 70 percent estimate that most experts did. About a month ago, he began saying '70, 75 percent' in television interviews. And last week, in an interview with CNBC News, he said '75, 80, 85 percent' and '75 to 80-plus percent.'",
    "In a telephone interview the next day, Dr. Fauci acknowledged that he had slowly but deliberately been moving the goal posts. He is doing so, he said, partly based on new science, and partly on his gut feeling that the country is finally ready to hear what he really thinks.",
    "Hard as it may be to hear, he said, he believes that it may take close to 90 percent immunity to bring the virus to a halt, almost as much as is needed to stop a measles outbreak.",
    "Asked about Dr. Fauci's conclusions, prominent epidemiologists said that he might be proven right. The early range of 60 to 70 percent was almost undoubtedly too low, they said, and the virus is becoming more transmissible, so it will take greater herd immunity to stop it.",
    "Dr. Fauci said that weeks ago, he had hesitated to publicly raise his estimate because many Americans seemed hesitant about vaccines, which they would need to accept almost universally in order for the country to achieve herd immunity.",
    "Now that some polls are showing that many more Americans are ready, even eager, for vaccines, he said he felt he could deliver the tough message that the return to normal might take longer than anticipated.",
    "'When polls said only about half of all Americans would take a vaccine, I was saying herd immunity would take 70 to 75 percent,' Dr. Fauci said. 'Then, when newer surveys said 60 percent or more would take it, I thought, ‘I can nudge this up a bit,' so I went to 80, 85.'",
    "'We need to have some humility here,' he added. 'We really don't know what the real number is. I think the real range is somewhere between 70 to 90 percent. But, I'm not going to say 90 percent.'",
    "Also, Dr. Fauci noted, a herd-immunity figure at 90 percent or above is in the range of the infectiousness of measles. 'I'd bet my house that Covid isn't as contagious as measles,' he said.",
    "Interviews with epidemiologists regarding the degree of herd immunity needed to defeat the coronavirus produced a range of estimates, some of which were in line with Dr. Fauci's. They also came with a warning: All answers are merely 'guesstimates.'",
    "'You tell me what numbers to put in my equations, and I'll give you the answer,' said Marc Lipsitch, an epidemiologist at Harvard's T.H. Chan School of Public Health. 'But you can't tell me the numbers, because nobody knows them.'",
    "The original assumption that it would take 60 to 70 percent immunity to stop the disease was based on early data from China and Italy, health experts noted.",
    "Dr. Morens and Dr. Lipsitch agreed with Dr. Fauci that the level of herd immunity needed to stop Covid-19 could be 85 percent or higher. 'But that's a guesstimate,' Dr. Lipsitch emphasized.",
    "Although WHO scientists still sometimes cite the older 60 to 70 percent estimate, Dr. Katherine O'Brien, the agency's director of immunization, said that she now thought that range was too low. She declined to estimate what the correct higher one might be.",
    "'We'd be leaning against very thin reeds if we tried to say what level of vaccine coverage would be needed to achieve it,' she said. 'We should say we just don't know. And it won't be a world or even national number. It will depend on what community you live in.'"
]

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    paragraphs = random(words);
    speed = 4
    word = paragraphs.split(" ")[index];
}

function windowResized() {
    setup();
}

function draw() {
    background(220);
    yposition += speed;
    drawRect("Default",250,100,[100,205,200],40,250)
    drawRect("Easy",350,100,[107,215,105],40,250)
    drawRect("Medium",450,100,[250,200,0],40,250)
    drawRect("Hard",550,100,[250,0,0],40,250)
    drawRect("Hardcore",650,100,[120,9,2],40,250)
    drawRect("Impossible",750,100,0,40,250)
    fill(255,0,0);
    textSize(12)
    text(word,50,yposition);
    fill(0);
    text(message,50,150);
    text(`Score: ${points}`,50,70);
    text(`Speed: ${speed}`,50,85)
    textSize(10);
    text(paragraphs,50,50);
    if (yposition >= windowHeight-60) {
        points -= 3;
        yposition = 0;
    }
    if (message == word) {
        points += pointsadd;
        index += 1;
        word = paragraphs.split(" ")[index];
        message = "";
        yposition = 0;
    }
    if (mouseIsPressed) {
        if (mouseX > 250 && mouseX < 290 && mouseY > 100 && mouseY < 190) {
            speed = 4;pointsadd = 2;
        } else if (mouseX > 350 && mouseX < 430 && mouseY > 100 && mouseY < 180) {
            speed = 3;pointsadd = 1;
        } else if (mouseX > 450 && mouseX < 530 && mouseY > 100 && mouseY < 180) {
            speed = 4.5;pointsadd = 3;
        } else if (mouseX > 550 && mouseX < 630 && mouseY > 100 && mouseY < 180) {
            speed = 6;pointsadd = 4;
        } else if (mouseX > 650 && mouseX < 730 && mouseY > 100 && mouseY < 180) {
            speed = 7.5;pointsadd = 5;
        } else if (mouseX > 750 && mouseX < 830 && mouseY > 100 && mouseY < 180) {
            speed = 10;pointsadd = 6;
        }
    }
    if (points < 0) {
        background(255,0,0);
        textSize(100);
        text('GAME OVER',width/2-300,height/2);
        textSize(40);
        text('Refresh to restart.',width/2-150,height/2+100);
    }
    if (paragraphs.split(" ").length-1 < index) {
        speed = 0
        background(0,255,0);
        textSize(40);
        text(`You did it!\n`,width/2-250,height/2-100);
        text(`You got ${points} points on this excerpt!`,width/2-300,height/2-50);
        text(`Refresh to restart.`,width/2-270,height/2);
    }
}

function drawRect(txt,x,y,fillColor,size,textcolor) {
    textSize(15)
    fill(fillColor)
    rect(x,y,2*size,size)
    fill(textcolor)
    text(txt,x+5,y+25)
}

function keyPressed() {
    if (key === 'Backspace') {
        message = message.slice(0,-1)
    }
    if (key === 'Enter') {
        message += '\n'
    }
}

function keyTyped() {
    if (key != 'Enter') {
        message += key
    }
}