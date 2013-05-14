int iWidth = 400;
int iHeight = 400;

float fCenterX = iWidth / 2;
float fCenterY = iHeight / 2;

int iBorderX = 20;
int iBorderY = 20;

int iMaxX = iWidth - iBorderX;
int iMaxY = iHeight - iBorderY;

int iAmplitude = round((iHeight - iBorderX * 2) / 2);
int iPhase = - iBorderX;

int iAngle = 360;
float fRadians = 0;

float fX;
float fY;

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

strokeWeight(1);

while (iAngle >= 0) {
  
  fRadians = radians(iAngle);

  fRed = iColorMax * sin(pow(fRadians, iAngle % 9 + 1));
  fGreen = iColorMax * cos(pow(fRadians, 2 * iAngle % 5 + 1)) * noise(iAngle);
  fBlue = iColorMax * sin(pow(fRadians, 3)) * noise(iAngle);
  stroke(fRed, fGreen, fBlue);
  
  fX = iAmplitude * cos(fRadians) + fCenterX;
  fY = iAmplitude * sin(fRadians) + fCenterY;
  
  point(fX, fY);
  line(fCenterX, fCenterY, fX, fY);
  
  iAngle --;
}

