class Asteroids extends Floater
{
  private double rotSpeed;
  public Asteroids()
  {
    //Initialize new variables 
    rotSpeed = Math.random()*6-3;
    corners = 6;
    xCorners = new int[] {-17,(int)(Math.random()*10)-9,18, 12,-18,(int)(Math.random()*-20)-9};
    yCorners = new int[] {-12,-17,7,17,(int)(Math.random()*10)+17,7};
    myColor = 200;
    myCenterX = (int)(Math.random()*750) - 50;
    myCenterY = (int)(Math.random()*750) - 50;
    myXspeed = Math.random()*3-1;
    myYspeed = Math.random()*3-1;
    myPointDirection = 0;
  }
  
  public void move()
  {
    //Asteroids turn at their rotation speed and move like floaters
    turn(rotSpeed);
    super.move();
  }
  
  //getter and setter functions for center of asteroid
  public int getMyCenterX() {return (int)myCenterX;}
  public int getMyCenterY() {return (int)myCenterY;}
  public int getColor() {return (int)myColor;}
  public void setColor(int newColor) {myColor = newColor;}
}
  
