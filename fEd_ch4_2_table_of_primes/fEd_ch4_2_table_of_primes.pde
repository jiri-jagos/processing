void setup() {
  size(800, 600);
  background(0);
  float cols = 400;
  float rows = 400;
  float cellW = width / cols;
  float cellH = height / rows;
  noStroke();
  
  for (int i = 0, k = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      pushMatrix();
      translate(cellW * j + cellW / 2, cellH * i + cellH / 2);
      if (isPrime(k)) {
        primeCell(cellW, cellH);
      } else {
        compositeCell(cellW, cellH);
      }
      popMatrix();
      k++;
    }
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
