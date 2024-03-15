public color textColor = color(0);
public color fieldColor = color(255);
public color fieldColorAlt = color(150);
public int selectedNumber = -1;

public int highNumber;
public int lowNumber;


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
/*
void operations(int value1, int value2) {
int high;
int low;
if (value1 > value2) {
high = value1;
low = value2;
    } else if (value1 < value2) {
high = value2;
low = value1;
    } else if (value1 == value2) {
high = value1;
low = value2;
    }
if (keyPressed == true) {
if (key == '+') {
println(" + ");
selectedNumber = int(high + low);
} else if (key == '-') {
println(" - ");
selectedNumber = int(high - low);
} else if (key == '*') {
println(" * ");
selectedNumber = int(high * low);
} else if (key == '/') {
if (high == 0 || low == 0) {
selectedNumber = -1;
} else {
println(" / ");
selectedNumber = int(high / low);
}
}
    }
}
*/

void highLowCheck(int value1, int value2) {
    if (value1 > value2) {
        highNumber = value1;
        lowNumber = value2;
    } else if (value1 < value2) {
        highNumber = value2;
        lowNumber = value1;
    } else if (value1 == value2) {
        highNumber = value1;
        lowNumber = value2;
    }
}

void draw() {
    background(bg);
    
    highLowCheck(p.exposeValue(), q.exposeValue());
    
    fill(textColor);
    textSize(25);
    text("Calculations:", 600, 30);
    text("Low: " + str(lowNumber), 600, 60);
    text("High: " + str(highNumber), 600, 90);
    text("Subtraction: " + str(highNumber - lowNumber), 600, 120);
    text("Addition: " + str(highNumber + lowNumber), 600, 150);
    text("Multiplication: " + str(highNumber * lowNumber), 600, 180);
    
    
    p.Draw();
    q.Draw();
    
    f.Draw();
    z.Draw();
    y.Draw();
}
