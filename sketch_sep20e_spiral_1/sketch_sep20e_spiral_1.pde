int iWidth = 400;
int iHeight = 400;

float fCenterX = iWidth / 2;
float fCenterY = iHeight / 2;

int iBorderX = 20;
int iBorderY = 20;

int iMaxX = iWidth - iBorderX;
int iMaxY = iHeight - iBorderY;

float fDelta = 10;

int iCycles = 7;
int iAngle = 0;
int iAngleMax = iCycles * 360;
//float fAmplitude = round((iHeight - iBorderX * 2) / 3);
float fAmplitude = round(10);
float fOmega = random(fDelta) - (fDelta / 2);
float fOmegaNoise = noise(fOmega);
float fRadius = 0;

int iPhase = - iBorderX;

float fRadians = 0;

float fX;
float fY;
float fLastX = 0;
float fLastY = 0;

int iColorMax = 255;
float fRed = 0;
float fGreen = 0;
float fBlue = 0;

size(iWidth, iHeight);
background(128);
smooth();  

stroke(255);
strokeWeight(1);
line(0, fCenterY, iWidth, fCenterY);
line(fCenterX, 0, fCenterX, iHeight);
noFill();
rect(iBorderX, iBorderY, iWidth - 2 * iBorderX, iHeight - 2 * iBorderY);

strokeWeight(10);

for (iAngle = 0; iAngle < iAngleMax; iAngle ++) {
  
  fRadians = radians(fOmega*iAngle);

  fRed = iColorMax * sin(fRadians);
  fGreen = iColorMax * cos(fRadians);
  fBlue = iColorMax * sin(pow(fRadians, 3));
  stroke(fRed, fGreen, fBlue, 11);
  
  fRadius = fAmplitude + fAmplitude * noise(fDelta);
  fX = fRadius * cos(fRadians) + fCenterX;
  fY = fRadius * sin(fRadians) + fCenterY;
  
  point(fX, fY);
  line(fX, fY, fLastX, fLastY);
  fLastX = fX;
  fLastY = fY;

//  line(fCenterX, fCenterY, fX, fY);
  fDelta += (random(1) - 0.5) / 10;
  
  fAmplitude += 0.04;
}

