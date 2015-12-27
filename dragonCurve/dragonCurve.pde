int x = 0;
int y = 0;
int n = 0;
//bool turn = (((n & −n) << 1) & n) != 0" is TRUE if the nth turn is L; and is FALSE if the nth turn is R.
int dir = 2;
int size = 1;
void setup()
{
  size(1440, 900);
  x = width/2;
  y = height/2;
  frameRate(2000);
}
void draw ()
{
  if (dir == 0)
  {
    if (turn(n))
    {
      dir = 3;
      line(x,y,x,y + size);
      y = y + size;
    } else 
    {
      dir = 2;
      line(x,y,x,y - size);
      y = y - size;
    }
  } else if (dir == 1)
  {
    if (turn(n))
    {
      dir = 2;
      line(x,y,x,y - size);
      y = y - size;
    } else 
    {
      dir = 3;
      line(x,y,x,y + size);
      y = y + size;
    }
  }  else if (dir == 2)
  {
    if (turn(n))
    {
      dir = 0;
      line(x,y,x - size,y);
      x = x - size;
    } else 
    {
      dir = 1;
      line(x,y,x + size,y);
      x = x + size;
    }
  }  else if (dir == 3)
  {
    if (turn(n))
    {
      dir = 1;
      line(x,y,x + size,y);
      x = x + size;
    } else 
    {
      dir = 0;
      line(x,y,x - size,y);
      x = x - size;
    }
  }
  n++;
}
boolean turn (int n)
{
  boolean output = false;
  if ((((n & -n) << 1) & n) != 0)
    output = true;
  return output;
}