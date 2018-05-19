/*
Million digits of PI: https://www.piday.org/million/
Take digits from there and change the directories
Its really slow tho give it a while
*/

String pi;
PGraphics canvas;

void setup() {
  size(800, 800);
  canvas = createGraphics(8000, 8000);

  float cols = 1000;
  float rows = 1000;

  pi = loadStrings("C:/Users/Branislav/Documents/PI/digitsOfPI.txt")[0];
  canvas.beginDraw();
  canvas.colorMode(HSB, 1.0);
  float w = canvas.width/cols;
  float h = canvas.height/rows;
  int index = 0;
  for (float y = 0; y < canvas.height; y += h) {
    for (float x = 0; x < canvas.width; x += w) {
      String s = "" + pi.charAt(index);
      int digit = int(s);
      float hue = digit/9.0;
      canvas.fill(hue, 1, 1);
      canvas.noStroke();
      canvas.rect(x, y, w, h);
      index++;
      if (index >= pi.length()) {
        index = pi.length() - 1;
      }
    }
  }
  canvas.endDraw();
  image(canvas, 0, 0, width, height);
  canvas.save("C:/Users/Branislav/Documents/PI/PNGOfPI/PI.png");
  println(index);
}