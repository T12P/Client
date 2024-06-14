public color textColor = color(0);
public color fieldColor = color(255);
public color fieldColorAlt = color(150);
public Integer selectedNumber = null;

public int highNumber;
public int lowNumber;


PImage bg;
Field f, z, y, k, u, v, a, b, c, d, e, h, j, l, m, i, o, r, t;
Wuerfel q, p;
Board g;

void setup() {
    size(1000,1000);
    bg = loadImage("background.png");
    bg.resize(1000,1000);

    g = new Board(4, new String[]{"Low", "High", "Sub", "Add", "Mult"});

    textSize(100);

    f = new Field(342, 121, fieldColor, fieldColorAlt, textColor);
    z = new Field(238, 149, fieldColor, fieldColorAlt, textColor);
    y = new Field(264, 254, fieldColor, fieldColorAlt, textColor);
    k = new Field(370, 276, fieldColor, fieldColorAlt, textColor);
    u = new Field(477, 297, fieldColor, fieldColorAlt, textColor);
    v = new Field(561, 228, fieldColor, fieldColorAlt, textColor);
    a = new Field(193, 335, fieldColor, fieldColorAlt, textColor);
    b = new Field(297, 357, fieldColor, fieldColorAlt, textColor);
    c = new Field(403, 379, fieldColor, fieldColorAlt, textColor);
    d = new Field(508, 402, fieldColor, fieldColorAlt, textColor);
    e = new Field(612, 422, fieldColor, fieldColorAlt, textColor);
    h = new Field(719, 435, fieldColor, fieldColorAlt, textColor);
    j = new Field(676, 336, fieldColor, fieldColorAlt, textColor);
    l = new Field(783, 349, fieldColor, fieldColorAlt, textColor);
    m = new Field(881, 389, fieldColor, fieldColorAlt, textColor);
    i = new Field(227, 437, fieldColor, fieldColorAlt, textColor);
    o = new Field(333, 459, fieldColor, fieldColorAlt, textColor);
    r = new Field(437, 482, fieldColor, fieldColorAlt, textColor);
    t = new Field(542, 503, fieldColor, fieldColorAlt, textColor);

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

    f.Draw();
    z.Draw();
    y.Draw();
    k.Draw();
    u.Draw();
    v.Draw();
    a.Draw();
    b.Draw();
    c.Draw();
    d.Draw();
    e.Draw();
    h.Draw();
    j.Draw();
    l.Draw();
    m.Draw();
    i.Draw();
    o.Draw();
    r.Draw();
    t.Draw();

    g.Draw();
}
