class Spaceship extends Floater  
{   
  private Spaceship(){
   
   
   
    corners = 11;
    xCorners = new int[corners];
    yCorners = new int[corners];
    int myYcorner;
    int myXcorner;
   
    myXcorner = -10;
    for (int i = 0; i < (int)(corners/2); i++){
        
      myXcorner+=3*i;
      myYcorner = (int)(Math.random()*10);
        
      xCorners[i]=myXcorner;
      xCorners[corners-i-1]=myXcorner;
      yCorners[i]=myYcorner;
      yCorners[corners-i-1]=-myYcorner;
    }
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
    for(int i = 0; i < 5; i++){
      fill(col,0,0);
      ellipse((float)fireX, (float)fireY, 10,10);
      
      
      fireX-=5;
      col-=50;
    }  
    rotate(orientation+(-1*dRadians));
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
