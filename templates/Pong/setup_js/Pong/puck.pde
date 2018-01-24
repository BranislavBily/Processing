
class Puck {
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  float r = 12;
  int u = 0;

  Puck() {
    reset();
  }

  void checkPaddleLeft(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x - r < p.x + p.w/2) {
      if (x > p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xspeed = 7 * cos(angle) + random(2) + increase;
        yspeed = 7 * sin(angle) + random(2);
        x = p.x + p.w/2 + r;
        if (golden) {
          collisions++;
        }
        if (increase < 7) {
          increase = collisions;
        }
      }
    }
  }
  void checkPaddleRight(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x) {
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        xspeed = 7 * cos(angle) - random(2) - increase; 
        yspeed = 7 * sin(angle) + random(2);
        x = p.x - p.w/2 - r;
        if (golden) {
          collisions++ ;
        }
        if (increase < 5) {
          increase = collisions;
        }
      }
    }
  }




  void update() {
    x = x + xspeed;
    y = y + yspeed;
  }  

  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    xspeed = 5 * cos(angle);
    yspeed = 5 * sin(angle);

    if (random(1) < 0.5) {
      xspeed *= -1;
    }
  }

  void edges() {
    if (y < 12 || y > height -12) {
      yspeed *= -1;
    }

    if (x - r > width) {
      if ( random(1) < 0.5) {
        clap.play();
      } else {
        cheer.play();
      }
      leftscore++;
      reset();
    }

    if (x + r < 0) {
      if ( random(1) < 0.5) {
        clap.play();
      } else {
        cheer.play();
      }
      rightscore++;
      reset();
    }
  }


  void show() {
    fill(255);
    if ( golden) {
      fill(255, 255, 0);
    }
    ellipse(x, y, r*2, r*2);
  }
}