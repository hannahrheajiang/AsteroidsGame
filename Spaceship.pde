class Spaceship extends Floater  
{   
    public Spaceship(){
      corners = 3;
      xCorners = new int[] {-8,-8,16}; //Floater class uses these corners to create spaceship shape
      yCorners = new int[] {8,-8,0};   
      myColor = 255;
      myCenterX = myCenterY = width/2; 
      myPointDirection = 0;
      myXspeed = 0;
      myYspeed = 0;
    }
    public void hyperspace(){
      //Moves spaceship to random location in canvas, pointing in random direction
      myXspeed = myYspeed = 0;
      myCenterX = (double) Math.random()*width;
      myCenterY = (double) Math.random()*height;
      myPointDirection = (double)(Math.random()*360) + 1;
    }
    
    //Below are getter/setter functions for text in AsteroidsGame
    public double getmyCenterX() {
      return (float)myCenterX;
    }
    public double getmyCenterY() {
      return myCenterY;
    }
    public double getmyPointDirection() {
      return myPointDirection;
    }
    public float getmyXspeed() {
      return (float)myXspeed;
    }
    public float getmyYspeed() {
      return (float)myYspeed;
    }
}
