int x = 0;
int y = 0;
int size = 0;
void setup()
{
  size(1440, 900);
  size = height;
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
    fill(#79E400);
    //noStroke();
    rect(x,y,size,size);
  } else
  {
    Sierpinski(x,y,size/2);
    Sierpinski(x + size/2,y,size/2);
    Sierpinski(x ,y + size/2,size/2);
  }
} 