String pi;

int[] digits;
int index = 0;

void setup(){
  size(450, 450);
  pi = loadStrings("digitsOfPi.txt")[0];
  String[] sDigits = pi.split("");
  digits = int(sDigits);  
  background(20);
  stroke(255);
  noFill();
  translate(width / 2, height / 2);
  ellipse(0, 0, 400, 400);
}
void draw(){
  
  translate(width / 2, height / 2);
  int currentDigit = digits[index];
  int nextDigit = digits[index + 1];
  if(index < 1000000) {
    index++;
  }
  
  float diff = TWO_PI / 10;
  
  float a1 = map(currentDigit, 0, 10, 0, TWO_PI) + random(-diff / 2, diff / 2);
  float a2 = map(nextDigit, 0, 10, 0, TWO_PI) + random(-diff / 2, diff / 2);
  
  float x1 = 200 * cos(a1);
  float y1 = 200 * sin(a1);
  
  float x2 = 200 * cos(a2);
  float y2 = 200 * sin(a2);
  
  stroke(255, 255, 255, 100);
  line(x1, y1, x2, y2);
  
  
  
  
}