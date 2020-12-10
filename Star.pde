class Star
{
  int mySize, xPos, yPos;
  color starColor;
  Star() {
    // star has random size, located at random location in canvas
    mySize = (int)(Math.random()*5)+1;
    xPos = (int)(Math.random()*height);
    yPos = (int)(Math.random()*width);
    starColor = color((int)(Math.random()*256), (int)(Math.random()*256),(int)(Math.random()*256));
  }
  void show() {
    // star has random color
    fill(starColor);
    stroke(starColor);
    ellipse(xPos, yPos, mySize, mySize);
  }
}
