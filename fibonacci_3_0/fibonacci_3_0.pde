int a = 1;
int b = 1;
int c = 1;
int screen  =1000;
int x = a;
int y = b;
int memoX = 0;
int memoY = 0;
int side =4;
int center = screen/2;
int colorC = 0;
int colorA = 0;
int colorB = 0;

void setup()
{
  size(2048, 1000);
  frameRate(4);
  noFill();
  x = x + center;
  y = y + center;
  stroke(255,255,255);
}
void draw()
{
  
}

void mouseClicked()
{
  if(side > 4)
    side = 1;
  c = a + b;
  colorC = c % 255;
  colorA = a % 255;
  colorB = b % 255;
  fill(colorB,colorA,colorC);
  if(side == 1)
  {
    x = x + b;
    rect(x,y,c,c);
    arc(x,y + c,c + c,c + c,PI+HALF_PI,TWO_PI);
  }
  else if(side == 2)
  {
    y = y + b;
    x = x - a;
    rect(x,y,c,c);
    arc(x,y,c + c,c + c,0,HALF_PI);
  }
  else if(side == 3)
  {
    x =x - c;
    y =y - a;
    rect(x,y,c,c);
    arc(x + c,y,c + c,c + c,HALF_PI,PI);
  }
  else if(side == 4)
  {
    y = y - c;
    rect(x,y,c,c);
    arc(x + c,y + c,2*c,2*c,PI,PI+HALF_PI);
  }
  a = b;
  b = c;
    
  side ++;
  
  println(c);
}