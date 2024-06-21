public color textColor = color(0);
public color fieldColor = color(255);
public color fieldColorAlt = color(150);
public Integer selectedNumber = null;
public Integer diceCount = 1;
public Integer lastDiceCount = 0;
public Boolean initialRun = true;
public int points = 0;

public int highNumber;
public int lowNumber;


PImage bg;
Wuerfel q, p;
Board g;
Map map;

void setup() {
    size(1000,1000);
    bg = loadImage("backgroundW.png");
    bg.resize(width,height);

    g = new Board(4, new String[]{"Low", "High", "Sub", "Add", "Mult"});

    textSize(100);

    map = new Map(new Field[]{
        new Field(int(0.342 * width), int(0.121 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.238 * width), int(0.149 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.264 * width), int(0.254 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.370 * width), int(0.276 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.477 * width), int(0.297 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.561 * width), int(0.228 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.193 * width), int(0.335 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.297 * width), int(0.357 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.403 * width), int(0.379 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.508 * width), int(0.402 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.612 * width), int(0.422 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.719 * width), int(0.435 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.676 * width), int(0.336 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.783 * width), int(0.349 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.881 * width), int(0.389 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.227 * width), int(0.437 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.333 * width), int(0.459 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.437 * width), int(0.482 * height), fieldColor, fieldColorAlt, textColor),
        new Field(int(0.542 * width), int(0.503 * height), fieldColor, fieldColorAlt, textColor),
    });

    map.generateNeighbours();

    p = new Wuerfel(0, 5, width - 100, int(height * 0.75 - 50), color(255, 255, 255), textColor);
    q = new Wuerfel(1, 6, width - 50, int(height * 0.75 - 50), color(255, 247, 0), textColor);

    p = new Wuerfel(0, 5, 830, 700, color(255, 255, 255), textColor);
    q = new Wuerfel(1, 6, 920, 700, color(255, 247, 0), textColor);
}

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

    // fill(textColor);
    // textSize(25);
    // textAlign(CENTER, CENTER);
    // text("Calculations:", 600, 30);
    // text("Low: " + str(lowNumber), 600, 60);
    // text("High: " + str(highNumber), 600, 90);
    // text("Subtraction: " + str(highNumber - lowNumber), 600, 120);
    // text("Addition: " + str(highNumber + lowNumber), 600, 150);
    // text("Multiplication: " + str(highNumber * lowNumber), 600, 180);

    // if (keyPressed) {
    // if (key == 'l' || key == 'L') {
    // selectedNumber = lowNumber;
    // } else if (key == 'h' || key == 'H') {
    // selectedNumber = highNumber;
    // } else if (key == 's' || key == 'S') {
    // selectedNumber = highNumber - lowNumber;
    // } else if (key == 'a' || key == 'A') {
    // selectedNumber = highNumber + lowNumber;
    // } else if (key == 'm' || key == 'M') {
    // selectedNumber = highNumber * lowNumber;
    // }
// }

    // text("Selected: " + str(selectedNumber), 600, 210);

    // circle(mouseX, mouseY, 100);
    // if (mousePressed == true) {
    //  println("y = new Field(" + str(mouseX) + ", " + str(mouseY) + ", fieldColor, fieldColorAlt, textColor);");
// }

    p.Draw();
    q.Draw();

    map.Draw();

    g.Draw();

    if (keyPressed) {
        if (key == 'e') {
            map.Evaluate();
            println(points);
            points = 0;
        }
    }
}
