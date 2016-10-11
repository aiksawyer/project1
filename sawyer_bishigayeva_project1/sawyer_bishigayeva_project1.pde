/*new */





float counter;
float x = 20;
float fps = 1000.0;
int xTrans = width/2;
int yTrans = height/2;
int  y=0;

int r, g, b =0;

void setup() {
  size(400, 400);
}

void draw() {
  mainElement();
}

void mainElement() {
  frameRate(1000);
  background(255);
  counter++;
  ///translating to make the element rotate in the center of the canvas
  translate(width/2, height/2);
  rotate(counter*PI/180);
  if (counter>300) {

    fill(r, g, b);
    rect(0, 0, 50, 50); 

    frameRate(fps);
    fps=fps-.5;

    if (fps<10) {
      frameRate(10);
      spikes();
      if (counter>=2350) {
        translate(-width/2, -height/2);
        tired();
      }
    }
  }
  println(counter);
}


void spikes() {
  if (second() % 2 == 0) {  
    int alpha = 255;
    fill(255, 0, 0, alpha);
  }
  ///fill(random(200, 255), 0, 0, alpha);
  noStroke();

  triangle(-10, 25, -130, 13, -100, 47 );
  triangle(-5, -10, -130, -30, -100, -50);
  triangle(25, 75, 5, 175, 55, 200 );
  triangle(55, -10, 75, -150, 100, -30);
  triangle(70, 25, 160, 5, 100, 55 );
  triangle(25, -20, -5, -145, 45, -130);
}

void tired() {
  float angle = 0.0;
  for (int i = -400; i<= width+400; i+=35) {
    for (int y = -400; y <= height+400; y +=5) {
      float z = i + (sin(angle) * 35.0);
      angle += PI/40.0;
      noStroke();
      fill(#7971FF);
      rect(z, y, 2, 4);
    }
  }
}

void mousePressed() {
  noLoop();
}