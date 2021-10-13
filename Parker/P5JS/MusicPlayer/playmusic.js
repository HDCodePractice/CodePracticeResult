let song;

function setup() {
  song = loadSound('../assets/crabrave.mp3');
  createCanvas(400, 400);
  background(255, 0, 0);
}

function mousePressed() {
  if (song.isPlaying()) {
    song.stop();
    background(255, 0, 0);
  } else {
    song.play();
    background(0, 255, 0);
  }
}