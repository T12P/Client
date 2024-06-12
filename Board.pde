class Board {

  private int w;
  private int h;
  private String[] a;

  private Select s;
  private Select[][] arr;

  Board(int h, String[] a) {
    this.a = a;
    this.w = this.a.length;
    this.h = h;

    this.arr = new Select[this.w][this.h];

    for (int i = 0; i < this.w; i = i + 1) {
        for (int j = 0; j < this.h; j = j + 1) {
            this.s = new Select(750 + 50 * j,25 + 50 * i,50,50, this.a[i]);
            this.arr[i][j] = this.s;
        }
    }
  }

  public void Draw() {
    fill(0);
    textSize(20);
    int i = 0;

    for (i = 0; i < this.w; i = i + 1) {

        fill(0);
        textSize(25);
        textAlign(CENTER, CENTER);
        text(this.a[i], 720, 50 + 50 * i);


        for (int j = 0; j < this.h; j = j + 1) {
            this.arr[i][j].Draw();
        }
    }

    fill(0);
    textSize(25);
    textAlign(CENTER, CENTER);
    if (selectedNumber != null) {
        text("Selected: " + str(selectedNumber), 720, 50 + 50 * i);
    }
  }
}
