class Rock
{
  final float gravity = 9.81;
  float Vxi = 20;
  float Vyi = -100;
  float Vx = 0;
  float Vy = 0;
  float Vmagnitude;
  float yi = 0;
  float xi =0;
  float y = 0;
  float x =0;
  float base = 0;
  float wall = 0;
  float Ay = gravity;
  float Ax = 0;
  int size = 0;
  float t = 0;
  public Rock(int x, int y, int size)
  {
    this.xi = Math.abs(x)%height;
    this.yi = Math.abs(y)%width;
    this.size = size;
    base = height-size;
    wall = width-size;
    ellipse(this.xi, this.yi, size, size);
  }
  public void setSpeed(float Vxi, float Vyi)
  {
    this.Vxi = Vxi;
    this.Vyi = Vyi;
  }
  public void move()
  {
    strokeWeight(1);
    Vx = Ax*t + Vxi;
    Vy = Ay*t + Vyi;
    if (y < base)
      y= yi + Vyi*t + (Ay*t*t)/2;
    else
    {
      Ay = 0;
      Vy =0;
    }
    if (x < wall)
      x= xi + Vxi*t + (Ax*t*t)/2;;
    Vy %= 300000;
    Vx %= 300000;
    stroke(#000000);
    ellipse(x, y, size, size);
    t += 0.1;
  }
  public void track()
  {
    strokeWeight(2);
    float i_track = 0;
    float x_track = x;
    float y_track = y;
    float Vyi_track = Vy;
    float Vxi_track = Vx;
    while(y_track < base)
    {
      y_track= y + Vyi_track*i_track + (Ay*i_track*i_track)/2;
      x_track= x + Vxi_track*i_track + (Ax*i_track*i_track)/2;
      stroke(#F52F2F);
      point(x_track,y_track);
      i_track+=0.01;
    }
  }
  public void speedVector()
  {
    stroke(#CB00FA);
    strokeWeight(6);
    line(x,y,x + Vx, y + Vy);
  }
  public void setBase(float base)
  {
    this.base = base-size/2;
  }
  public void simulate()
  {
    move(); 
    speedVector();
    track();
  }
}
class Floor 
{
  float y = 0;
  public Floor(float y)
  {
    stroke(#54D102);
    this.y =height - y;
    fill(#54D102);
    rect(0,this.y,width, this.y);
  }
  public void drawFloor()
  {
    stroke(#54D102);
    fill(#54D102);
    rect(0,this.y,width, this.y);
    fill(#FFFFFF);
  }
}
Rock r1;
Rock r2;
Rock r3;
Floor ground;
void setup()
{
  size(1400,800);
  r1 = new Rock(100,700,40);
  r2 = new Rock(100,100,40);
  r3 = new Rock(100,700,40);
  r2.setSpeed(100,0);
  r3.setSpeed(10,-200);
  ground = new Floor(50);
  r1.setBase(ground.y);
  r2.setBase(ground.y);
  r3.setBase(ground.y);
}
void draw()
{
  background(#E0E0E0);
  fill(#005DFA);
  rect(0,0,width,height);
  ground.drawFloor(); 
  r1.simulate();
  r2.simulate();
  r3.simulate();
}