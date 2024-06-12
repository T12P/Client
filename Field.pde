class Field {
    private int posX;
    private int posY;
    private int size = 100;
    private color fColor;
    private color fColorAlt;
    private color tColor;

    private int Value;
    private Boolean IsUsed = false;

    private Field[] Neighboring = {};

    Field(int x, int y, color fieldColor, color fieldColorAlt, color textColor) {
        this.posX = x;
        this.posY = y;
        this.fColor = fieldColor;
        this.fColorAlt = fieldColorAlt;
        this.tColor = textColor;
    }

    //Button Test

    private Boolean clicked = false;
    private Boolean overButton = false;
    private Boolean numberShown = false;

    private void Update() {
        this.overButton = this.overCircle();
        if (this.overButton && mousePressed && selectedNumber != null) {
            this.SetValue(selectedNumber);
            this.numberShown = true;
        }
    }

    private Boolean overCircle() {
        float disX = this.posX - mouseX;
        float disY = this.posY - mouseY;
        if (sqrt(sq(disX) + sq(disY)) < this.size / 2) {
            return true;
        } else {
            return false;
        }
    }

    //Button Test End

    public void SetValue(int v) {
        if (!this.IsUsed) {
            this.Value = v;
            this.IsUsed = !this.IsUsed;
            selectedNumber = null;
        }
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
            fill(this.fColorAlt);
        } else {
            fill(this.fColor);
        }

        circle(this.posX, this.posY, this.size);

        if (this.IsUsed) {
            fill(this.tColor);
            textAlign(CENTER, CENTER);
            textSize(60);

            int length = str(this.Value).length();

            if (this.numberShown && length >= 2) {
                text(str(this.Value), this.posX, this.posY - 3);
            } else {
                text(str(this.Value), this.posX, this.posY);
            }
        }
    }
}
