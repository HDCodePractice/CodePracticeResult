let length = 3;
let xs = [];
let ys = [10,25,40,55,70,85,100];
let speed = 4
let message = '';
let paragraph = ["At what point does a herd What of the must to the or in order for the to fade away and life to to Since the start of the the that many have has been 60 to 70 That range is still cited by the World and is often of the of the it is to know with what the limit will be until we reach it and a good is It gives a sense of when we can hope to a to whom of look for Dr. S. an to both the Trump and the Biden has begun his In the early days, Dr. Fauci to cite the same 60 to 70 that most did. About a month ago, he began '70, 75 in And last week, in an with CNBC News, he said '75, 80, 85 and '75 to In a the next day, Dr. Fauci that he had but been the goal He is doing so, he said, based on new and on his gut that the is ready to hear what he Hard as it may be to hear, he said, he that it may take close to 90 to bring the virus to a halt, as much as is to stop a Asked about Dr. said that he might be The early range of 60 to 70 was too low, they said, and the virus is more so it will take herd to stop it. Dr. Fauci said that weeks ago, he had to raise his many about which they would need to in order for the to herd Now that some polls are that many more are even for he said he felt he could the tough that the to might take than 'When polls said only about half of all would take a I was herd would take 70 to 75 Dr. Fauci said. when newer said 60 or more would take it, I 'I can nudge this up a bit,' so I went to 80, 85.' 'We need to have some he 'We don't know what the real is. I think the real range is 70 to 90 But, I'm not going to say 90 Also, Dr. Fauci a at 90 or above is in the range of the of 'I'd bet my house that Covid isn't as as he said. with the of herd to the a range of some of which were in line with Dr. They also came with a All are 'You tell me what to put in my and I'll give you the said Marc an at T.H. Chan of 'But you can't tell me the knows The that it would take 60 to 70 to stop the was based on early data from China and Dr. and Dr. with Dr. Fauci that the level of herd to stop could be 85 or 'But a Dr. WHO still cite the older 60 to 70 Dr. the of said that she now that range was too low. She to what the one might be. 'We'd be very thin reeds if we tried to say what level of would be to it,' she said. 'We say we just don't know. And it won't be a world or even It will on what you live in.' ", "country achieve portion acquire through disease normal? offered percent. repeated disease. Although estimate breathe millions Anthony adviser incoming raising percent estimate experts percent' percent' 80-plus science, feeling country finally thinks. believes percent immunity measles Fauci's percent becoming greater immunity publicly estimate because hesitant country achieve showing deliver message vaccine, immunity surveys percent thought, humility between percent. percent measles. immunity produced Fauci's. warning: answers numbers answer,' Health. numbers, because original percent immunity disease experts Lipsitch immunity Covid-19 percent higher. Lipsitch Although percent O'Brien, agency's director thought declined estimate correct leaning against vaccine coverage achieve national number. ", "immunity? population resistance coronavirus, either infection vaccination, return pandemic, figure epidemiologists Health Organization during discussions future course impossible certainty transmission stops, having important: Americans freely again. Recently, figure Americans guidance: Fauci, administration administration, incrementally herd-immunity estimate. pandemic's tended saying television interviews. interview percent.' telephone interview acknowledged slowly deliberately moving posts. partly partly really almost needed outbreak. conclusions, prominent epidemiologists proven right. almost undoubtedly transmissible, hesitated Americans seemed vaccines, accept almost universally immunity. Americans ready, eager, vaccines, return normal longer anticipated. Americans saying percent,' 'Then, here,' added. really number somewhere percent.' noted, herd-immunity figure infectiousness contagious measles,' Interviews epidemiologists regarding degree needed defeat coronavirus estimates, merely 'guesstimates.' equations, Lipsitch, epidemiologist Harvard's School Public nobody them.' assumption Italy, health noted. Morens agreed needed that's guesstimate,' emphasized. scientists sometimes estimate, Katherine immunization, higher needed should depend community "]
let bonuswords = 'Incomprehensibilities; Interdisciplinary", Inconsequential: subdermatoglyphic. (uncopyrightable) sesquipedalianism. disestablishment counterintuitive, Connecticutian Massachusetts'
let words = [];
let score = 0;
let pointsadd = 3;
let hp = 100;
let bonis = 100
let bonus = false;
let bonusx = 0;
let bonusword = '';
let bonusrgb = [200,100,0]

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
}

function windowResized() {
    setup();
}

