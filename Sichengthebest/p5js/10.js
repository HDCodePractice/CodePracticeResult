let paragraph = ["At what point does a herd What of the must to the or in order for the to fade away and life to to Since the start of the the that many have has been 60 to 70 That range is still cited by the World and is often of the of the it is to know with what the limit will be until we reach it and a good is It gives a sense of when we can hope to a to whom of look for Dr. S. an to both the Trump and the Biden has begun his In the early days, Dr. Fauci to cite the same 60 to 70 that most did. About a month ago, he began '70, 75 in And last week, in an with CNBC News, he said '75, 80, 85 and '75 to In a the next day, Dr. Fauci that he had but been the goal He is doing so, he said, based on new and on his gut that the is ready to hear what he Hard as it may be to hear, he said, he that it may take close to 90 to bring the virus to a halt, as much as is to stop a Asked about Dr. said that he might be The early range of 60 to 70 was too low, they said, and the virus is more so it will take herd to stop it. Dr. Fauci said that weeks ago, he had to raise his many about which they would need to in order for the to herd Now that some polls are that many more are even for he said he felt he could the tough that the to might take than 'When polls said only about half of all would take a I was herd would take 70 to 75 Dr. Fauci said. when newer said 60 or more would take it, I 'I can nudge this up a bit,' so I went to 80, 85.' 'We need to have some he 'We don't know what the real is. I think the real range is 70 to 90 But, I'm not going to say 90 Also, Dr. Fauci a at 90 or above is in the range of the of 'I'd bet my house that Covid isn't as as he said. with the of herd to the a range of some of which were in line with Dr. They also came with a All are 'You tell me what to put in my and I'll give you the said Marc an at T.H. Chan of 'But you can't tell me the knows The that it would take 60 to 70 to stop the was based on early data from China and Dr. and Dr. with Dr. Fauci that the level of herd to stop could be 85 or 'But a Dr. WHO still cite the older 60 to 70 Dr. the of said that she now that range was too low. She to what the one might be. 'We'd be very thin reeds if we tried to say what level of would be to it,' she said. 'We say we just don't know. And it won't be a world or even It will on what you live in.' ", "country achieve portion acquire through disease normal? offered percent. repeated disease. Although estimate breathe millions Anthony adviser incoming raising percent estimate experts percent' percent' 80-plus science, feeling country finally thinks. believes percent immunity measles Fauci's percent becoming greater immunity publicly estimate because hesitant country achieve showing deliver message vaccine, immunity surveys percent thought, humility between percent. percent measles. immunity produced Fauci's. warning: answers numbers answer,' Health. numbers, because original percent immunity disease experts Lipsitch immunity Covid-19 percent higher. Lipsitch Although percent O'Brien, agency's director thought declined estimate correct leaning against vaccine coverage achieve national number. ", "immunity? population resistance coronavirus, either infection vaccination, return pandemic, figure epidemiologists Health Organization during discussions future course impossible certainty transmission stops, having important: Americans freely again. Recently, figure Americans guidance: Fauci, administration administration, incrementally herd-immunity estimate. pandemic's tended saying television interviews. interview percent.' telephone interview acknowledged slowly deliberately moving posts. partly partly really almost needed outbreak. conclusions, prominent epidemiologists proven right. almost undoubtedly transmissible, hesitated Americans seemed vaccines, accept almost universally immunity. Americans ready, eager, vaccines, return normal longer anticipated. Americans saying percent,' 'Then, here,' added. really number somewhere percent.' noted, herd-immunity figure infectiousness contagious measles,' Interviews epidemiologists regarding degree needed defeat coronavirus estimates, merely 'guesstimates.' equations, Lipsitch, epidemiologist Harvard's School Public nobody them.' assumption Italy, health noted. Morens agreed needed that's guesstimate,' emphasized. scientists sometimes estimate, Katherine immunization, higher needed should depend community "]
let bonuswords = 'Incomprehensibilities; Interdisciplinary", Inconsequential: subdermatoglyphic. (uncopyrightable) sesquipedalianism. disestablishment counterintuitive, Connecticutian Massachusetts electromagnetic" first-person-shooter'
let vs = [];
let score = 0;
let pointsadd = 3;
let hp = 100;
let message = ''

class Word{
    constructor(w,x,y,c){
        this.w = w;
        this.x = x;
        this.y = y;
        this.c = c;
    }
    display(){
        fill(this.c);
        text(this.w,this.x,this.y);
    }
}

function setup() {
    createCanvas(windowWidth,windowHeight-60);
    background(220);
    for (let index = 0; index < 5; index++) {
        word = new Word(random(paragraph[1].split(' ')),random(50,width-50),100,0);
        vs.push(word);
    }
}

function windowResized() {
    setup();
}

function draw(){
    background(220);
    text(message,100,100);
    for (let index = 0; index < vs.length; index++) {
        vs[index].display();
        if (vs[index].y>height){
            vs[index].y = 50;
            vs[index].x = random(50,width-50);
        }else{
            vs[index].y += 3;
        }
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