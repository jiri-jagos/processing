float x, y, radius, cellW, cellH;

void setup(){
  size(800, 800);
  background(255);
  x=width / 2;
  y=height / 2;
  radius = width / 2;
  pushMatrix();
  translate(x, y);
  int pts = 6000;
  int rots = 100;
  float fall_off = .9999;

  cellW = cellH = 2; 
  
  drawSpiral(pts, rots, radius, fall_off);
  popMatrix(); 
  
  drawFrame();
}

void drawSpiral(float pts, int rots, float radius, float fallOff) {
  float x = 0;
  float y = 0;
  float theta = 0;
  for(int i = 0; i < pts; i++) {
    x = cos(theta) * radius;
    y = sin(theta) * radius;
    
    pushMatrix();
    translate(x, y);
    if (isPrime(i)) {
      primeCell(cellW, cellH);
    } else {
//      compositeCell(cellW, cellH);
    }
    popMatrix();

    radius *= fallOff;
    theta += TWO_PI * rots / pts;
  }
}

void primeCell(float w, float h) {
  fill(255, 0, 0);
  ellipse (0, 0, w, h);
}

void compositeCell(float w, float h) {
  fill(255);
  rect(-w / 2, -h / 2, w, h);
}

boolean isPrime(int val) {
  if (val < 2) {
    return false;
  }
  
  if (val % 2 == 0) {
    return false;
  }
  
  for (int i = round(val / 2); i > 2; i--) {
    if (val % i == 0) {
      return false;
    }
  }
  
  return true;
}
void drawFrame() {
  noFill();
  strokeWeight(20);
  rect(x - radius - 1, y - radius - 1, radius * 2, radius * 2);
}
