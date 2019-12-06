class Spaceship extends Floater  
{   
  private Spaceship(){
   
   
   
    int n = 2;
    corners = 16;
    xCorners = new int[]{-10*n,-7*n,-3*n,3*n,5*n,10*n,10*n,2*n,2*n,10*n,10*n,5*n,3*n,-1*n,-7*n,-10*n};
    yCorners = new int[]{3*n,6*n,8*n,8*n,7*n,4*n,2*n,2*n,-2*n,-2*n,-4*n,-7*n,-8*n,-8*n,-6*n,-3*n};
    
    myColor = color(255,255,255);
    myPointDirection = 0;
    myCenterX = 500;
    myCenterY = 500;
  }
  public void setCenterX(int x){
    myCenterX = x;
  }
  public void setCenterY(int y){
    myCenterY= y;
  }
  public void freeze(){
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = (double)(Math.random()*360);
  
  }
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
  public double getDirectionX(){
    return myDirectionX;
  }
  public double getDirectionY(){
    return myDirectionY;
  }
  public double getPointDirection(){
    return myPointDirection;
  }
  public void fire(float fireX, float fireY, float orientation){
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    int col = 255;
    translate((float)myCenterX, (float)myCenterY);
    rotate(orientation+dRadians);
    int j = 10;
    for(int i = 0; i < 7; i++){
      fill(col,0,0);
      ellipse((float)fireX-5, (float)fireY, j,j);
      j--;
      
      fireX-=5;
      col-=50;
    }  
    rotate(orientation+(-1*dRadians));
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
