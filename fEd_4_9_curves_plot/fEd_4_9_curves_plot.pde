void setup() {
  size(640, 480);
  background(255);
  noFill();
  strokeWeight(4);
  translate(width/2, 0);
  
  float fx2Max = pow(width/2, 2);
  float fx2Scale = height / fx2Max;
  
  stroke(0,0,255);
  beginShape();
  for(int i = -width/2; i<width/2; i++)  {
    vertex(i, pow(i, 2) * fx2Scale);
  }
  endShape();
}
