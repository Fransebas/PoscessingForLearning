int a = 1; // b = a"sub"(n - 2)
int b = 1; // b = a"sub"(n - 1)
int c = 1; // sum of var a"sub"(n - 1) + a"sub"(n - 2) 
int screen  =1000;
int x = a; // coordinate x of the center of the arc
int y = b; // coordinate y of the center of the arc
int side =1;
int center = screen/2;
int colorC = 0; // R || G || B
int colorA = 0; // R || G || B
int colorB = 0; // R || G || B
int[] seqC = new int[20];
int[] seqA = new int[20];
int[] seqB = new int[20];
int index = 14;

void setup()
{
  size(1440, 900); // size of screen
  stroke(255,255,255); // color white to see the stroke
  for (int i = 0; i < 17; i++)
  {
    c = b + a;
    seqC[i] = c;
    seqA[i] = a;
    seqB[i] = b;
    a = b;
    b = c;
  }
  for (int i =0; i < index; i++)
  {
    print(seqC[i]);
    print(" ");
  }
  println();
  for (int i =0; i < index; i++)
  {
    print(seqA[i]);
    print(" ");
  }
  println();
  for (int i =0; i < index; i++)
  {
    print(seqB[i]);
    print(" ");
  }
  x = x + width/2; // initialize the coordinate x
  //y = y + height/2; // initialize the coordinate y
}
void draw()
{
  
} // this is need to draw 

void mouseClicked()
{
  index--;

  if(side <1) // initialize when it makes a turn of 4
    side = 4; // initialize to 1
  //c = b + a / a"sub"(n) = a"sub"(n - 1) + a"sub"(n - 2)
  colorC = c % 255; // values of the color between 0 and 255
  colorA = a % 255; // values of the color between 0 and 255
  colorB = b % 255;  // values of the color between 0 and 255
  fill(colorB,colorA,colorC); // fill the color
  if(side == 1)
  {
    rect(x,y,seqC[index],seqC[index]); // make rectangle 
    arc(x,y + seqC[index],2*seqC[index],2*seqC[index],PI+HALF_PI,TWO_PI); // set the arc of the circle
  }
  else if(side == 2)
  {
    y = y + seqB[index]; // the center moves seqB[index] to the bottom
    x = x - seqA[index]; // the center return a to the left
    rect(x,y,seqC[index],seqC[index]); // make rectangle
    arc(x,y,2*seqC[index],2*seqC[index],0,HALF_PI); // set the arc of the circle
  }
  else if(side == 3)
  {
    x =x - seqC[index]; // the center return c to the left
    y =y - seqA[index]; // the center returrn a to the bottom-up
    rect(x,y,seqC[index],seqC[index]); // make rectangle
    arc(x + seqC[index],y,2*seqC[index],2*seqC[index],HALF_PI,PI); // set the arc of the circle
  }
  else if(side == 4)
  {
    x = x - seqC[index];
    //y = y + seqC[index]; // the center teturns c to the bottom-up
    rect(x,y,seqC[index],seqC[index]); // make rectangle
    arc(x + seqC[index],y,2*seqC[index],2*seqC[index],PI,PI+HALF_PI); // set the arc of the circle
  }
  //a = b; // set a to the next value a"sub"(n - 1)
  //b = c; // set b to the next value a"sub"(n)
    
  side --; // make a turn
  
  println(c); // print the value of the sequence
  if (index == 0) index = 1;
}