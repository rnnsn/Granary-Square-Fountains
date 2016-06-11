void initPreset(String str) {
  if (str.equals("morse")) {
    int[][] arr = {
      {-19, 0}, {-18, 0}, {-17, 0}, {-11, 0}, {-10, 0}, 
      {-9, 0}, {-5, 0}, {-4, 0}, {-3, 0}, {-2, 0}, 
      {-1, 0}, {0, 0}, {1, 0}, {2, 0}, {3, 0}, {4, 0}, 
      {8, 0}, {9, 0}, {10, 0}, {16, 0}, {17, 0}, {18, 0}
    };
    iterate(arr);
  } else if (str.equals("tower")) {
    int[][] arr = {
      {1, 0}, {2, 0}, {3, 0}, {5, -1}, {5, 0}, {5, 1}
    };
    iterate(arr);
  } else if (str.equals("anthive")) {
    int[][] arr = {
      {-8, -4}, {-7, -6}, {-7, -4}, {-6, -5}, {-6, -4}, 
      {-2, 0}, {-1, -1}, {-1, 1}, {0, -1}, {0, 1}, {1, 0}
    };
    iterate(arr);
  }
}

void iterate(int[][] arr) {
  int w = memoryWidth/2;
  int h = memoryHeight/2;
  for (int i = 0; i < arr.length; i++) {
    cells[w+arr[i][0]][h+arr[i][1]].state = alive;
  }
}