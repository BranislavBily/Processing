import processing.sound.*;

Puck puck;

SoundFile clap;
SoundFile cheer;

Paddle left;
Paddle right;

int leftscore = 0;
int rightscore = 0;

int collisions = 0;
int increase = 2;


int lenght = 4; // pocet sekund ako dlho sa hraje hra
int startTime, seconds = lenght;



void setup() {
  background(0);
  size(600, 400); 
  clap = new SoundFile(this, "clap.mp3");
  cheer = new SoundFile(this, "cheer.mp3");
  puck = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
  startTime = millis() / 1000 + seconds;
  textSize(16);
}

void draw() {
  switch(state) {
    case MAIN_MENU: 
      break;
    case GAME_MENU:
      break;
    case GAME:
      background(0);
      break;
    case PAUSE:
      break;
  }
  background(0);
 
  puck.checkPaddleRight(right);
  puck.checkPaddleLeft(left);

  left.show();
  right.show();
  left.update();
  right.update();

  puck.update();
  puck.edges();
  puck.show();
  
  math();
  
  fill(255);
  textSize(32);
  text(leftscore, 32, 40);
  text(rightscore, width-64, 40);
  
  
}

void math() {
    seconds = startTime - millis()/1000;
    int min = floor(seconds / 60);
    seconds = seconds % 60;
    if (seconds < 0){
      seconds = millis()/1000 - lenght;
    }
    text(nf(min, 2) + ":" + nf(seconds, 2),  width/2 - 40, 30);
    if ( millis() > lenght * 1000) {
      checkWinner();
    }
}

void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if (key == 'w') {
    left.move(-10);
  } else if (key == 's') {
    left.move(10);
  }

  if (keyCode == UP) {
    right.move(-10);
  } else if (keyCode == DOWN) {
    right.move(10);
  }
}