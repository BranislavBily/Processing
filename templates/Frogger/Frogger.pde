Frog frog;

float grid = 50;

void setup(){
  size(500, 500);
  frog = new Frog(width / 2 - grid / 2 , height - grid, grid);
} 

void draw(){
  background(0);
  
  frog.show();
}

void keyPressed() {
 switch(keyCode) {
   case UP: frog.move(0, -1);break;
   case DOWN: frog.move(0, 1);break;
   case RIGHT: frog.move(1, 0);break;
   case LEFT: frog.move(-1, 0);break;
 }
}