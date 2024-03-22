Select s;

public Select[][] arr = new Select[5][4];

void setup() {
    size(1000,1000);
    for (int i = 0; i < 5; i = i + 1) {
        for (int j = 0; j < 4; j = j + 1) {
            s = new Select(100 + 50 * j,100 + 50 * i,50,50);
            arr[i][j] = s;
        }
    }
}
void draw() {
    fill(0);
    textSize(20);
    for (int i = 0; i < 5; i = i + 1) {
        for (int j = 0; j < 4; j = j + 1) {
            arr[i][j].Draw();
        }
    }
}
