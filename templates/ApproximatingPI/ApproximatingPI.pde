float r = 200;

double total = 0;
double circle = 0;

double recordPI = 0;
double recordDiff = 2;

void setup() {
  size(405, 405);
  
  background(0);
  translate(width / 2, height / 2);
  stroke(255);
  strokeWeight(1);
  noFill();
  
  ellipse(0, 0, r * 2, r * 2);
  rectMode(CENTER);
  rect(0, 0, r * 2, r * 2);
  
  
}

void draw() {
  translate(width / 2, height / 2);
  
  
  for(int i = 0; i < 20000; i++){
    float x = random(-r, r);
    float y = random(-r, r);
    total++;
  
    strokeWeight(0.5);
    double distance = (double)x * (double)x + (double)y * (double)y;
    if(distance < (double)r * (double)r) {
      stroke(255, 0, 0, 100);
      circle++;
    } else {
      stroke(255, 255 , 255, 100);
    }
  
    point(x, y);
  }
  
  double pi = 4 * (circle / total);
  double diff = Math.abs(Math.PI - pi);
  if(diff < recordDiff) {
    recordDiff = diff;
   recordPI = pi;
   println(recordPI);
   
  }
  
  //println(pi);
  
  
  
  
  
}