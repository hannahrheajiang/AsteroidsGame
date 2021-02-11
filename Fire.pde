public class Fire extends Floater
{
  //Fire takes location, speed, direction of ship
  public Fire(double shipX, double shipY, double speedX, double speedY, double pointDir){
    //Sets center, speed, direction of fire to the sane as the ship
    myCenterX = shipX;
    myCenterY = shipY;
    myXspeed = speedX;
    myYspeed = speedY;
    myPointDirection = pointDir;
    myColor = color(255,0,0);
    
    //Draw fire
    corners = 3;
    xCorners = new int[] {-17,-17,-29}; 
    yCorners = new int[] {-10,10,0}; 
  }
  
  //getter and setter functions
  public double getmyCenterX() {return (double)myCenterX;}
  public double getmyCenterY() {return myCenterY;}
  public double getmyPointDirection() {return myPointDirection;}
  public double getmyXspeed() {return (double)myXspeed;}
  public double getmyYspeed() {return (double)myYspeed;}
}
