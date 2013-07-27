void star(int pointCount, float innerRadius, float outerRadius) {
  float theta = 0.0;
  int vertexCount = pointCount * 2;
  float dTheta = TWO_PI / vertexCount;
  float tempRadius = 0.0;
  float x = 0.0, y = 0.0;
  
  beginShape();
  for(int i = 0; i < pointCount; i++) {
    for (int j = 0; j < 2; j++) {
      tempRadius = innerRadius;
      
      if( j % 2 == 0) {
        tempRadius = outerRadius;
      }
      
      x = cos(theta) * tempRadius;
      y = sin(theta) * tempRadius;
      
      vertex(x, y);
      
      theta += dTheta;
    } 
  }
  endShape(CLOSE);
}
