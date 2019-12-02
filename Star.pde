class Star //note that this class does NOT extend Floater
{
  //your code here
  public int myX, myY;
  public Star(int x, int y){
    myX = x;
    myY = y;
  }
  public void show(){
    fill(255,255,255);
    stroke(255,255,255);
    point(myX,myY);
  }
}
