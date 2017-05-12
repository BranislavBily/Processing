
Segment tentacle;

void setup() {
  size(600, 400);
  tentacle = new Segment(300, 200, 100, 0); 
  
  Segment current = tentacle;
  for (int i = 0; i < 2; i++) {
    Segment next = new Segment(current, 100, 0);
    current.parent = next;
    current = next;
  }
}


void draw() {
  background(51);
  
  Segment next = tentacle;
  while (next != null) {
  
  tentacle.wiggle();
  tentacle.update();
  tentacle.show();
  next = next.parent;
  }
  
}