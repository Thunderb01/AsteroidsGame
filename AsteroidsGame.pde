//your variable declarations here
Spaceship hero = new Spaceship();

boolean wOn = false;
boolean aOn = false;
boolean dOn = false;
boolean sOn = false;
boolean jOn = false;
boolean bulletLimit = false;
int limit = 5;
Star [] stars;
int g = 30;
int add = 1;
int lives = 3;
int dashes = 1;
int pewpewCount = 0;
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
ArrayList <Bullet> pewpew = new ArrayList <Bullet>();
ArrayList <HealthPack> heal = new ArrayList <HealthPack>();
int level = 1;

public void setup() 
{
  //your code here
  frameRate(g);
  background(0);
  size(1000,1000);
  stars = new Star[100];
  for(int i = 0; i< stars.length; i++){
    stars[i] = new Star((int)(Math.random()*1000),(int)(Math.random()*1000));
  }
  hero = new Spaceship();  
  makeAsteroid(10);
}
public void draw() 
{
  background(0);
  //your code here
  textSize(10);
  textAlign(RIGHT);
  fill(255,255,255);
  
  text("Level:" + level,50,30,100);
  
  if(frameCount%300==0){
    heal.add(new HealthPack());
  }  
  for(int i = 0; i < heal.size(); i++){
    heal.get(i).show();
    if(isCollision(heal.get(i).getCenterX(),heal.get(i).getCenterY(),hero.getCenterX(),hero.getCenterY())&&lives<3){
      lives++;
      heal.remove(i);
    }
  
  }
  
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
  }
  if(frameCount%300==0){
    if(dashes <3){
      dashes++;
    }
  }
  fill(173, 216, 230);
  noStroke();
  if(dashes == 3){
    ellipse((float)hero.getCenterX()-30,(float)hero.getCenterY()-30,5,5);
    ellipse((float)hero.getCenterX()-40,(float)hero.getCenterY()+00,5,5);
    ellipse((float)hero.getCenterX()-30,(float)hero.getCenterY()+30,5,5);
  } else if(dashes==2){
    ellipse((float)hero.getCenterX()-40,(float)hero.getCenterY()+00,5,5);
    ellipse((float)hero.getCenterX()-30,(float)hero.getCenterY()+30,5,5);
  } else if(dashes==1){
    ellipse((float)hero.getCenterX()-30,(float)hero.getCenterY()+30,5,5);
  } 
  fill(255,105,180);
  if(lives == 3){
    ellipse((float)hero.getCenterX()+30,(float)hero.getCenterY()+30,5,5);
    ellipse((float)hero.getCenterX()+40,(float)hero.getCenterY()+00,5,5);
    ellipse((float)hero.getCenterX()+30,(float)hero.getCenterY()-30,5,5);
  } else if(lives==2){
    ellipse((float)hero.getCenterX()+40,(float)hero.getCenterY()+00,5,5);
    ellipse((float)hero.getCenterX()+30,(float)hero.getCenterY()-30,5,5);
  } else if(lives==1){
    ellipse((float)hero.getCenterX()+30,(float)hero.getCenterY()-30,5,5);
  } 
  if(wOn == true){
    hero.accelerate(.25);
    hero.fire(-15,0,0);
   
  }
  if(aOn == true){
    hero.turn(-5);
  }
  if(dOn==true){
    hero.turn(5);
  }
  if(sOn == true){
    hero.accelerate(-.25);
    hero.fire(-20,0,PI);
  }
  hero.show();
  hero.move();
  for(int i =0; i < rocks.size(); i ++){
    rocks.get(i).turn(rocks.get(i).rotation);
    rocks.get(i).show();
    rocks.get(i).move();
  }
  if(pewpew.size()>=limit){
    bulletLimit = true;
  } else if(pewpew.size()<limit){
    bulletLimit = false;
  }
  if(jOn==true&&bulletLimit == false){
    pewpew.add(new Bullet(hero.getCenterX(),hero.getCenterY(),hero.getDirectionX(), hero.getDirectionY(), hero.getPointDirection()));
    
  }
  
  
  for(int i = 0; i < pewpew.size(); i++){
    
    pewpew.get(i).show();
    
    pewpew.get(i).move();
    if(pewpew.get(i).getCenterX()>=1000||pewpew.get(i).getCenterX()<=00||pewpew.get(i).getCenterY()<=00||pewpew.get(i).getCenterY()>=1000){
      pewpew.remove(i);
      pewpewCount--;
    }
    
  }
  for(int i = 0; i < rocks.size(); i++){
    if(isCollision(rocks.get(i).getCenterX(), rocks.get(i).getCenterY(), hero.getCenterX(),hero.getCenterY())){
      rocks.remove(i);
      lives--;
      if (lives==0){
        textSize(100);
        textAlign(CENTER);
        fill(255,255,255);
        background(0);
        text("GAME OVER",500,500,100);
        noLoop();
      }
    }
    for(int j = 0; j < pewpew.size(); j++){
      
      if(isCollision(rocks.get(i).getCenterX(), rocks.get(i).getCenterY(), pewpew.get(j).getCenterX(), pewpew.get(j).getCenterY())==true){
        rocks.remove(i);
        pewpew.remove(j);
        if(i>0){
          i=0;
        }
        if(j>0){
          j=0;
        }
        
      }
      if(rocks.size()==0){
        g+=10;
        frameRate(g);
        makeAsteroid(10+add);
        add+=2;
        limit++;
        level++;
      }  
      
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
     if(dashes>0){
       hero.freeze();
       hero.setCenterX((int)(Math.random()*width));
       hero.setCenterY((int)(Math.random()*height));
       dashes--;
     }
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
  if(Math.sqrt(((xa-xb)*(xa-xb))+((ya-yb)*(ya-yb)))<=20){
    return true;
  }  else{
    return false;
  }
  
}
public void makeAsteroid(int j){
  for(int i = 0; i< j; i++){
    rocks.add(new Asteroid());
    rocks.get(i).accelerate((double)(Math.random()*7));
  }
}
