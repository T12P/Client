class Select {
    private int posX;
    private int posY;
    private int _width;
    private int _height;

    private String a;

    private int Value;
    private Boolean IsUsed = false;

    Select(int x, int y, int _width, int _height, String a) {
        this.posX = x;
        this.posY = y;
        this._width = _width;
        this._height = _height;
        this.a = a;
    }

    //Button Test

    private Boolean clicked = false;
    private Boolean overButton = false;
    private Boolean numberShown = false;
    private Boolean wasSelected = false;

    private void Update() {
        this.overButton = this.overRect();
        if (this.overButton && mousePressed) {
            this.numberShown = true;
        }
    }

    private Boolean overRect()  {
        if (mouseX >= this.posX && mouseX <= this.posX + this._width &&
            mouseY >= this.posY && mouseY <= this.posY + this._height) {
            return true;
        } else{
            return false;
        }
    }

    //Button Test End

    public void Draw() {
        this.Update();

        fill(255);
        rect(this.posX, this.posY, this._width, this._height);
        fill(0,0,0,0);

        if (this.overButton) {
            fill(100);
            textAlign(CENTER, CENTER);
            textSize(30);
            text("X", this.posX + 25, this.posY + 25);
            fill(0,0,0,0);
        } else {
            stroke(0);
            strokeWeight(2);
            fill(255);
        }

        if (this.numberShown) {
            fill(0);
            textAlign(CENTER, CENTER);
            textSize(30);
            text("X", this.posX + (this._width / 2), this.posY + (this._height / 2));

            if (!this.wasSelected) {
                switch (this.a) {
                case "Low":
                    selectedNumber = lowNumber;
                    break;
                case "High":
                    selectedNumber = highNumber;
                    break;
                case "Sub":
                    selectedNumber = highNumber - lowNumber;
                    break;
                case "Add":
                    selectedNumber = highNumber + lowNumber;
                    break;
                case "Mult":
                    selectedNumber = highNumber * lowNumber;
                    break;
                }
            }
            this.wasSelected = true;
        }
    }
}
