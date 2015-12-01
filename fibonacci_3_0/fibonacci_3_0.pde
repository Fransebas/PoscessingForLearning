int a = 1; // b = a"sub"(n - 2)
int b = 1; // b = a"sub"(n - 1)
int c = 1; // sum of var a"sub"(n - 1) + a"sub"(n - 2) 
int screen  =1000;
int x = a; // coordinate x of the center of the arc
int y = b; // coordinate y of the center of the arc
int memoX = 0;
int memoY = 0;
int side =4;
int center = screen/2;
int colorC = 0; // R || G || B
int colorA = 0; // R || G || B
int colorB = 0; // R || G || B

void setup()
{
  size(2048, 1000); // size of screen
  //fullScreen();
  x = x + center; // initialize the coordinate x
  y = y + center; // initialize the coordinate y
  stroke(255,255,255); // color white to see the stroke
}
void draw(){} // this is need to draw 

void mouseClicked()
{
  if(side > 4) // initialize when it makes a turn of 4
    side = 1; // initialize to 1
  c = b + a; // a"sub"(n) = a"sub"(n - 1) + a"sub"(n - 2)
  colorC = c % 255; // values of the color between 0 and 255
  colorA = a % 255; // values of the color between 0 and 255
  colorB = b % 255;  // values of the color between 0 and 255
  fill(colorB,colorA,colorC); // fill the color
  if(side == 1)
  {
    x = x + b; // the center move b to the rigth
    rect(x,y,c,c); // make rectangle 
    arc(x,y + c,2*c,2*c,PI+HALF_PI,TWO_PI); // set the arc of the circle
  }
  else if(side == 2)
  {
    y = y + b; // the center moves b to the bottom
    x = x - a; // the center return a to the left
    rect(x,y,c,c); // make rectangle
    arc(x,y,2*c,2*c,0,HALF_PI); // set the arc of the circle
  }
  else if(side == 3)
  {
    x =x - c; // the center return c to the left
    y =y - a; // the center returrn a to the bottom-up
    rect(x,y,c,c); // make rectangle
    arc(x + c,y,2*c,2*c,HALF_PI,PI); // set the arc of the circle
  }
  else if(side == 4)
  {
    y = y - c; // the center teturns c to the bottom-up
    rect(x,y,c,c); // make rectangle
    arc(x + c,y + c,2*c,2*c,PI,PI+HALF_PI); // set the arc of the circle
  }
  a = b; // set a to the next value a"sub"(n - 1)
  b = c; // set b to the next value a"sub"(n)
    
  side ++; // make a turn
  
  println(c); // print the value of the sequence
}