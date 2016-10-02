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

var obstacles;


function setup() {
  createCanvas(800, 500);
  background(255);

}

function draw() {
  noStroke();
  fill(0, 191, 255);
  rect(0, 0, width, height / 2);
  fill(207, 83, 0);
  rect(0, height / 2, width, height);
  fill(255, 0, 0);
  rect(width / 2 - 100, height / 2 - 30, 70, 70);
  obstacles = new Obstacles(random(1,5));




}
///creating obstacles – 5 objects that rect interacts with differently 
///they appear in random order in the left side of the screen and slide towards rect
///  create a function with 5 diff types

function Obstacles(type) {
  this.type = type;
  switch (this.type) {
    case 1:
      this.obstacle = "A";
    case 2:
      this.obstacle = "B";
    case 3:
      this.obstacle = "C";
    case 4:
      this.obstacle = "D";
    case 5:
      this.obstacle = "E";
    default:
      this.obstacle = "lol";
  }

  
}



///checking git app