function drawRect(txt,x,y,fillColor,size,textcolor) {
    textSize(15);
    fill(fillColor);
    rect(x,y,2*size,size);
    fill(textcolor);
    text(txt,x+5,y+25);
}

function getArray(start,end) {
    randomnums = [];
    for (let index = start; index < end; index++) {
        append(randomnums,index);
    }
    return randomnums;
}

function draw(){
    background(220);
    bonis = random(getArray(1,1000));
    if (bonis == 1) {
        bonus = true;
    }
    bonusx += 3;
    if (length < 3) {
        difficultyindex = 0
    } else if (length > 2 && length < 6) {
        difficultyindex = 1
    } else {
        difficultyindex = 2
    }
    drawRect("Default",250,10,[100,205,200],40,250);
    drawRect("Easy",350,10,[107,215,105],40,250);
    drawRect("Medium",450,10,[250,200,0],40,250);
    drawRect("Hard",550,10,[250,0,0],40,250);
    drawRect("Hardcore",650,10,[120,9,2],40,250);
    drawRect("Impossible",750,10,0,40,250);
    fill(0)
    rect(80,110,150,30)
    text('Text here:',10,130)
    text(`Score: ${score}`,10,155)
    text(`HP: ${hp}`,10,180)
    fill(220)
    text(message,85,130);
    for (let index = 0; index < length; index++) {
        for (let index = 0; index < length; index++) {
            append(xs,random(getArray(235,width-100)));
        }
        for (let index = 0; index < length; index++) {
            append(words,random(paragraph[difficultyindex].split(' ')));
        }
        fill(0);
        text(words[index],xs[index],ys[index]);
        if (ys[index] >= height) {
            ys[index] = index*15+10;
            for (let index = 0; index < length; index++) {
                append(words,random(paragraph[difficultyindex].split(' ')));
            }
            xs[index] = random(getArray(235,width-100));
            hp -= 2;
        } else {
            ys[index] += speed;
        }
        if (message == words[index]) {
            words[index] = random(paragraph[difficultyindex].split(' '));
            xs[index] = random(getArray(235,width-100));
            ys[index] = index*15+10;
            message = '';
            score += pointsadd
        }
    }
    if (bonus == true) {
        fill(bonusrgb);
        text(bonusword,bonusx,100);
        if (bonusx >= width) {
            bonus = false;
            bonis = random(getArray(1,1000));
            bonusx = 0;
            bonusword = random(bonuswords.split(' '));
            bonusrgb = [random(5,245),random(5,245),random(5,245)];
        }
        if (bonusword == message) {
            bonus = false;
            bonis = random(getArray(1,1000));
            bonusx = 0;
            hp += random([5,10]);score += random([15,30]);
            bonusword = random(bonuswords.split(' '));
            message = '';
            bonusrgb = [random(5,245),random(5,245),random(5,245)];
        }
    }
    if (score >= 100) {
        speed = 0
        background(0,255,0);
        textSize(40);
        text(`You did it!\n`,width/2-250,height/2-100);
        text(`Refresh to restart.`,width/2-270,height/2-50);
    }
    if (mouseIsPressed) {
        if (mouseX > 250 && mouseX < 330 && mouseY > 10 && mouseY < 50) {
            length = 3;pointsadd = 3;speed = 3;
        } else if (mouseX > 350 && mouseX < 430 && mouseY > 10 && mouseY < 50) {
            length = 2;pointsadd = 2;speed = 2.5;
        } else if (mouseX > 450 && mouseX < 530 && mouseY > 10 && mouseY < 50) {
            length = 4;pointsadd = 4;speed = 3.5;
        } else if (mouseX > 550 && mouseX < 630 && mouseY > 10 && mouseY < 50) {
            length = 5;pointsadd = 5;speed = 4;
        } else if (mouseX > 650 && mouseX < 730 && mouseY > 10 && mouseY < 50) {
            length = 6;pointsadd = 6;speed = 5.5;
        } else if (mouseX > 750 && mouseX < 830 && mouseY > 10 && mouseY < 50) {
            length = 8;pointsadd = 7;speed = 7;
        }
    }
    if (hp < 0) {
        background(255,0,0);
        fill(0)
        textSize(100);
        text('GAME OVER',width/2-300,height/2);
        textSize(40);
        text('Refresh to restart.',width/2-150,height/2+100);
    }
}

function keyPressed() {
    if (key === 'Backspace') {
        message = message.slice(0,-1);
    }
}

function keyTyped() {
    if (key != 'Enter') {
        message += key;
    }
}