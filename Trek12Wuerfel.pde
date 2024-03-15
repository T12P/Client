

void setup() {
PImage img;
size(1000,1000);   
img = loadImage("Spielfeld.png");
img.resize(1000,1000);
background(img);
}

void draw (){

fill(255,0,0);
rect(830,920,50,50);
fill(0);
textSize(80);
textAlign(CENTER,CENTER);
text("x",855,925);


fill(255,247,0);
rect(920,920,50,50);

fill(0);
textSize(80);
textAlign(CENTER,CENTER);
text("x",945,925);



}
