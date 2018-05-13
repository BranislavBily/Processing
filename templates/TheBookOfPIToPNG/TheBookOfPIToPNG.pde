import processing.pdf.*;

String pi;

void setup(){
  size(700, 700);
  
  float cols = 1000;
  float rows = 1000;
  float w = width / cols;
  float h = height / rows;
  pi = loadStrings("digitsOfPi.txt")[0];
  //println(pi.length());
  
  colorMode(HSB, 1.0);
  int index = 0;
  for(float y = 0; y < height; y += w) {
    for(float x = 0; x < width; x += h) {
      String ch = "" +  pi.charAt(index);
      int digit = int(ch);
      float hue = digit / 9.0;
      fill(hue, 1, 1);
      noStroke();
      rect(x, y, w, h);
      //fill(255 - brightness);
      //textAlign(CENTER);
      //text(digit, x + w / 2, y + h);
      index++;
      if(index >= pi.length()) {
        index = pi.length() - 1;
      }
    }
  }
  
}