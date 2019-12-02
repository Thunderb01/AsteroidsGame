//your variable declarations here
Spaceship hero = new Spaceship();

boolean wOn = false;
boolean aOn = false;
boolean dOn = false;
boolean sOn = false;
boolean jOn = false;
Star [] stars;

ArrayList <Asteroid> joe = new ArrayList <Asteroid>();
ArrayList <Bullet> pewpew = new ArrayList <Bullet>();

public void setup() 
{
  //your code here
  background(0);
  size(1000,1000);
  stars = new Star[100];
  for(int i = 0; i< stars.length; i++){
    stars[i] = new Star((int)(Math.random()*1000),(int)(Math.random()*1000));
  }
  hero = new Spaceship();
  
  for(int i = 0; i< 10; i++){
    joe.add(new Asteroid());
    joe.get(i).accelerate((double)(Math.random()*7));
  }
  
  
}
public void draw() 
{
  //your code here
  background(0);
  
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
  }
  
  if(wOn == true){
    hero.accelerate(.05);
    hero.fire(-15,0,0);
   
  }
  if(aOn == true){
    hero.turn(-3);
  }
  if(dOn==true){
    hero.turn(3);
  }
  if(sOn == true){
    hero.accelerate(-.05);
    hero.fire(-20,0,PI);
  }
  hero.show();
  hero.move();
  for(int i =0; i < joe.size(); i ++){
    joe.get(i).turn(joe.get(i).rotation);
    joe.get(i).show();
    joe.get(i).move();
  }
  if(jOn==true){
    
    pewpew.add(new Bullet(hero.getCenterX(),hero.getCenterY(),hero.getDirectionX(), hero.getDirectionY(), hero.getPointDirection()));
  }
  for(int i = 0; i < pewpew.size(); i++){
    
    pewpew.get(i).show();
    pewpew.get(i).accelerate(.5);
    pewpew.get(i).move();
    if(pewpew.get(i).getCenterX()>=1000||pewpew.get(i).getCenterX()<=00||pewpew.get(i).getCenterY()<=00||pewpew.get(i).getCenterY()>=1000){
      pewpew.remove(i);
    }
  }
  for(int i = 0; i < joe.size(); i++){
    if(isCollision(joe.get(i).getCenterX(), joe.get(i).getCenterY(), hero.getCenterX(), hero.getCenterY())==true){
      joe.remove(i);
    }
  }
  

}
public void keyPressed(){
   if(key == 'w' || key == 'W'){
     wOn = true;
   }  
   if(key == 'a' || key == 'A'){
     aOn = true;
   }
   if(key == 'd' || key == 'D'){
     dOn = true;
   }
   if(key == 's' || key == 'S'){
     sOn = true;
   }
   if(key == 'k' || key == 'K'){
    hero.freeze();
    hero.setCenterX((int)(Math.random()*width));
    hero.setCenterY((int)(Math.random()*height));
   }
   if(key == 'j' || key == 'J'){
     jOn = true;
     
   }
   
}
public void keyReleased(){
  if(key == 'w' || key == 'W'){
    wOn = false;
  }
  if(key == 'a' || key == 'A'){
    aOn = false;
  }
  if(key == 'd' || key == 'D'){
    dOn = false;
  }
  if(key == 's' || key == 'S'){
    sOn = false;
  }
  if(key == 'j' || key == 'J'){
    jOn = false;
  }
  
}
public boolean isCollision(double xa, double ya, double xb, double yb){
  if(Math.sqrt(((xa-xb)*(xa-xb))-((ya-yb)*(ya-yb)))<=5){
    return true;
  }  else{
    return false;
  }
  
}
