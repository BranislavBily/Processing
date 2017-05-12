import peasy.*;

ArrayList<Firework> fireworks;

PVector gravity = new PVector(0, 0.2);

PeasyCam cam;

void setup() {
  fullScreen(P3D);
  //size(640, 360, P3D);
  cam = new PeasyCam(this, 500);
  fireworks = new ArrayList<Firework>();
  colorMode(HSB);
  background(51);
}

void draw() {
  if (random(1) < 0.5) {
    fireworks.add(new Firework());
  }
  //fill(51, 50);
  //noStroke();
  //rect(0,0,width,height);
  background(0);

  
  for (int i = fireworks.size()-1; i >= 0; i--) {
    Firework f = fireworks.get(i);
    f.run();
    if (f.done()) {
      fireworks.remove(i);
    }
  }
  
  
  
}