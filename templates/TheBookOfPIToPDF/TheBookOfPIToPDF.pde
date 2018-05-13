import processing.pdf.*;

String pi;

void setup(){
  size(700, 700, PDF, "bookOfPi.pdf");
  pi = loadStrings("digitsOfPi.txt")[0];
  PGraphicsPDF pdf = (PGraphicsPDF) g;
  
  int cols = 100;
  int rows = 100;
  float w = float(width / cols);
  float h = float(height / rows);
  
  float totalPages = pi.length() / (cols * rows);
  
  for(int i = 0; i < totalPages; i++) {  
    colorMode(HSB, 1.0);
    int index = 0;
    for(float y = 0; y < height; y += w) {
      for(float x = 0; x < width; x += h) {
        String ch = "" +  pi.charAt(index);
        int digit = int(ch);
        float hue = digit / 10.0;
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
    println("Page " + i + " complete!");
    pdf.nextPage();
  }
  exit();
  println("Hi");
  
}