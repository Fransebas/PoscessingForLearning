double[] c = {.00005 , 1.185785};
//.16756475 , 1.00005785
//PI - 3 , .900018
//.00005 , 1.185785
//.00005 , .90005
//-0.4, 0.6
//0.15 , -1.f
//0.475 , -0.71f
// .58 , .69685 norm = 2
//double b_norm = norm(c);
double b_norm = 2;

double x,y,mid_x,mid_y;

int max_i = 1000;
color pixel = color(0,0,0);
boolean start = true;
int d_count = 4;

public color iteration(double[] cmplx, double[] cmplx2)
{
  color out = color(0,0,0);
  int cont=0;
  double c_norm = norm(cmplx);
  //println(c_norm);
  while (c_norm < b_norm)
  {
    if(cont > max_i)
      break;
    else
    {
      //c[0] = cmplx2[0];
      //c[1] = cmplx2[1];
      cmplx = square(cmplx);
      cmplx[0] += c[0];
      cmplx[1] += c[1];
      c_norm = norm(cmplx);
    }
    cont++;
  }
  if (cont < 175)
    cont*=10;
  if (cont >= max_i)
    out = color (0,0,0);
  else
    out = color ((500 - cont),(175 - cont/2),(cont*2));// cool color
  //out = color ((cont/2)%255,(cont)%255,(2*cont));
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
public void fractal(int deep, int right, int left, int up, int down)
{
  double[] cmplx = new double[2];
  cmplx[0] = -450/100*deep;
  cmplx[1] = -450/100*deep;
  for (int i=0;i<height;i++) // y
  {
     for(int j=0;j<width;j++)
     {
       cmplx[0] = (double)(j - mid_x)/ (double)(deep*100);
       cmplx[1] = (double)(i - mid_y)/ (double)(deep*100);
       //pixel = iteration(cmplx);
       set(j,i,pixel);
     }
  }
}
public void setup()
{
  size(1440,900);
  mid_x = width/2; // x =0
  mid_y = height/2; // y = 0
 // println(b_norm);
 c = square(c);
 println(c[0]);
 println(c[1]);
}
public void draw()
{
  if (start)
  {
    start = !start;
    fractal(d_count);
  }
}
void keyPressed()
{
    
  if(keyCode == (char)32)
  {
    fractal(d_count);
    d_count++;
  } else if(keyCode == RIGHT)
  {
    mid_x-=10;
    fractal(d_count);
  }
    else if(keyCode == LEFT)
  {
    mid_x+=10;
    fractal(d_count);
  }
  else if(keyCode == UP)
  {
    mid_y+=10;
    fractal(d_count);
  }
    else if(keyCode == DOWN)
  {
    mid_y-=10;
    fractal(d_count);
  }else if(keyCode == 'f')
     saveFrame();
  
}