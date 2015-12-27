int x = 0;
int y = 0;
int size = 0;
void setup()
{
  fullScreen();
  size = 900;
  background(#00A7E4);
  Sierpinski(x,y,size);
}
void draw()
{
  
}
void Sierpinski(int x, int y, int size)
{
  if (size < 8)
  {
    fill(x,y,size);
    //noStroke();
    rect(x,y,size,size);
  } else
  {
    Sierpinski(x,y,size/2);
    Sierpinski(x + size/2,y,size/2);
    Sierpinski(x ,y + size/2,size/2);
  }
} 