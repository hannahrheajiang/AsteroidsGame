class Bullet extends Floater
{
  public Bullet()
  {
    //Bullet appears wherever ship is
    myCenterX = shippy.getmyCenterX();
    myCenterY = shippy.getmyCenterY();
    myXspeed = shippy.getmyXspeed();
    myYspeed = shippy.getmyYspeed();
    myPointDirection = shippy.getmyPointDirection();
    accelerate(6.0);
  }
  
  //Override show() by drawing the bullet wherever the spaceship is
  public void show()
  {
    fill(255,255,0);
    ellipse((float)myCenterX, (float)myCenterY, 5.0 , 5.0);
  }
  
  //Override move() so the bullet doesn't wrap around screen
  public void move()
  {
    myCenterX += myXspeed;    
    myCenterY += myYspeed;   
  }   
  
  //Getter and setter functions
  public double getmyCenterX() {return (double)myCenterX;}
  public double getmyCenterY() {return (double)myCenterY;}
}
