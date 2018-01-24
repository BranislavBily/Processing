class Segment {
   PVector a;
   float len;
   float angle;
   float selfAngle;
   
   float xoff =  random(1000);
   
   Segment child = null;
   Segment parent = null;
   
   PVector b;
   
   Segment( Segment child_, float len_, float angle_) {
     child = child_;
     a = child.b.copy();
     len = len_;
     angle = angle_;
     selfAngle = angle;
     calculateB();
   }
   
   
   Segment( float x, float y, float len_, float angle_) {
     a = new PVector(x,y);
     len = len_;
     angle = angle_;
     calculateB();
     child = null;
   }
   
   void wiggle() {
     selfAngle = map(noise(xoff),0,1,-1,1);
     xoff += 0.01;
   }
   
   void update() {
     angle = selfAngle;
     if (child != null) {
       a = child.b.copy();
       angle += child.angle;
       
     }
     calculateB();
   }
   
   void calculateB() {
     float dx = len * cos(angle);
     float dy = len * sin(angle);
     
     b = new PVector(a.x+dx, a.y+dy);
     
     
   }
   
   void show(){
     stroke(255);
     strokeWeight(4);
     line(a.x,a.y,b.x,b.y);
     
   }
}