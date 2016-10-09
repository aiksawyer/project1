
float counter;
float jitter;
float fps = 100;

int r, g, b =0;

void setup() {
  counter=0.0;
  size(300, 300);
  frameRate(fps);
}

void draw() {
  background(255);
  counter++;

  translate(width/2, height/2);
  rotate(counter*TWO_PI/360);
  fill(r, g, b);
  rect(0, 0, 50, 50); 
  
  if(counter<350){
    fps=100;
  }else{
    fps--;
  }
  println(counter);
  

}