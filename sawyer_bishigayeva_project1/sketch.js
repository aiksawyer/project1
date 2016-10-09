/*ADJECTIVE ––– SORE
  
a figure (stick figure??    rect) is fired up for movement
  
various animations of exercise – jumping through other objects, running
show movement??? scenery passing by, lines of movement
  
figure gets slower and slower until stop
red pointy figures to indicate pain/ blue flowy figures for fatigue
spend more time on this part – how soreness impedes movement? visual expression
  
relaxation? stretching movements, peaceful scenery, water??
  
figure goes to sleep ??? show sleep – nighttime, peace, unchanging scenery
  
wakes up happy and ready to move again
*/



function setup() {
  createCanvas(800, 500);
  background(255);
}

function draw() {

  noStroke();
  fill(255);
  rect(0, 0, width, height / 2);
  fill(0);
  rect(0, height / 2, width, height);
  fill(255, 0, 0);
  rect(width / 2 - 100, height / 2 - 30, 45, 45);
  keyPressed();
  obstacle = new Obstacles(2);

}
///creating obstacles – 5 objects that rect interacts with differently 
///they appear in random order in the left side of the screen and slide towards rect
///  create a function with 5 diff types

function Obstacles(type) {
  this.type = type;
  switch (this.type) {
    case 1:
      this.obstacle = "A";
      hurdle();
      break;
    case 2:
      this.obstacle = "B";
      hurdleSlide();
      break;
    case 3:
      this.obstacle = "C";
      hoop();
      break;
    case 4:
      this.obstacle = "D";
      tunnel();
      break;
    case 5:
      this.obstacle = "E";
      ladder();
      break;
    default:
      this.obstacle = "lol";
      break;
  }

}

function hurdle(x) {
  x = width;
  strokeWeight(5);
  stroke(0, 0, 255);
  line(x, height / 2, x, height / 2 + 100);
  line(x - 200, height / 2 - 100, x, height / 2);
  line(x - 200, height / 2 - 100, x - 200, height / 2);
}

function hurdleSlide(x) {
  x = width;
  strokeWeight(5);
  stroke(0, 0, 255);
  line(x, height / 2, x, height / 2 + 120);
  line(x - 100, height / 2 - 70, x - 100, height / 2 + 50);
  line(x - 100, height / 2 - 70, x, height / 2);
}

function hoop() {
  strokeWeight(5);
  stroke(0, 0, 255);
  noFill();
  ellipse(width, height / 2 - 150, 50, 170);
}


function tunnel() {
  strokeWeight(0);
  stroke(0, 0, 255);
  fill(0, 0, 255);
  rect(width - 100, height / 2, 50, 100);
  rect(width - 50, height / 2 + 50, 50, 50);
  rect(width, height / 2, 50, 100);


}

function ladder() {
  strokeWeight(5);
  stroke(0, 0, 255);
  fill(0, 0, 255);
  arc(width, height / 2, 200, 200, PI, 0);
  fill(255);
  arc(width, height / 2, 100, 100, PI, 0);
  noFill;

}

function keyPressed() {
  if (keyCode === RIGHT_ARROW) {
    println("arrow is pressed");
    translate(-1, 0);
  }
}

///checking git app