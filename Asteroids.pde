class Asteroids extends Floater
{
  private double rotSpeed;
  public Asteroids(){
    //Initialize new variables 
    rotSpeed = Math.random()*6-3;
    corners = 6;
    xCorners = new int[] {-11,(int)(Math.random()*10)-5,13, 6,-11,(int)(Math.random()*-20)-5};
    yCorners = new int[] {-8,-8,0,10,(int)(Math.random()*10)+10,0};
    myColor = 0;
    myStroke = 255;
    myCenterX = (int)(Math.random()*750) - 50;
    myCenterY = (int)(Math.random()*750) - 50;
    myXspeed = Math.random()*2-1;
    myYspeed = Math.random()*2-1;
    myPointDirection = 0;
  }
  
  public void move(){
    //Asteroids turn at their rotation speed and move like floaters
    turn(rotSpeed);
    super.move();
  }
  //getter and setter functions for center of asteroid
  public int getMyCenterX()
  {
    return (int)myCenterX;
  }
  public int getMyCenterY()
  {
    return (int)myCenterY;
  }
}
