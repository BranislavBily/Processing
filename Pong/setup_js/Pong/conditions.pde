boolean golden = false;


void checkWinner() {
  if ( leftscore == rightscore) {
    golden = true;
    fill(255, 255, 0);
    if( seconds < 5){
     text("GOLDEN GOAL!", width / 2 - 112, 80); // polka textu je 7*16
    }
    text("+", width /2 - 64, 28);
} else if ( leftscore > rightscore) {
    fill(255);
    text("LEFT PLAYER WINS!", width /2 - 150, 100);
    stop();
  } else {
    fill(255);
    text("RIGHT PLAYER WINS!", width /2 - 150, 100);
    stop();
  }
}