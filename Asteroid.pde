class Asteroid extends Floater
{
  private int rotation;
  private Asteroid(){
    corners = 9;
    xCorners = new int[]{-8,8,16,16,8,-8,-16,-16,-8};
    yCorners = new int[]{-16,-16,-8,8,16,16,8,-8,-16};
    myCenterX = (double)(Math.random()*1000);
    myCenterY = (double)(Math.random()*1000);
    
    myColor = color(169,169,169);
    myPointDirection = (double)(Math.random()*360);
    rotation = (int)(Math.random()*20);
  }
  public void setCenterX(int x){
    myCenterX = x;
  }
  public void setCenterY(int y){
    myCenterY= y;
  }
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
}
