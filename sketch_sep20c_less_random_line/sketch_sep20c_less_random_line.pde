int iWidth = 740;
int iHeight = 100;

float fCenterX = iWidth / 2;
float fCenterY = iHeight / 2;

int iBorderX = 20;
int iBorderY = 10;

int iMaxX = iWidth - iBorderX;
int iMaxY = iHeight - iBorderY;

int iAmplitude = round(iHeight / 2);
int iPhase = - iBorderX;

int iStepX = 5;
float fStepY;

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
    
    fY = iAmplitude * (1 - pow(random(1), 5));
    if (fLastX > -999) {
      line(iX, fY, fLastX, fLastY);
    }

    fLastX = iX;
    fLastY = fY;
  }
//}

//float fCustomRandom() {
//  float fReturn = 1 - pow(random(1), 5);
//  return(fReturn);
//}
  

