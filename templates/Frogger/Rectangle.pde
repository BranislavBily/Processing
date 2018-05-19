class Rectangle{
  float x, y, w, h;
  
  Rectangle(float x, float y, float w, float h) {
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   
  }
  
  boolean intersects(Rectangle another){
   float left = x;
   float right = x + w;
   float top = y;
   float bottom = y + h;
   
   float oleft = another.x;
   float oright = another.x + another.w;
   float otop = another.y;
   float obottom = another.y + another.h;
   
    return !(left < oright ||
      right < oleft ||
      top > obottom ||
      bottom < otop);
  }
  
}