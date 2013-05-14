float[] aRadians = new float[360];

float[] aSin = new float[360];
float[] aCos = new float[360];

float deg2rad(float fDegrees) {
  float fRadians = radians(fDegrees);
  
  return(fRadians);
}

float rad2deg(float fRadians) {
  float fDegrees = degrees(fRadians);
  
  return(fDegrees);
}

void setup() {
  for(int I = 0; I < 360; I++) {
    float fRadians = deg2rad(I);
    aRadians[I] = fRadians;
    
    aSin[I] = sin(fRadians);
    aCos[I] = cos(fRadians);
  }  
  
  for(int I = 0; I < 360; I++) {
//    println(I + " degrees is " + aRadians[I] + " Radians.");
    println(I + ": sin is " + aSin[I]);  
    println(I + ": cos is " + aCos[I]);
  } 
}
