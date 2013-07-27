void setup() {
  size(400, 400);
  background(255);
  int polyCount = 20;
  noFill();
  int sideCount = 0;
  float innerRadius = 0.0;
  float outerRadius = 0.0;
  float rotation = 0.0;
  
  for (int i = 0; i < polyCount; i++) {
    sideCount = int (random(4,16));
    outerRadius = random(10, 20) + 10;
    innerRadius = outerRadius * 0.5;
    rotation = random(TWO_PI);
    
    pushMatrix();
    
    translate(random(width), random(height));
    rotate(rotation);
    star(sideCount, innerRadius, outerRadius);
    
    popMatrix();
  }
}
