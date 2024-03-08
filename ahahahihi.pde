
public int textColor = 0;
public int fieldColor = 255;

class Wuerfel {
  Wuerfel(int low, int high) {
    this.low = low;
    this.high = high;
  }
  
  private int low;
  private int high;
  
  public int Run() {
    return int(random(this.low, this.high));
  }
}

class Field {
  Field(int x, int y) {
    this.posX = x;
    this.posY = y;
  }
  
  private int posX;
  private int posY;
  
  private int Value;
  private Boolean IsUsed = false;
  
  private Field[] Neighboring ={};
  
  public void SetValue(int v) {
    if (!this.IsUsed) {
      this.Value = v;
      this.IsUsed = !this.IsUsed;
      return;
    }
    throw new Error("Field Is Already Used.");
  }
  
  public int GetValue() {
    return this.Value;
  }
  
  public Boolean CheckIfUsed() {
    return this.IsUsed;
  }
  
  public void Draw() {   
    circle(this.posX, this.posY, 100);
    
    if (this.IsUsed) {     
      fill(textColor);
      textAlign(CENTER, CENTER);
      int lul = str(this.Value).length();
      textSize(100 / lul);
      
      text(str(this.Value), this.posX, this.posY);
      fill(fieldColor);
    }
  }
}

PImage bg;
Field f, z, y;
Wuerfel q, p;

void setup() {
  size(1000,1000);
  bg = loadImage("kekw.png");
  bg.resize(1000,1000);

  textSize(100);

  f = new Field(50, 50);
  z = new Field(200, 200);
  y = new Field(400, 400);
    
  f.SetValue(4);
  z.SetValue(12);
  
  p = new Wuerfel(0, 5);
  q = new Wuerfel(1, 6);
  
  println(p.Run());
  println(q.Run());
}

int qr, pr;
void draw() {
  background(bg);

  if (keyPressed == true) {
     qr = q.Run();
     pr = p.Run();
  }
    
  square(900, 900, 25);
  square(900, 950, 25);
  
  fill(textColor);
  text(str(qr), 900, 900);
  text(str(pr), 900, 950);
  fill(fieldColor);

  f.Draw();
  z.Draw();
}
