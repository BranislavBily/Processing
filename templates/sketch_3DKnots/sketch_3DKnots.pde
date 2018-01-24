float angle = 0;

Knot knot1;
Knot knot2;
Knot knot3;

float beta = 0;

class Knot {
  float r;
  float theta;
  float phi;
  float x;
  float y;
  float z;
  float posX;
  float posY;
  ArrayList<PVector> vectors = new ArrayList<PVector>();
  
  Knot(int tempX, int tempY){
    posX = tempX;
    posY = tempY;
  }
  
  void calculate(){
    r = 100*(0.8 + 1.6 * sin(6 * beta));
    theta = 2 * beta;
    phi = 0.6 * PI * sin(12 * beta);
    x = r * cos(phi) * cos(theta);
    y = r * cos(phi) * sin(theta);
    z = r * sin(phi);
    vectors.add(new PVector(x,y,z));    
  }
  
  void paint(){
    translate(posX, posY);
    noFill();
    strokeWeight(4);
    beginShape();
    for (PVector v : vectors) {
      float d = v.mag();
      stroke(255, d, 255);
      vertex(v.x, v.y, v.z);
      
    }
    endShape();
  }
}

void setup() {
  size(1200, 800, P3D);
  knot1 = new Knot(width / 2, height);
  knot2 = new Knot(100, 600);
  knot3 = new Knot(200, 600);
}

void draw() {
  background(0);
  //rotateY(90);
  //angle += 0.01;
  knot1.calculate();
  knot1.paint();
  knot2.calculate();
  knot2.paint();
  knot3.calculate();
  knot3.paint();
  beta += 0.01;
  

 
}