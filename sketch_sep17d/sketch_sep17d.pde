int diam = 10;
float centX, centY;
void setup() {
  size(500, 500);
  frameRate(24);	
  smooth();
  background(180);
  
  centX = width/2;
  centY = height/2;
  
  stroke(0);
  strokeWeight(5);
  fill(255, 50);
}
	
		
	
void draw() {
  if (diam <= 400) {
    diam += 10;
  } else {
    diam -= 10;
  }

  background(180);  
  ellipse(centX, centY, diam, diam);
}