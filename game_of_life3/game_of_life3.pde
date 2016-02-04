class rectangle 
{
  int x = 0;
  int y = 0;
  int rgb = #464646;
  int size = 10;
  boolean life = false;
  int neighbor = 0;
  rectangle(int x, int y, int size)
  {
    this.x = x;
    this.y = y;
    rgb = #464646;
    this.size = size;
    life = false;
    makeRect();
  }
  void setRectangle(int x, int y, int size)
  {
    x = 0;
    y = 0;
    rgb = #464646;
    size = 10;
    life = false;
    makeRect();
  }
  void makeRect()
  {
    fill(rgb);
    rect(x,y,size,size);
  }
  void ligth()
  {
    if ((mouseX > x && mouseX < x + size) && (mouseY > y && mouseY < y + size))
      alive(true);
    else
      alive(false);
  }
  void alive(boolean life)
  {
    if(life)
    {
      setFill(#FEFF03);
      this.life = life;
    }
    else 
    {
      setFill(#464646);
      this.life = life;
    }
  }
  void setFill(int rgb)
  {
    fill(rgb);
    rect(x,y,size,size);
    this.rgb = rgb;
  }
  boolean isAlive()
  {
    return life;
  }
  int getNeighbor()
  {
    return neighbor;
  }
  void setNeighbor(int cell)
  {
    neighbor = cell;
  }
}
rectangle rc;
int size = 10;
int cellsAd = 0;
boolean start = false;
rectangle grid[][] = new rectangle[900/size][1440/size];
void setup ()
{
  size(1440, 900);
  for (int i = 0; i < height/size; i++ ) 
    for (int j = 0; j < width/size; j++ )
      grid[i][j] = new rectangle(j*size, i*size, size);
}

void draw ()
{
  if (start)
  {
  for (int i = 0; i < height/size - 1; i++ ) 
    for (int j = 0; j < width/size - 1; j++ )
      grid[i][j].setNeighbor(adayacent(i,j));

  for (int i = 1; i < height/size; i++ ) 
  {
    for (int j = 1; j < width/size; j++ )
    {
      cellsAd = grid[i][j].getNeighbor();
      if (cellsAd < 2)
        grid[i][j].alive(false);
      if (cellsAd == 2)
        {}
      else if (cellsAd < 4)
        grid[i][j].alive(true);
      else 
        grid[i][j].alive(false);
    }
  }
  }
}
void mouseClicked()
{
  grid[mouseY/size][mouseX/size].alive(true);
}
void keyPressed()
{
  start = !start;
}
int adayacent(int i, int j) // i = y = h, j = x = w
{
  // y = h
  // x = w
  int out = 0;
  int rangeX = -1;
  int rangeY = -1;
  if (i == 0)
    rangeY = 0;
  if (j == 0)
    rangeX = 0;
  for (int h=rangeY;h < 2;h++) 
  {
    for (int w=rangeX;w < 2; w++) {
      if (grid[i+h][j+w].isAlive())
        if (h != 0 && w != 0)
          out++;
    }
  }
  return out;
}