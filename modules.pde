class SpriteSquare {
  float x;
  float y;
  float w = width / grid_factor;
  float h = height / grid_factor;
  boolean coloured = false;
  color colour = color(0);

  SpriteSquare(float _x, float _y) {
    this.x = _x;
    this.y = _y;
  }

  public void colourIn() {
    stroke(255);
    fill(this.colour);
    rect(this.x, this.y, this.w, this.h);
    this.coloured = true;
  }
  public void setColour(color _colour) {
    this.colour = _colour;
  }
}

boolean coin_flip() {
  return floor(random(2)) == 0;
}


boolean[][] reverse_it(boolean[][] array) {
  boolean[][] newArray = new boolean[array.length][array[0].length];

  for (int i = 0; i < array.length; i++) {
    newArray[array.length - 1 - i] = array[i];
  }

  return newArray;
}


void makeSprite() {
  SpriteSquare[][] sprite_squares = new SpriteSquare[grid_factor][grid_factor];
  color c1 = color(random(255),random(255),random(255)); //left half side color.
  color c2 = c1;//right half side color.;
  color c3 = color(random(255),random(255),random(255));//middle column color only if odd.
  
  int rows = grid_factor;
  int cols = grid_factor;
  for (int i = 0; i < cols; i++) {
    for (int j=0; j < rows; j++) {
      float x = i*(width / grid_factor);
      float y = j*(height / grid_factor);
      sprite_squares[i][j] = new SpriteSquare(x, y);
    }
  }

  if (grid_factor%2 == 1) { //Grid is Odd.
    boolean[][] leftside_squares = new boolean[((cols-3)/2) + 1][rows];
    for (int i = 0; i <= (cols-3)/2; i++) { //Colour only left half side sqaures randomly
      for (int j=0; j <= rows-1; j++) {
        sprite_squares[i][j].setColour(c1);
        if (coin_flip()) { //Like a coin flip.
          sprite_squares[i][j].colourIn();
        }
        leftside_squares[i][j] = sprite_squares[i][j].coloured;
      }
    }


    leftside_squares = reverse_it(leftside_squares); //For symmetry, reverse this array and fill right side accordingly
    //it contains the columns then rows


    //Middle Column
    int middle_col = (cols - 1)/2;
    for (int j = 0; j < rows; j++) {
      sprite_squares[middle_col][j].setColour(c3);
      if (coin_flip()) {
        sprite_squares[middle_col][j].colourIn();
      }
    }

    //Right half side
    int col_idx = 0;
    for (int i = (cols+1)/2; i <= cols-1; i++) {
      for (int j=0; j <= rows-1; j++) {
        sprite_squares[i][j].setColour(c2);
        if (leftside_squares[col_idx][j]) {
          sprite_squares[i][j].colourIn();
        }
      }
      col_idx++;
    }
  } else {
    boolean[][] leftside_squares = new boolean[((cols-2)/2) + 1][rows];
    for (int i = 0; i <= (cols-2)/2; i++) { //Colour only left side sqaures randomly
      for (int j=0; j <= rows-1; j++) {
        sprite_squares[i][j].setColour(c1);
        if (coin_flip()) {
          sprite_squares[i][j].colourIn();
        }
        leftside_squares[i][j] = sprite_squares[i][j].coloured;
      }
    }

    leftside_squares = reverse_it(leftside_squares);

    int col_idx = 0;
    for (int i = (cols)/2; i <= cols-1; i++) {
      for (int j=0; j <= rows-1; j++) {
        sprite_squares[i][j].setColour(c2);
        if (leftside_squares[col_idx][j]) {
          sprite_squares[i][j].colourIn();
        }
        
      }
      col_idx++;
    }
  }
}
