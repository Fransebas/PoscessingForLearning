double[] c = {PI - 3 , .900018}; // complex base number
/* some cool fractals that I found c =
  .16756475 , 1.00005785
  PI - 3 , .900018
  .00005 , 1.185785
  .00005 , .90005
  -0.4, 0.6
  0.15 , -1.f
  0.475 , -0.71f
   .58 , .69685 
*/
//double b_norm = norm(c);
double b_norm = 2; // simplify of the norm rule

double x,y,mid_x,mid_y; // declare of global vars

int max_i = 255;
color pixel = color(0,0,0); // create color object
boolean start = true; // start of fractal boolean
int d_count = 4;

public color iteration(double[] cmplx, double[] cmplx2) // return of counts to infinity
{
  color out = color(0,0,0);
  int cont=0;
  double c_norm = norm(cmplx); // norm of the complex "x*z + y*i"  x,y are coordenates
  //println(c_norm);
  while (c_norm < b_norm) // if norm of (x,y) is greater than the norm
  {
    if(cont > 2000) // number of iterations = quality
      break;
    else
    {
      cmplx = square(cmplx);
      cmplx[0] += cmplx2[0];
      cmplx[1] += cmplx2[1];
      c_norm = norm(cmplx);
    }
    cont++;
  }
  if (cont < 175)
    cont*=10;
  if (cont >= 2000)
    out = color (0,0,0);
  else
    out = color ((cont/2)%255,(cont)%255,(2*cont));
  //out = color ((2*cont),(cont/2),(cont));// cool color
  return out;
}
//good
public double norm(double[] cmplx)
{
  return Math.sqrt(cmplx[0]*cmplx[0] + cmplx[1]*cmplx[1]);
}

public double[] square(double[] cmplx) // z = z^2 + c
{
  double[] result = new double[2]; 
  result[0] = cmplx[0]*cmplx[0] - cmplx[1]*cmplx[1];
  result[1] = 2*cmplx[0]*cmplx[1];
  return result;
}
public void fractal(int deep)
{
  double[] cmplx = new double[2];
  double[] cmplx2 = new double[2];
  cmplx[0] = -450/100*deep;
  cmplx[1] = -450/100*deep;
  for (int i=0;i<height;i++) // y
  {
     for(int j=0;j<width;j++)
     {
       cmplx2[0] = (double)(j - mid_x)/ (double)(deep*100);
       cmplx2[1] = (double)(i - mid_y)/ (double)(deep*100);
       cmplx[0] = (double)(j - mid_x)/ (double)(deep*100);
       cmplx[1] = (double)(i - mid_y)/ (double)(deep*100);
       pixel = iteration(cmplx, cmplx2);
       set(j,i,pixel);
     }
  }
}
public void setup()
{
  size(800,800); // set size of screen
  mid_x = width/2; // set x axis
  mid_y = height/2; // set y axis
}
public void draw()
{
  if (start) // only works once
  {
    start = !start; 
    fractal(d_count); // start of fractal
  }
}

void keyPressed()
{
    
  if(keyCode == (char)32) // makes zoom on press SPACEBAR
  {
    d_count++; // increse the zoom factor
    fractal(d_count); // makes new fractal whit new zoom factor
  } else if(keyCode == RIGHT) // move RIGHT 10 pixels
  {
    mid_x-=10; // modify global var of x axis
    fractal(d_count); // makes new fractal on new coordenates
  }
    else if(keyCode == LEFT) // move LEFT 10 pixels
  {
    mid_x+=10; // modify global var of x axis
    fractal(d_count); // makes new fractal on new coordenates
  }
  else if(keyCode == UP) // move UP 10 pixels
  {
    mid_y+=10; // modify global var of y axis
    fractal(d_count); // makes new fractal on new coordenates
  }
    else if(keyCode == DOWN) // move DOWN 10 pixels
  {
    mid_y-=10; // modify global var of y axis
    fractal(d_count); // makes new fractal on new coordenates
  }else if(keyCode == 'f') // supose to take photo on press of 'f'
     saveFrame(); // take screenshot of the actul frame "supose to"
  
}