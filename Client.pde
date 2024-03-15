public color textColor = color(0);
public color fieldColor = color(255);
public color fieldColorAlt = color(150);
public int selectedNumber = -1;

PImage bg;
Field f, z, y;
Wuerfel q, p;

void setup() {
    size(1000,1000);
    bg = loadImage("background.png");
    bg.resize(1000,1000);
    
    textSize(100);
    
    f = new Field(50, 50, fieldColor, fieldColorAlt, textColor);
    z = new Field(200, 200, fieldColor, fieldColorAlt, textColor);
    y = new Field(400, 400, fieldColor, fieldColorAlt, textColor);
    
    f.SetValue(4);
    z.SetValue(12);
    
    p = new Wuerfel(0, 5, 830, 920, color(255, 0, 0), textColor);
    q = new Wuerfel(1, 6, 920, 920, color(255, 247, 0), textColor);
}

void operations(int value1, int value2) {
    if (keyPressed == true) {
        if (key == '+') {
            println(" + ");
            selectedNumber = int(value1 + value2);
        } else if (key == '-') {
            println(" - ");
            selectedNumber = int(value1 - value2);
        } else if (key == '*') {
            println(" * ");
            selectedNumber = int(value1 * value2);
        } else if (key == '/') {
            println(" / ");
            selectedNumber = int(value1 / value2);
        }
    }
}

void draw() {
    background(bg);
    
    operations(p.exposeValue(), q.exposeValue());
    
    fill(textColor);
    text("Calculation: " + str(selectedNumber), 800, 100);
    
    p.Draw();
    q.Draw();
    f.Draw();
    z.Draw();
    y.Draw();
}
