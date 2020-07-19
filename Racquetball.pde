boolean ballMove=false;// Set variable to false, so that ball doesn't move until any key is pressed
float circleX;// Ball's x position            
float circleY;// Ball's y position  
float radX=24;// Ball's diameter
float xDirection;
float yDirection;
int counter=0;// Score
int count=0;// Variable that stores number of times key is pressed
String s;
String c;
String t;
String l;
String a;
String b;
String d;
String g;
String k;
String m;
String u;
String w;
float speed;// Speed of the ball
float number=random(-1,1);// Number that allows to randomly select direction of ball (left or right)
float rectX;// Paddle's center's x position
float rectY=320;// Paddle's center's y position
float rectW=50;// Paddle's radius
float rectH=10;// Paddle's height

void setup (){      
  size (640, 360);// Size of the window  
}

void draw() {  
  // "Crazy rainbow ball" feature
  if(mousePressed==false){
    background(0);
  }
  
  if(count==0){
    textSize(20);
    l="Press any key to start the game.";
    u="To enable Crazy Rainbow Ball effect press the mouse.";
    text(l,175,170);
    text(u,70,200);
  }
  
  /* EXTRA CREDIT
  // Buttons that allow player to select paddle with a different size
  if(count==0){
    textSize(18);
    w="Select size of paddle. The bigger the paddle, the faster the ball.";
    text(w,55,230);
  }
  rectMode(RADIUS);
  fill(0);
  stroke(255);
  textSize(15);
  a="Small paddle";
  b="Medium paddle";
  d="Large paddle";
  fill(0);
  rect(560,80,60,10);// Small 100px paddle button
  rect(560,110,60,10);// Medium 150 px paddle button
  rect(560,140,60,10);// Large 200 px paddle button
  fill(255);
  text(a,515,85);
  text(b,505,115);
  text(d,515,145);
  */
  
  // Selection of paddle by pressing on buttons
  if(mouseX>520&&mouseX<620&&mouseY>70&&mouseY<90&&mousePressed==true){
    rectW=50;
  }
  else if(mouseX>520&&mouseX<620&&mouseY>100&&mouseY<120&&mousePressed==true){
    rectW=75;
  }
  else if(mouseX>520&&mouseX<620&&mouseY>130&&mouseY<150&&mousePressed==true){
    rectW=100;
  }
  
  
  // "Points:" caption
  textSize(30);
  fill(255);
  s="Points:";
  text(s,500,50);
 
  // Paddle
  rectMode(RADIUS);
  fill(255);
  stroke(0);
  rectX=mouseX;
 
  // Setting paddle only inside of the window
  if(rectX>=width-rectW){
    rectX=width-rectW;
  }
  else if(rectX<=rectW){
    rectX=rectW;
  }
 
  rect(rectX,rectY,rectW,rectH);
 
  // Ball
  fill (random(0, 255), random (0, 255), random (0, 255));// Filling ball with random colors
  ellipse (circleX, circleY, radX, radX);  

  // Bouncing off
  if (circleX > width) {    
    xDirection = -2-speed;// Bouncing off the right side of the window
  }

  if (circleX < 0){  
    xDirection = 2+speed;// Bouncing off the left side of the window
  }    
 
  if (circleY < 0) {  
    yDirection = 2+speed;// Bouncing off the upper side of the window
  }    
 
  // Bouncing off the paddle
  if((circleX<=mouseX+rectW)&&(circleX>=mouseX-rectW)&&(circleY==rectY-(rectH+(radX/2)))){
    speed=speed+1;// Increasing speed after each touch of the paddle
    yDirection=-2-speed;// Reversing direction
    counter=counter+1;// Incremeting score each time ball touches the paddle
  }
 
  c=Integer.toString(counter);// Casting counter variable from integer to String type
  textSize(30);
  fill(255);
  text(c,600,50);// Score displayed in the upper-right corner of the window

  // Ball misses the paddle
  if(circleY>height){
    speed=1;// Reset speed to 1
   
    /* EXTRA CREDIT
    // Allow player to select paddle size
    rectMode(RADIUS);
    fill(0);
    stroke(255);
    textSize(15);
    a="Small paddle";
    b="Medium paddle";
    d="Large paddle";
    fill(0);
    rect(560,80,60,10);
    rect(560,110,60,10);
    rect(560,140,60,10);
    fill(255);
    text(a,515,85);
    text(b,505,115);
    text(d,515,145);
   
    if(mouseX>520&&mouseX<620&&mouseY>70&&mouseY<90&&mousePressed==true){
      rectW=50;
    }
    else if(mouseX>520&&mouseX<620&&mouseY>100&&mouseY<120&&mousePressed==true){
      rectW=75;
    }
    else if(mouseX>520&&mouseX<620&&mouseY>130&&mouseY<150&&mousePressed==true){
      rectW=100;
    }
    */
   
    ballMove=false;// Set variable to false to stop the ball
   
    // Display "Game Over" text
    fill(255);
    textSize(50);
    t="Game Over";
    text(t,180,180);
    textSize(20);
    l="Press any key to start over.";
    text(l,185,210);
    
    /* EXTRA CREDIT
    textSize(20);
    g="Select small, medium, or large paddle.";
    text(g,130,235);
    */
  }
 
 
  // Allow ball to move if key is pressed at the beginning of game
  if(ballMove==true){
    circleX = circleX + xDirection;  
    circleY = circleY + yDirection;  
  }
  
}

void keyPressed(){
  ballMove=true;

  number=random(-1,1);
 
  // Random generation of ball's direction along x-axis
  if(number>0){
    xDirection=2;
  }
  else{
    xDirection=-2;
  }
   
  yDirection=2;
 
  circleX=random(0,width);// Random ball's x position
  circleY = 0;// Ball's y position is at the top of the window
 
  counter=0;// Reset score to 0
  speed=1;// Reset speed to 1;
  count=count+1;
  
  /* EXTRA CREDIT
  if(rectW==50){
    speed=1;
  }
  else if(rectW==75){
    speed=3;
  }
  else if(rectW==100){
    speed=5;
  }
  */
}
