PImage bg;
boolean move = false;
 
 
ArrayList particles = new ArrayList();
 
void setup(){
  size(799,1200);
  bg = loadImage("rain.jpg");
  smooth();
  cursor(CROSS);
  frameRate(50);
  
  
}
  
void draw(){
  
background(bg);
   
    
    for (int k = 2; k < 40; k++){
       particles.add(new Particle(350,-500));
        if(keyPressed == true){
    
    k = k +5;
        }
    }
     
  
    for (int i = 2; i < particles.size(); i++){
    Particle p = (Particle)particles.get(i);
     
 
    p.update();
    p.rain();
     if(keyPressed == true){
    i = i +5;
     
     }
     
}
  }
   
 
 
 
class Particle{
   
 float x,y;
 float xSpeed,ySpeed;
 float gravity;
  
 float bounce;
 
 
   Particle(float inX, float inY){
 
   x = inX;
   y = inY;
   
   gravity = 1;
   bounce = 1;
    
//Positions released  
  xSpeed = random(-10,10);
  ySpeed = random(-15,15);
  
 }
  
void update(){
 
   ySpeed += gravity;
    
   x += xSpeed;
   y += ySpeed;
  
  
 //WIND effect -
 if(mouseButton == LEFT){
   gravity = 1;
 }
 
   if( mouseButton == RIGHT && mouseX<50){
     gravity = -1;
   }
   if(mouseButton == RIGHT && mouseX>100){
     gravity = 5;
   }
      
      
//Movement based off mousex/y or pmouseX/y ...?
    
  if((y >= height + 10)&&(ySpeed > 0)){
    ySpeed *= bounce;
   
  //abs(mouseX,mouseY,
   
  }
 }
  
void rain(){
    
  
  fill(255);
  point(x,y);
 
 }
}
 
void lightning(){
 
  
int st=round(random(700));
int end=350;
int y = 0;
int y2 = 40;
 
 
while ( y2 < 500){
 
 end = (st-40) + round(random(80));
 stroke (255);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end;
  
 end = (st-40) + round(random(80));
 stroke (255);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end;
  
 }
}
 
void mouseClicked() {
 lightning();
 lightning();
  
 
}
 
void mousePressed(){
 
  rect(0,0,799,1200);
  fill(255,70);
  frameRate(30);
  loop();
  }
  
  
void mouseMoved(){
  
move = true;
   
}