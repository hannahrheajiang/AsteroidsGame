ArrayList <Asteroids> asteroids = new ArrayList <Asteroids>();
ArrayList <Bullet> bullet = new ArrayList <Bullet>();
ArrayList <Health> heal = new ArrayList <Health>();
int score = 0;
int health = 100;
Star[] starArray;
Fire fire;
Spaceship shippy;
boolean start = false;
boolean gameOver = false;
boolean win = false;

public void setup()
{
  //Create black background and new instances of star/spaceship/fire classes
  size(700,700);
  background(0);
  shippy = new Spaceship();
  fire = new Fire(shippy.getmyCenterX(), shippy.getmyCenterY(), shippy.getmyXspeed(),shippy.getmyYspeed(), shippy.getmyPointDirection()); 
  starArray = new Star[200];
  
  //Add to star arraylist
  for (int i = 0; i < starArray.length; i+=1)
  {
    starArray[i] = new Star();
  }
  
  //Add 20 asteroids to asteroid arraylist
  for(int i = 0; i < 20; i++) 
  {
    asteroids.add(new Asteroids());
  }
  
  //Add 3 health to health arraylist
  for(int i = 0; i < 3; i++) 
  {
    heal.add(new Health());
  }
}

public void draw()
{
  //if the game ends, show score and "game over" screen
  if(gameOver == true && win == false)
  {
    fill(0);
    rect(-5, -5, 705, 705);
    fill(255);
    textSize(80);
    text("Game Over", 125, 300);
    fill(170);
    text("Score: " + score, 180, 400);
  }
  
  //if the player has won, show score and "win" screen
  else if (win == true)
  {
    fill(0);
    rect(0, 0, 1000, 1000);
    fill(255);
    textSize(90);
    text("You win!", 160, 325);
    fill(170);
    textSize(75);
    text("Score: " + score, 180, 405);
  }
  
  //if neither of these are true, continue game normally
  else 
  {
  //If game hasn't been started, show "start" screen
  if(start == false)
  {
    textSize(60);
    fill(255);
    text("Asteroids Game!",115,325);
    textSize(40);
    fill(170);
    text("Press ENTER to start game",95,400);
  }
  
  //If game has started, continue game normally
  if (start == true)
  {
    //set background
    background(0);
    textSize(20);
    
    //Draw stars
    for (int i = 0; i < starArray.length; i+=1)
    {
      starArray[i].show();
    }
    
    //Show and move bullets
    for (int i = 0; i <bullet.size(); i++)
    {
      bullet.get(i).show();
      bullet.get(i).move();
    }
    
    // Show and move spaceship, move fire with spaceship
    shippy.show();
    shippy.move(); 
    fire.move();
    
    //Make each asteroids move and dissapear when they hit the spaceship
    for(int i = 0; i < asteroids.size(); i++) 
    {
      asteroids.get(i).show();
      asteroids.get(i).move();
      if (dist((float)shippy.getmyCenterX(), (float)shippy.getmyCenterY(), (float)asteroids.get(i).getMyCenterX(), (float)asteroids.get(i).getMyCenterY()) < 20)
      {
        //If an asteroid hits the ship, the ship loses 10 health
        health -= 10;
        asteroids.remove(i);
      }
    }
    
    //If health is under 50, heal packs appear
    if (health <= 50)
    {
      for(int i = 0; i < heal.size(); i++) 
      {
        heal.get(i).move();
        heal.get(i).show();
        if (dist((float)shippy.getmyCenterX(), (float)shippy.getmyCenterY(), (float)heal.get(i).getMyCenterX(), (float)heal.get(i).getMyCenterY()) < 20)
        {
          //Health also dissapear if they hit the ship, but they give health
          health += 20;
          heal.remove(i);
        }
      }
    }
    
    //If the ship's health get to zero, the game ends & the "game over" screen appears
    if (health <= 0) 
     {
       gameOver = true;
     }
     
    //If all the asteroids are destroyed, the player wins & the "win" screen appears
    if(asteroids.size() == 0)
    {
      win = true;
    }
    
    // Create text in bottom right corner, uses getter/setter functions from Spaceship class
    fill(200);
    text("myCenterX: " + (int)shippy.getmyCenterX(), 20,600);
    text("myCenterY: " + (int)shippy.getmyCenterY(), 20,620);
    text("myPointDirection: " + (int)shippy.getmyPointDirection(), 20,640);
    // "nf" rounds myXspeed and myYspeed to show only two decimal points
    text("myXspeed: " + nf((float) shippy.getmyXspeed(),0, 2), 20,660); 
    text("myYspeed: " + nf((float) shippy.getmyYspeed(),0, 2), 20,680);
    
    
    //Make asteroids + bullets collide and dissapear
    for(int i = asteroids.size()-1; i >= 0; i--) 
    {
      for(int j = bullet.size()-1; j >=0; j--) 
      {
         if(dist((float)bullet.get(j).getmyCenterX(), (float)bullet.get(j).getmyCenterY(),(float)asteroids.get(i).getMyCenterX(), (float)asteroids.get(i).getMyCenterY()) < 15)
         {
           bullet.remove(j);
           //asteroids take 3 hits to dissapear, score increases by 5 w/ first 2 hits, then by 10 after asteroid dissapears
           if(asteroids.get(i).getColor() == 200)
           {
             asteroids.get(i).setColor(150);
             score += 5;
           }
           
           else if(asteroids.get(i).getColor() == 150)
           {
             score += 5;
             asteroids.get(i).setColor(100);
           }
           
           else 
           {
             asteroids.remove(i);
             score += 10;
           }
           break;
         }
       }
     }
     
     //If health is low, the color of text goes from green --> yellow --> red
     if (health >= 60)
     {
       fill(0,255,0);
     }
     
     else if (health <= 60 && health > 30)
     {
       fill(255,255,0);
     }
     
     else if (health <= 30)
     {
       fill(255,0,0);
     }
     
     //Show health and score in top riight / left corners
     textSize(24);
     text("Health: " + health, 10, 30);
     fill(255,255,255);
     text("Score: " + score, 550, 30);
  }
 }
}

public void keyPressed()
{
  if (key == ENTER)
  {
    start = true;
  }
  if (key == 'a') 
  {
    shippy.turn(-20); 
    fire.turn(-20);
  }
  if (key == 's') 
  {
    shippy.turn(20);
    fire.turn(20);
  }
  if (key == 'w')
  {
    //fire only appears when ship is accelerating
    shippy.accelerate(0.2); 
    fire.accelerate(0.2);
    fire.show();
  }
  if (key == 'h')
  {
    shippy.hyperspace(); 
    fire = new Fire(shippy.getmyCenterX(), shippy.getmyCenterY(), shippy.getmyXspeed(),shippy.getmyYspeed(), shippy.getmyPointDirection()); 
  }
  if (key == ' ')
  {
    bullet.add(new Bullet());
  }
}
