class Star
{
  int mySize, xPos, yPos, corners, type;
  color starColor;
  int[] xCorners, yCorners;
  Star() {
    // star has three different types, located at random places in canvas
    type = (int)(Math.random()*3);
    xPos = (int)(Math.random()*height);
    yPos = (int)(Math.random()*width);
    starColor = color(0, (int)(Math.random()*35)+50,(int)(Math.random()*125)+105);
   
   //Star type 1
    if (type == 0)
    {
    corners = 8;
    xCorners = new int[] {0, 2, 5,  2,  0, -2, -5, -2};
    yCorners = new int[] {5, 2, 0, -2, -5, -2,  0,  2};
    }
    
    //Star type 2
    else if (type == 1)
    {
    corners = 10;
    xCorners = new int[] {-2, -5, -3, -5, -2, 2, 2, 5, 2, 2};
    yCorners = new int[] {2, 4, 0, -3, -2, -5,-2, 0, 2, 5};
    }
    
    //Star type 3
    else if (type == 2)
    {
    corners = 4;
    xCorners = new int[] {0, 2, 0, -2};
    yCorners = new int[] {2, 0, -2, 0};
    }
  }
  
  void show() {
    // star has random color
    fill(starColor);
    noStroke();
    
    //draw star
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xPos+ xCorners[nI], yPos + yCorners[nI]);
    }
    endShape(CLOSE);
  }
}
