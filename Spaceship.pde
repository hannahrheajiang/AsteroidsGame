class Spaceship extends Floater  
{   
    public Spaceship(){
      corners = 3;
      xCorners = new int[] {-12,-12,22}; //Floater class uses these corners to create spaceship shape
      yCorners = new int[] {12,-12,0};   
      myColor = 200;
      myCenterX = myCenterY = width/2; 
      myPointDirection = 0;
      myXspeed = 0;
      myYspeed = 0; 
    }
     public void hyperspace(){
      //location in canvas, pointing in random direction
      myXspeed = myYspeed = 0;
      myXspeed = myYspeed = (double) 0;
      myCenterX = (double) Math.random()*width;
      myCenterY = (double) Math.random()*height;
      myPointDirection = (double)(Math.random()*360) + 1;
    }
    
    //Below are getter/setter functions for text in AsteroidsGame
    public double getmyCenterX() {return (double)myCenterX;}
    public double getmyCenterY() {return myCenterY;}
    public double getmyPointDirection() {return myPointDirection;}
    public double getmyXspeed() {return (double)myXspeed;}
    public double getmyYspeed() {return (double)myYspeed;}
}
