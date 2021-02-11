public class Health extends Floater
{
  private double rotSpeed;
  public Health()
  {
    //Initialize variables
    rotSpeed = Math.random()*6-3;
    corners = 4;
    xCorners = new int[] {10,-10,-10,10};
    yCorners = new int[] {-10,-10,10,10};
    myColor = color(0,255,0);
    myCenterX = (int) Math.random()*100 + 750;
    myCenterY = (int) Math.random()*100 + 750;
    myXspeed = Math.random()*3-1;
    myYspeed = Math.random()*3-1;
  }
  
  public void move(){
    //Health moves like asteroids
    turn(rotSpeed);
    super.move();
  }
  
  //getter functions for center of Health
  public int getMyCenterX() {return (int)myCenterX;}
  public int getMyCenterY() {return (int)myCenterY;}
}
  
