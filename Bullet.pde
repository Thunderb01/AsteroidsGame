class Bullet extends Floater
{
  private Bullet(double myX, double myY, double DirectionX, double DirectionY, double PointDirection){
    corners = 4;
    xCorners  = new int[]{-2,-5,5,-5 };
    yCorners  = new int[]{0,4,0,-4};
    myColor = color(255,255,255);
    myCenterX = myX;
    myCenterY = myY;
    myDirectionX = DirectionX;
    myDirectionY = DirectionY;
    myPointDirection = PointDirection;
  }
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
  
  
  
  
}
