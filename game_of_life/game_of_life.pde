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
  void makeRect()
  {
    fill(rgb);
    rect(x,y,size,size);
  }
  void ligth()
  {
    if ((mouseX > x && mouseX < x + size) && (mouseY > y && mouseY < y + size))
      alive(true);
    //else
      //alive(false);
  }
  void alive(boolean life)
  {
    this.life = life;
    if(life)
      setFill(#FEFF03); //yellow
    else 
      setFill(#464646); //grey
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
  void setNeighbor(int cells)
  {
    neighbor = cells;
  }
}
int size = 10;
int cellsAd = 0;
boolean start = false;
boolean freeHand = false;
int window_Heigth = 900;
int window_Width = 1440;
rectangle grid[][] = new rectangle[window_Heigth/size][window_Width/size];
void setup ()
{
  size(1440,900);
  for (int i = 0; i < height/size; i++ ) 
    for (int j = 0; j < width/size; j++ )
      grid[i][j] = new rectangle(j*size, i*size, size);
  //frameRate(5);
}

void draw ()
{
  if (start)
  {
  for (int i = 1; i < height/size - 1; i++ ) 
    for (int j = 1; j < width/size - 1; j++ )
      grid[i][j].setNeighbor(adayacent(i,j));

  for (int i = 0; i < height/size; i++ ) 
  {
    for (int j = 0; j < width/size; j++ )
    {
      cellsAd = grid[i][j].getNeighbor();
      
      if (cellsAd < 2)
        grid[i][j].alive(false);
      else if (cellsAd == 2){}
      else if (cellsAd == 3)
        grid[i][j].alive(true); 
      else 
        grid[i][j].alive(false);
    }
  }
  }
  if (freeHand)
  {
  for (int i = 1; i < height/size - 1; i++ ) 
    for (int j = 1; j < width/size - 1; j++ )
      grid[i][j].ligth();
  }
}
void mouseClicked()
{
  if (grid[mouseY/size][mouseX/size].isAlive())
    grid[mouseY/size][mouseX/size].alive(false);
  else
    grid[mouseY/size][mouseX/size].alive(true);
}
void keyPressed()
{
  if (key == 'f')
    freeHand = !freeHand;
  else 
    start = !start;
}
int adayacent(int i, int j) // i = y = h, j = x = w
{
  // y = h
  // x = w
  int out = 0;
  int rangeY = -1;
  int rangeX = -1;
  if (i == 0)
    rangeY = 0;
  if (j == 0)
    rangeX = 0;
  for (int h=rangeY;h < 2;h++) 
  {
    for (int w=rangeX;w < 2; w++) {
      if (grid[i+h][j+w].isAlive())
          out++;
    }
  }
  if (grid[i][j].isAlive())
      out--;
  return out;
}