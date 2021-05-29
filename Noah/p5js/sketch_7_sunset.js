let times = [
    [155,222,218], // 早晨
    [66,196,251], // 中午
    [241,203,2], // 黄昏
    [85,102,158], // 晚上
    [63,49,118], // 夜晚
    [158,132,194]]; // 临晨

var time;
var startingMinute = minute();
var startingHour = hour();

function setup() {
    createCanvas(windowWidth, windowHeight-50);
    startingMinute = minute();
    startingHour = hour();
    time = 0;
}

function draw() {
    let position = {
        6: [80,height/2],
        7: [80+(width-160)/12,height/2-((height-105)/12)],
        8: [80+2*((width-160)/12),height/2-2*((height-105)/12)],
        9: [80+3*((width-160)/12),height/2-3*((height-105)/12)],
        10: [80+4*((width-160)/12),height/2-4*((height-105)/12)],
        11: [80+5*((width-160)/12),height/2-5*((height-105)/12)], 
        12: [80+6*((width-160)/12),height/2-6*((height-105)/12)],
        13: [80+7*((width-160)/11),height/2-5*((height-105)/12)], 
        14: [80+8*((width-160)/11),height/2-4*((height-105)/12)],
        15: [80+9*((width-160)/11),height/2-3*((height-105)/12)],
        16: [80+10*((width-160)/11),height/2-2*((height-105)/12)],
        17: [80+11*((width-160)/11),height/2],
        18: [80,height/2],
        19: [80+(width-160)/12,height/2-((height-105)/12)],
        20: [80+2*((width-160)/12),height/2-2*((height-105)/12)],
        21: [80+3*((width-160)/12),height/2-3*((height-105)/12)],
        22: [80+4*((width-160)/12),height/2-4*((height-105)/12)],
        23: [80+5*((width-160)/12),height/2-5*((height-105)/12)], 
        0: [80+6*((width-160)/12),height/2-6*((height-105)/12)],
        1: [80+7*((width-160)/11),height/2-5*((height-105)/12)], 
        2: [80+8*((width-160)/11),height/2-4*((height-105)/12)],
        3: [80+9*((width-160)/11),height/2-3*((height-105)/12)],
        4: [80+10*((width-160)/11),height/2-2*((height-105)/12)],
        5: [80+11*((width-160)/11),height/2],
    };
    if ([6,7,8,9,10,11].includes(startingHour)) {
        time = 0;
        fill(254,243,99);
    } else if ([12,13,14,15].includes(startingHour)) {
        time = 1;
        fill(241,203,2);
    } else if ([16,17].includes(startingHour)) {
        time = 2;
        fill(247,80,59);
    } else if ([18,19,20,21,22].includes(startingHour)) {
        time = 3;
        fill(250,250,250);
    } else if ([23,0,1,2].includes(startingHour)) {
        time = 4;
        fill(250,250,250);
    } else if ([3,4,5].includes(startingHour)) {
        time = 5;
        fill(250,250,250);
    }

    background(times[time]);
    circle(position[startingHour][0],position[startingHour][1],75);
    fill(169,173,176);
    rect(width/2-50,height*0.75,100,height*0.75);
    fill(41,163,248);
    triangle(width/2-75,height*0.75,width/2+75,height*0.75,width/2,height*0.75-100);
    fill(168,86,20);
    circle(width/2,height*0.75+50,75);
    fill(5,5,5);
    circle(width/2,height*0.75+50,67);
    fill(250,250,250);
    if (startingMinute < 10) {
        text(startingHour + ':0' + startingMinute,width/2-15,height*0.75+50);
    } else {
        text(startingHour + ':' + startingMinute,width/2-15,height*0.75+50);
    }
    if (startingMinute == 59) {
        startingMinute = 0;
        startingHour += 1;
    } else {
        startingMinute += 1;
    }
    if (startingHour > 23) {
        startingHour = 0;
    } 
}

function windowResized() {
    setup();
}