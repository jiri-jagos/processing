float x, y, w, dX, dY, theta, dTheta, cornerRadiusOffset, dynamicRadius, collisionTheta;

void setup() {
  size(600, 600);
  
  x = width / 2;
  y = width / 2;
  w = 150;
  dX = 2.1;
  dY = 1.2;
  dTheta = PI / 180;
  fill(0, 175, 175);
  noStroke();
}

void draw() {
  background(255, 177, 0);
  
  pushMatrix();
  translate(x, y);
  rotate(theta);
  rect(-w / 2, -w / 2, w, w);
  popMatrix();
  
  collide();
  
  x += dX;
  y += dY;
   
  theta += dTheta;
}

void collide() {
  
  cornerRadiusOffset = w / 2 / cos(PI / 4) - w / 2;
  dynamicRadius = abs(sin(collisionTheta) * cornerRadiusOffset);
  
  if ((x > (width - dynamicRadius - w / 2)) || (x < (dynamicRadius + w / 2))) {
    dX *= -1;
    dTheta *= -1;
  }
  
  if ((y > (height - dynamicRadius - w / 2)) || (y < (dynamicRadius + w / 2))) {
    dY *= -1;
    dTheta *= -1;
  }
  
  collisionTheta += dTheta * 2;
}

