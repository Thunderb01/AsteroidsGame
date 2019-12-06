class Bullet extends Floater
{
  boolean ready;
  private Bullet(double myX, double myY, double DirectionX, double DirectionY, double PointDirection){
    corners = 4;
    xCorners  = new int[]{-2,-5,5,-5 };
    yCorners  = new int[]{0,4,0,-4};
    myColor = color(255,255,255);
    myCenterX = myX;
    myCenterY = myY;
    myPointDirection = PointDirection;
    double dRadians =myPointDirection*(Math.PI/180);     
      
    myDirectionX = DirectionX +((10) * Math.cos(dRadians));    
    myDirectionY = DirectionY +((10) * Math.sin(dRadians));       
    ready = false;
    
  }
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
  public boolean getReady(){
    return ready;
  }
  public void setReady(){
    ready = true;
  }
  
  
  
  
}
