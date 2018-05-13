float r1 = 150;
float r2 = 250;
float m1 = 20;
float m2 = 20;

float ang1 = PI/8;
float ang2 = PI/2;

float ang1_vel = 0;
float ang2_vel = 0;

float px = -1;
float py = -1;

float cx;
float cy;



float g = 1;

PGraphics trails;

void setup() {
  size(900, 600);
  cx = width / 2;
  cy = 50;
  
  colorMode(HSB, 1.0);
  trails = createGraphics(width, height);
  trails.beginDraw();
  trails.background(0);
  trails.endDraw();
}

void draw() {
  //background(0);
  image(trails, 0, 0);
  stroke(255);
  strokeWeight(2);

  translate(cx, cy);

  float x1 = r1 * sin(ang1);
  float y1 = r1 * cos(ang1);  
  line(0, 0, x1, y1);
  fill(y1, width, width);
  ellipse(x1, y1, m1, m1);
  
  

  float x2 = r2 * sin(ang2) + x1;
  float y2 = r2 * cos(ang2) + y1;
  line(x1, y1, x2, y2);
  fill(y2, width, width);
  ellipse(x2, y2, m2, m2);
  
  
  
  
  float ang1_acc = calculateAccAngle1();
  float ang2_acc = calculateAccAngle2();

  applyPhysics(ang1_acc, ang2_acc);
  
  drawTrails(x2, y2);
  
  px = x2;
  py = y2;
  
  
}

void applyPhysics(float ang1_acc, float ang2_acc) {
  ang1_vel += ang1_acc;
  ang2_vel += ang2_acc;
  
  ang1_vel *= 0.999;
  ang2_vel *= 0.999;
  
  ang1 += ang1_vel;
  ang2 += ang2_vel;
  
  
  
}

void drawTrails(float x2, float y2) { 
  trails.beginDraw();
  trails.translate(cx, cy);
  trails.stroke(x2 * 2, width, y2 * 2, 50);
  trails.strokeWeight(3);
  if(frameCount > 1) {
    trails.line(px, py, x2, y2);
  }
  trails.endDraw();
}

float calculateAccAngle1() {
  // formula from https://www.myphysicslab.com/pendulum/double-pendulum-en.html
  // separated into blocks for better readability
  float num1 = -g * (2 * m1 + m2) * sin(ang1);
  float num2 = -m2 * g * sin(ang1-2*ang2);
  float num3 = -2*sin(ang1-ang2)*m2;
  float num4 = sq(ang2_vel) * r2 + sq(ang1_vel) * r1 *cos(ang1-ang2);
  float den = r1 * (2*m1+m2-m2*cos(2*ang1-2*ang1));
  
  return (num1 + num2 + num3*num4) / den;
}

float calculateAccAngle2() {
  float num1 = 2 * sin(ang1-ang2);
  float num2 = (sq(ang1_vel) * r1 * (m1 + m2));
  float num3 = g * (m1 + m2) * cos(ang1);
  float num4 = sq(ang2_vel) * r2 * m2 * cos(ang1-ang2);
  float den = r2 * (2*m1+m2-m2*cos(2*ang1-2*ang2));
  
  return num1 * (num2 + num3 + num4) / den;
}