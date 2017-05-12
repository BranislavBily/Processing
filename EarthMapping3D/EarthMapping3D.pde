float angle;

Table table,table7,table1,table0;

PImage world;
PShape globe;
int r = 200;

 

void setup() {
  size(600,600, P3D);
  table = loadTable("database/all_month.csv", "header");
  table7 = loadTable("database/all_week.csv", "header");
  table1 = loadTable("database/all_day.csv", "header");
  table0 = loadTable("database/all_hour.csv", "header");
  world = loadImage("img/world.jpg");
  
  
  noStroke();
  globe = createShape(SPHERE,r);
  globe.setTexture(world);
  
}

void draw() {
  background(51);
  translate(width*0.5, height*0.5);
  rotateY(angle);
  angle += 0.025;
  
  fill(200);
  lights();
  noStroke();
  shape(globe);
  
  for ( TableRow row : table.rows()) {
    float lat = row.getFloat("latitude");
    float lon = row.getFloat("longitude");
    float mag = row.getFloat("mag");
    
    float theta = radians(lat) + PI/2;
    float phi = radians(lon) + PI;
  
    float x = r * sin(theta) * cos(phi);
    float y = -r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    PVector pos = new PVector (x, y, z);
    
    float h = pow(10, mag);
    float maxh = pow(10, 7);
    h = map (h, 0 , maxh, 10, 100);
    
    PVector xaxis = new PVector(1,0,0);
    float angleb = PVector.angleBetween(xaxis, pos);
    PVector raxis = xaxis.cross(pos);
    
    pushMatrix();
    translate(x,y,z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    box(h,5,5);
    fill(0,255,0);
    popMatrix();
  }
  for ( TableRow row : table7.rows()) {
    float lat = row.getFloat("latitude");
    float lon = row.getFloat("longitude");
    float mag = row.getFloat("mag");
    
    float theta = radians(lat) + PI/2;
    float phi = radians(lon) + PI;
  
    float x = r * sin(theta) * cos(phi);
    float y = -r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    PVector pos = new PVector (x, y, z);
    
    float h = pow(10, mag);
    float maxh = pow(10, 7);
    h = map (h, 0 , maxh, 10, 100);
    
    PVector xaxis = new PVector(1,0,0);
    float angleb = PVector.angleBetween(xaxis, pos);
    PVector raxis = xaxis.cross(pos);
    
    pushMatrix();
    translate(x,y,z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    box(h,5,5);
    fill(246,255,0);
    popMatrix();
  }
  for ( TableRow row : table1.rows()) {
    float lat = row.getFloat("latitude");
    float lon = row.getFloat("longitude");
    float mag = row.getFloat("mag");
    
    float theta = radians(lat) + PI/2;
    float phi = radians(lon) + PI;
  
    float x = r * sin(theta) * cos(phi);
    float y = -r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    PVector pos = new PVector (x, y, z);
    
    float h = pow(10, mag);
    float maxh = pow(10, 7);
    h = map (h, 0 , maxh, 10, 100);
    
    PVector xaxis = new PVector(1,0,0);
    float angleb = PVector.angleBetween(xaxis, pos);
    PVector raxis = xaxis.cross(pos);
    
    pushMatrix();
    translate(x,y,z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    box(h,5,5);
    fill(255,132,0);
    popMatrix();
  }
  for ( TableRow row : table0.rows()) {
    float lat = row.getFloat("latitude");
    float lon = row.getFloat("longitude");
    float mag = row.getFloat("mag");
    
    float theta = radians(lat) + PI/2;
    float phi = radians(lon) + PI;
  
    float x = r * sin(theta) * cos(phi);
    float y = -r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    PVector pos = new PVector (x, y, z);
    
    float h = pow(10, mag);
    float maxh = pow(10, 7);
    h = map (h, 0 , maxh, 10, 100);
    
    PVector xaxis = new PVector(1,0,0);
    float angleb = PVector.angleBetween(xaxis, pos);
    PVector raxis = xaxis.cross(pos);
    
    pushMatrix();
    translate(x,y,z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    box(h,5,5);
    fill(255,0,0);
    popMatrix();
  }
  
  
  
}