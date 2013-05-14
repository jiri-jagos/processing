import processing.opengl.*;

float xDelta, xStart, xNoise, yDelta, yStart, yNoise;

void setup() {
  size(400, 300, OPENGL);
  background(0);
  sphereDetail(8);
  
  noStroke();
  
  xStart = random(-10, 10);
  yStart = random(-10, 10);

}

void draw() {
  background(0);
  
  xDelta = random(-1, 1);
  yDelta = random(-1, 1);
  
  xStart += xDelta;
  yStart += yDelta;
  
  xNoise = xStart;
  yNoise = yStart;
  
  for(int y = 0; y <= height; y += 5) {
    
    yNoise += yDelta;
    
    xNoise = xStart;
    for(int x = 0; x <= height; x += 5) {
      xNoise += xDelta;
      
      drawPoint(x, y, noise(xNoise * yNoise, yNoise * xNoise));
    }    
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, 250 -y, -y);
  
  float sphereSize = noiseFactor * noiseFactor * 35;
  float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  
  fill(grey, alph);
  sphere(sphereSize);
  
  popMatrix();
}

