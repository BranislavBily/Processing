/*
Million digits of PI: https://www.piday.org/million/
Take digits from there and change the directories
*/

import processing.pdf.*;

String pi;

void setup(){
  size(700, 700, PDF, "C:/Users/Branislav/Documents/PI/numberOfPI/bookOfPI.pdf");
  pi = loadStrings("C:/Users/Branislav/Documents/PI/digitsOfPI.txt")[0];
  PGraphicsPDF pdf = (PGraphicsPDF) g;
  background(255);
  
  int cols = 10;
  int rows = 10;
  float w = float(width / cols);
  float h = float(height / rows);
  
  float totalPages = pi.length() / (cols * rows) - 9990;
  
  for(int i = 0; i < totalPages; i++) {  
    int index = 0;
    for(float y = 0; y < height; y += w) {
      for(float x = 0; x < width; x += h) {
        String ch = "" +  pi.charAt(index);
        int digit = int(ch);
        float hue = digit / 10.0;
        fill(hue, 1, 1);
        noStroke();
        textAlign(CENTER);
        text(digit, x + w / 2, y + h / 2);
        index++;
        if(index >= pi.length()) {
          index = pi.length() - 1;
        }
      }
    }
    println("Page " + (i+1) + " complete!");
    pdf.nextPage();
  }
  exit();
  println("It worked!");
}