//Declare new variable "circleX"
float circleX;
float dirrectionX;
float dirrandomX;
float speedX=4;

//Declare new variable "circleY"
float circleY;
float dirrectionY;
float speedY=2;
float angle;
//Paddle variable
float pwidth;
float pheight=20;
float plocationY;
float plocationX;

//Declare Counter
int counter=0;

//Game states
boolean gameover=false;
boolean gamestart=true;

void setup() {
  size(640, 660);    // since we use variables we can change the size of the window and still be able to play (we are just constrained by the text size)
  background(50);
  textAlign(CENTER);
  rectMode(CENTER);
  //Initialize variables
  circleX=random(80, width-80);
  circleY=15;
  plocationY=height-35;

  //set initial random direction X
  dirrandomX=random(-1, 1);
  dirrectionX=1;
  if (dirrandomX<0) {
    dirrectionX=-1;
  }
  //set initial direction Y
  dirrectionY=1;
}

void draw() {
  if (gamestart) {
    textSize(25);
    text("Ready to play?! Select a paddle:", width/2, height/2 );
    noFill();
    stroke(255);
    //Bottoms to select paddle size
    rect(width/2-150, height/2+40, 70, 30);
    text("[100]", width/2-150, height/2+50 );

    rect(width/2, height/2+40, 70, 30);
    text("[200]", width/2, height/2+50 );

    rect(width/2+150, height/2+40, 70, 30);
    text("[300]", width/2+150, height/2+50 );

    //Checking is the mouse is press and within the buttons
    if (mousePressed && mouseY>(height/2)+25 && mouseY<(height/2)+50 ) {
      if (mouseX>width/2-150-35 && mouseX<width/2-150+35 ) {
        pwidth=100;
        gamestart=false;
      } else if (mouseX>width/2-35 && mouseX<width/2+35) {
        pwidth=200;
        gamestart=false;
      } else if (mouseX>width/2+150-35 && mouseX<width/2+150+35) {
        pwidth=300;
        gamestart=false;
      }
    }
  }

  //Only play the game if the game states are not "over" or "start"
  if (!gameover && !gamestart) {

    //create the Crazy Rainbow Ball effect
    if (!mousePressed ) {
      background(50);
    }

    
    //set paddle X location as mouseX
    plocationX=mouseX;
    //Make sure the paddle stops on the end
    if (mouseX-pwidth/2<=0) {
      plocationX= pwidth/2;
    }
    if (mouseX+pwidth/2>=width) {
      plocationX= width-pwidth/2;
    }

    //Draw the interactive paddle

    fill(255);
    rect(plocationX, plocationY, pwidth, pheight);

    //Draw the ball
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(circleX, circleY, 24, 24);

    //Update circle direction X and Y
    circleX=circleX+(speedX*dirrectionX);
    circleY=circleY+(speedY*dirrectionY);

    //Change direction once it reaches right or left size
    if (circleX>=width || circleX<=0) {
      dirrectionX=dirrectionX*-1;
    }

    //Change direction once it reaches top 
    if (circleY<=0) {
      dirrectionY=dirrectionY*-1;
    }

    //Change direction once it touches the paddle, increase sped, and counter 
    if (circleY==(plocationY-pheight) && circleX>=(plocationX-pwidth/2) && circleX<=(plocationX+pwidth/2)) {
      dirrectionY=dirrectionY*-1;
      counter++;
      speedX+=0.5;
      speedY+=0.5;
    }
    angle=degrees(atan((speedY*dirrectionY)/(speedX*dirrectionX)));
    //Add score on top right corner
    textSize(30);
    fill(0, 102, 153, 204);
    text("Points:"+counter, width-150, 40 );
    text("Angle:" +angle, width-150,80);
    
  }

  //If ball pass the paddle: game over
  if (circleY>=height) {
    gameover=true;

    textSize(50);
    fill(0, 102, 153, 204);
    text("Game Over", width/2, height/2 );

    textSize(20);
    fill(0, 102, 153, 204);
    text("Press any key to start over", width/2, height/2+20 );
  }

  ////Reset the game by pressing any key
  if (keyPressed && gameover && !gamestart) {
    circleX=random(80, width-80);
    circleY=15;
    counter=0;
    speedX=4;
    speedY=2;
    gameover=false;
    gamestart=true;
    background(50);  //We need this here to remove all the previous text and game 
  }
}
