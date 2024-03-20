int diceRes1 = 4;
int diceRes2 = 3;

Select s;

void setup() {
    size(1000,1000);
    //s = new Select(200,100,50,50);
}
void draw() {
    fill(0);
    textSize(20);
    text("Dice Result 1: " + diceRes1, 20, 20);
    text("Dice Result 2: " + diceRes2, 20, 50);
    for (int i = 0; i < 5; i = i + 1) {
        for (int j = 0; j < 4; j = j + 1) {
            s = new Select(100 + 50 * j,100 + 50 * i,50,50);
            s.Draw();
        }
    }
}
