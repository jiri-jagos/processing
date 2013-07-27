class MandalaContainer {
  
  int rows = 10;
  int cols = 10;
  int row, col;
  int count = rows * cols;
  float mandalaWidth = width / cols;
  float mandalaHeight = height / rows;
  
  public simpleMandala[] mandalas;
  
  MandalaContainer(int rows, int cols) {
    this.rows = rows;
    this.cols = cols;
    
    this.count = rows * cols;
    this.mandalaWidth = width / cols;
    this.mandalaHeight = height / rows;
    
    this.mandalas = new simpleMandala[count];
    for (int i = 0; i < count; i++) {
      row = floor(i / rows);
      col = i % cols;
      
      this.mandalas[i] = new simpleMandala(
        new PVector(row * mandalaWidth, col * mandalaHeight),
        row + col + 2,
        row * col + int(random(5,10)),
        mandalaWidth / 2,
        random(0.3, 0.7),
        random(mandalaWidth / rows, mandalaWidth / 2),
        random((row + 1)/(col + 1)),
        random((col + 1)/(row + 1)),
        random(10, 50),
        random((col + row + 1)/((row + 1) * (col + 1)))
      );
      
      mandalas[i].display();
    }
  }
}
