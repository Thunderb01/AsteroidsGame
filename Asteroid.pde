class Asteroid extends Floater
{
  private int rotation;
  private Asteroid(){
    corners = 9;
    xCorners = new int[]{-8,8,16,16,8,-8,-16,-16,-8};
    yCorners = new int[]{-16,-16,-8,8,16,16,8,-8,-16};
    myCenterX = (double)(Math.random()*1000);
    myCenterY = (double)(Math.random()*1000);
    //for(int i = 0; i < corners; i++){
    //  xCorners[i] = (int)(Math.random()*30)-15;
    //  yCorners[i] = (int)(Math.random()*30)-15;
      
    //}
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
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