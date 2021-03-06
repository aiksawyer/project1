/*new verion, same idea
 ADJECTIVE ----- SORE
 less literal interpretation
 
 an element – rect – rotates on the screen. shows motion/exertion
 gradually slows down, showing fatigue
 red blinking spikes appear, representing sharp pain
 green sinwaves appear, representing nausea
 soreness continues
 */
////declaring and instantiating global variables

float counter; //counter is used to track time and control loops
float fps = 1000.0; ///starting frame rate

///will generate random color of the main element
float r = random(0, 255);
float g = 0; //dont want to get green hues because need to separate from other elements
float b = random(0, 255);
float alpha = 255;

//variables for the cramp element
int xSpiral, ySpiral  =40;  ///
float start = 0; 
float stop = PI;

color bg = #8fc9d1; ///gentle blue

void setup() { ///setting up the canvas
  size(400, 400);
}

void draw() {  ///all the secondary functions are in main function
  strokeWeight(.3);
  mainElement();
  mousePressed();
}

void mainElement() {  ///secondary elements are called within this element
  frameRate(fps); 
  background(bg); ///gentle blue

  counter++;  ///starting counter

  ///translating to make the element rotate in the center of the canvas
  translate(width/2, height/2);
  rotate(counter*PI/180);

  if (counter>200) { ///first condition statement, when to strat drawing
    /// draws the main element at 200
    fill(r, g, b, alpha);
    rect(0, 0, 50, 50); ///this rect is the main element. 
    ///rotates around upper left corner  --- exertion

    frameRate(fps);
    fps=fps-.5;   ///slowing down the animation

    if (fps<10) {     ///second condition statement, when to maintain frameRate
      frameRate(10);  /// now the frame rate is stable
      spikes();       ///draw the blinking spikes ---- pain

      if (counter>=2250) {  ///third condition statement, when to add more elements
        translate(-width/2, -height/2);  ///translate back to draw correctly
        sinwave();  ///draw the wavy lines
        if (counter>=2400) { //when to start dimming the opasity
          alpha=alpha-5;
          if (second() % 5 == 0) {   ///call cramp(); every 5 secs
            cramp();
            if (counter>=2550) {
              noLoop();
              background(255);
            }
          }
          noFill();
        }
      }
    }
  }
  println(counter);  ///printing the counter to track the time
}


void spikes() {              ///these spikes represent pain
  if (second() % 2 == 0) {   ///they flicker from red to black every 2 seconds
    fill(255, 0, 0, alpha);
  } else {
    fill(0, alpha);
  }
  ///drawing the spikes
  triangle(-10, 25, -130, 13, -100, 47 );
  triangle(-5, -10, -130, -30, -100, -50);
  triangle(25, 75, 5, 175, 55, 200 );
  triangle(55, -10, 75, -150, 100, -30);
  triangle(70, 25, 160, 5, 100, 55 );
  triangle(25, -20, -5, -145, 45, -130);
}

void sinwave() {  ///these wavy lines represent nausea
  float angle = 0.0;  ///setting up the sin lines
  for (int i = -400; i<= width+400; i+=35) {
    for (int y = -400; y <= height+400; y +=5) {
      float z = i + (sin(angle) * 35.0);
      angle += PI/40.0;
      fill(#a29e14, alpha); ///puke green
      rect(z, y, 2, 4);
    }
  }
}



/////used mousePressed to check and time the counter
void MousePressed() {
  noLoop();
}


void cramp() {  ///this represents cramps
  noFill();
  arc(width/2, height/2, xSpiral, ySpiral, start, stop); ///arc


  if (xSpiral%2==0) {  //if conditional that colors arcs 2 different colors
    stroke(255);
    strokeWeight(2);
  } else {
    stroke(0);
    strokeWeight(3);
  }


  if (xSpiral<600) { //increases width and changes start and stop radians
    xSpiral=xSpiral+15;
    start=start+QUARTER_PI/2;
    stop=stop+QUARTER_PI/2;
  }

  if (ySpiral<600) {  ///increases height
    ySpiral=ySpiral+15;
  }
}