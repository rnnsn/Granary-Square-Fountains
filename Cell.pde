class Cell {
  int x, y, cache, state, age;
  Integer displayX, displayYtop, displayYbottom;

  Cell(int a, int b) {
    x = a;
    y = b;
    state = 0;
    cache = state;
    if (y >= yPadding && y < memoryHeight-yPadding) {
      displayYtop = y - yPadding;
      displayYbottom = y - yPadding + fountainHeight;
      if (x >= xPadding && x < memoryWidth-xPadding) {
        displayX = (((x - xPadding)/10)*13)+x - xPadding;
      }
    }
  }

  void setCache() {
    cache = state;
  }

  int countNeighbours() {
    int counter = 0;
    for (int nX = x-1; nX <= x+1; nX++) {
      for (int nY = y-1; nY <= y+1; nY++) {
        if (nX >= 0 && nX < memoryWidth && nY >= 0 && nY < memoryHeight) {
          if (nX != x || nY != y) {
            if (cells[nX][nY].cache == alive) {
              counter++;
            }
          }
        }
      }
    }
    return counter;
  }

  void displayAge() {
    if (displayX != null) {
      if (state == alive) {
        age++;
      } else {
        age = 0;
      }
      stroke(age*51);
      point(displayX, displayYtop);
    }
  }

  void displayState() {
    if (displayX != null) {
      if (state == alive) {
        stroke(255);
      } else if (state == dead) {
        stroke(0);
      } else if (state == lived) {
        stroke(0, 150, 75);
      }
      point(displayX, displayYbottom);
    }
  }
}