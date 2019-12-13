class HealthPack extends Floater
{
  private HealthPack(){
    corners = 5;
    xCorners = new int[]{-3,-3,3,3,-3};
    yCorners = new int[]{3,-3,-3,3,3};
    myCenterX = (double)(Math.random()*1000);
    myCenterY = (double)(Math.random()*1000);
    
    myColor = color(255,105,180);
    myPointDirection = (double)(Math.random()*360);
    
  }
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
}
