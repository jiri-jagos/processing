int iWidth = 500;
int iHeight = 100;

float fCenterX = iWidth / 2;
float fCenterY = iHeight / 2;

int iBorderX = 20;
int iBorderY = 10;

int iMaxX = iWidth - iBorderX;
int iMaxY = iHeight - iBorderY;

int iDelta = 32;

//int iStepX = round(random(iDelta));
int iStepX = 1;
float fStepY;
float fNoiseX = random(iDelta);
float fNoiseY = random(iDelta);
int iX;
float fY = 50;

float fLastX = -999;
float fLastY = -999;

//void setup() {
  size(iWidth, iHeight);
  background(128);
  smooth();  

  stroke(255);
  strokeWeight(1);
  line(0, fCenterY, iWidth, fCenterY);
  noFill();
  rect(iBorderX, iBorderY, iWidth - 2 * iBorderX, iHeight - 2 * iBorderY);

  stroke(32);
  strokeWeight(2);
//}

//void draw() {
  for (iX = iBorderX; iX <= iMaxX; iX += iStepX) {

//    /** Chaotic */
//    fY = iBorderY + (iHeight - 2 * iBorderY) * random(1);

//    /** Less chaotic */
//    fStepY = random(iDelta) - iDelta / 2;
//    fY += fStepY;

    /** Perlin noise*/
    fY = iDelta + noise(fNoiseY) * iMaxY; 

    if (fLastX > -999) {
      line(iX, fY, fLastX, fLastY);
    }
    
    fLastX = iX;
    fLastY = fY;
    fNoiseX += (random(1) - 0.5);
    fNoiseY += (random(1) - 0.5);  

    iStepX = round(random(iDelta));  
  }
//}

