void setup() {

  int iWidth = 500;
  int iHeight = 500;

  size(iWidth, iHeight);
  smooth();
  background(255);

  stroke(0, 0, 0);
  strokeWeight(3);

  drawCircle();
}

void drawCircle() {
  int iDegrees = 360;
  int iRadius = round((width + height) / 4);
  float aSin[] = new float[iDegrees];

  int iI = 0;

  for (iI = 0; iI < iDegrees; iI ++) {
    aSin[iI] = sin(radians(iI));
  }

  float fCenterX = width / 2;
  float fCenterY = height / 2;

  float fRed, fGreen, fBlue, fX, fY;

  int iRedPhase = 0;
  int iGreenPhase = round(iDegrees / 3);
  int iBluePhase = round(2 * iDegrees / 3);

  int iAmplitude = 255;

  for (iI = 0; iI < iDegrees; iI ++) {
    fRed = iAmplitude * aSin[(1 * (iRedPhase + iI)) % iDegrees];
    fGreen = iAmplitude * aSin[(1 * (iGreenPhase + iI)) % iDegrees];
    fBlue = iAmplitude * aSin[(1 * (iBluePhase + iI)) % iDegrees];

    fX = fCenterX + iRadius * aSin[iI];
    fY = fCenterY + iRadius * aSin[(iI + 90) % iDegrees];
    stroke(fRed, fGreen, fBlue, 100);
    line(fCenterX, fCenterY, fX, fY);
  }
}

