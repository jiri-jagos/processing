int iSizeX = 500;
int iSizeY = 500;

int iDelta = 70;

float fCenterX = iSizeX / 2;
float fCenterY = iSizeY / 2;

size(iSizeX, iSizeY);
smooth();
background(230, 230, 230);
stroke(130, 0, 0);
strokeWeight(1);
fill(0, 0); 

line(fCenterX - iDelta, fCenterY - iDelta, fCenterX + iDelta, fCenterY + iDelta);
line(fCenterX + iDelta, fCenterY - iDelta, fCenterX - iDelta, fCenterY + iDelta);
rect(fCenterX - iDelta, fCenterY - iDelta, iDelta * 2, iDelta * 2);

stroke(0, 125);
strokeWeight(6);
fill(255, 150);
ellipse(width/2, height/2, 50, 50);
