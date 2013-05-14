float xStart, xNoise, yStart, yNoise;
float xDelta, yDelta, xStartNoise, yStartNoise;

void setup() {
  size(300, 300);
  smooth();
  background(255);
  frameRate(12);
  
  xStartNoise = random(20);
  yStartNoise = random(20);
  
  xStart = random(10);
  yStart = random(10);
}

void draw() {
  background(255);
  
  xStartNoise += 0.01;
  yStartNoise += 0.01;
  
  xDelta = 0.25 - (0.5 * noise(xStartNoise));
  yDelta = 0.25 - (0.5 * noise(yStartNoise));
  
  xStart += xDelta;
  yStart += yDelta;
  
  xNoise = xStart;
  yNoise = yStart;
  
  for (int y = 0; y < height; y += 5) {
    yNoise += 0.1;
    
    xNoise = xStart;
    for (int x = 0; x <= width; x+= 5) {
      xNoise += 0.1;
      
      drawPoint(x, y, noise(xNoise, yNoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * noiseFactor * radians(180 - noiseFactor * 360));
  stroke(0, 150);
  line(0, 0, sqrt(sq(xNoise) + sq(yNoise)), 0);
  popMatrix();
}
