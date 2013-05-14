void setup () {
  size(500, 500);
  smooth();

  background(255);
  strokeWeight(5);


  float radius = width / 2;
  int centX = width / 2;
  int centY = height / 2;
  noFill();
  ellipse(centX, centY, radius*2, radius*2);

  float x1, y1, x2, y2;
  float noiseval = random(10);		

  float radVariance, thisRadius, rad;
//  beginShape();
//  fill(200, 200, 70, 77);
  int angMax = 1440;
  int iAlpha = 0;
  for (float ang = 0; ang <= angMax; ang ++) {


    noiseval += 0.05;
    radVariance = (random(radius / 8)) * customNoise(noiseval);
    thisRadius = radius + radVariance;
    rad = radians(ang);
    x1 = centX + (thisRadius * cos(rad));
    y1 = centY + (thisRadius * sin(rad));
    x2 = centX + (thisRadius * cos(rad + PI));
    y2 = centY + (thisRadius * sin(rad + PI));
    iAlpha = round(127 * sin(rad));
    
    strokeWeight(2);
    stroke(0,0,0,iAlpha);
    line(x1, y1, x2, y2);
//    curveVertex(x, y);
  }
//  endShape();
}

float customNoise(float value) {
//  int count = int((value % 12));
//  float retValue = pow(sin(value), count);
//  return retValue;

return(noise(value));
}


