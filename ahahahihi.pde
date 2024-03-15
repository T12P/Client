
public int textColor = 0;
public int fieldColor = 255;
public int fieldColorAlt = 150;

class Wuerfel {
  Wuerfel(int low, int high, int posX, int posY, color diceColor) {
    this.low = low;
    this.high = high;
    this.posX = posX;
    this.posY = posY;
    this.diceColor = diceColor;
  }
  
  private int low;
  private int high;
  private int posX;
  private int posY;
  private color diceColor;
  private int lastDiceValue;
  
  public int exposeValue() {
    return this.lastDiceValue;
  }


  public int Run() {
    return int(random(this.low, this.high));
  }

  public void Draw() {
    if (keyPressed == true && key == ' ') {
      this.lastDiceValue = this.Run();
    }
    fill(this.diceColor);
    square(this.posX, this.posY, 50);
    
    fill(textColor);
    text(str(this.lastDiceValue), this.posX, this.posY);
    fill(fieldColor);
  }
}

class Field {
  Field(int x, int y) {
    this.posX = x;
    this.posY = y;
  }
  
  private int posX;
  private int posY;
  private int size = 100;
  
  private int Value;
  private Boolean IsUsed = false;
  
  private Field[] Neighboring ={};
  
  // Button Test

  private Boolean clicked = false;
  private Boolean overButton = false;
  private Boolean numberShown = false;

  private void Update() {
    if (overCircle()) {
      this.overButton = true;
    } else {
      this.overButton = false;
    }
    this.mouseClicked();
  }

  private Boolean overCircle() {
    float disX = this.posX - mouseX;
    float disY = this.posY - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < this.size/2 ) {
      return true;
    } else {
      return false;
    }
  }

  private void mouseClicked() {
    if (this.overButton && mousePressed) {
      this.numberShown = true;
      println("KEKW");
    }
  }

  // Button Test End

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
    this.Update();

    if (this.overButton) {
      fill(fieldColorAlt);
    } else {
      fill(fieldColor);
    }

    circle(this.posX, this.posY, this.size);
    
    if (this.IsUsed) {     
      fill(textColor);
      textAlign(CENTER, CENTER);
      int lul = str(this.Value).length();
      textSize(100 / lul);
      
      if (this.numberShown) {
        text(str(this.Value), this.posX, this.posY);
      }
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
  
  p = new Wuerfel(0, 5, 830, 920, color(255, 0, 0));
  q = new Wuerfel(1, 6, 920, 920, color(255, 247, 0));
}

int operations(int value1, int value2) {
  if (keyPressed == true) {
    if (key == '+') {
      println("+");
      return int(value1 + value2);
    } else if (key == '-') {
      println("-");
      return int(value1 - value2);
    } else if (key == '*') {
      println("*");
      return int(value1 * value2);
    } else if (key == '/') {
      println("/");
      return int(value1 / value2);
    } else {
      return -1;
    }
  }
  return -1;
}

void draw() {
  background(bg);

  println(operations(p.exposeValue(), q.exposeValue()));

  p.Draw();
  q.Draw();
  f.Draw();
  z.Draw();
  y.Draw();
}
