int alive = 1;
int dead = 0;
int lived = -1;

int memoryWidth = 80;
int memoryHeight = 67;
int fountainWidth = 40;
int fountainHeight = 27;
int xPadding = (memoryWidth-fountainWidth)/2;
int yPadding = (memoryHeight-fountainHeight)/2;

Cell[][] cells = new Cell[memoryWidth][memoryHeight];

void setup() {
  size(79, 54);
  background(128);
  frameRate(3);

  for (int x = 0; x < memoryWidth; x++) {
    for (int y = 0; y < memoryHeight; y++) {
      cells[x][y] = new Cell(x, y);
    }
  }

  initPreset("morse");

  for (int x = 0; x < memoryWidth; x++) {
    for (int y = 0; y < memoryHeight; y++) {
      Cell current = cells[x][y];
      current.displayAge();
      current.displayState();
    }
  }
}

void draw() {
  //saveFrame("frame-#####.png");  

  for (int x = 0; x < memoryWidth; x++) {
    for (int y = 0; y < memoryHeight; y++) {
      Cell current = cells[x][y];
      current.setCache();
    }
  }
  for (int x = 0; x < memoryWidth; x++) {
    for (int y = 0; y < memoryHeight; y++) {
      Cell current = cells[x][y];
      int neighbours = current.countNeighbours();
      if (neighbours < 2 || neighbours > 3) {
        if (current.cache != dead) {
          current.state = lived;
        } else {
          current.state = dead;
        }
      } else if (neighbours == 3) {
        current.state = alive;
      }
      current.displayAge();
      current.displayState();
    }
  }
}