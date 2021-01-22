ArrayList <Asteroids> asteroids = new ArrayList <Asteroids>();
Spaceship shippy;
Star[] starArray;

public void setup()
{
  //Create black background and new instances of star/spaceship classes
  size(700,700);
  background(0);
  shippy = new Spaceship();
  starArray = new Star[200];
  for (int i = 0; i < starArray.length; i+=1){
    starArray[i] = new Star();
  }
  for(int i = 0; i < 10; i++) 
  {
    asteroids.add(new Asteroids());
  }
}

public void draw()
{
  background(0);
  // Create text in upper left corner, uses getter/setter functions from Spaceship class
  textSize(20);
  text("myCenterX: " + (int)shippy.getmyCenterX(),5,20);
  text("myCenterY: " + (int)shippy.getmyCenterY(),5,40);
  text("myPointDirection: " + (int)shippy.getmyPointDirection(),5,60);
  text("myXspeed: " + nf(shippy.getmyXspeed(),0, 2), 5,80); // "nf" rounds myXspeed and myYspeed to show only two decimal points
  text("myYspeed: " + nf(shippy.getmyYspeed(),0, 2),5,100);
  // Show stars and spaceship
  for (int i = 0; i < starArray.length; i+=1){
    starArray[i].show();
  }
  for(int i = 0; i < 10; i++) 
  {
    asteroids.get(i).show();
    asteroids.get(i).move();
  }
  shippy.show();
  shippy.move(); 
}

public void keyPressed()
{
  // When user presses keys, the spaceship moves, turns, accelerates, hyperspaces
  if (key == 'a') {
      shippy.turn(-20); 
    }
  if (key == 's') {
      shippy.turn(20);
    }
  if (key == 'z'){
      shippy.accelerate(0.2); 
  }
  if (key == 'h'){
      shippy.hyperspace(); 
  }
  
}
