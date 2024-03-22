class Select {
    private int posX;
    private int posY;
    private int _width;
    private int _height;
    
    private int Value;
    private Boolean IsUsed = false;
    
    Select(int x, int y, int _width, int _height) {
        this.posX = x;
        this.posY = y;
        this._width = _width;
        this._height = _height;
    }
    
    //Button Test
    
    private Boolean clicked = false;
    private Boolean overButton = false;
    private Boolean numberShown = false;

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
        
        rect(this.posX, this.posY, this._width, this._height);
        
        if (this.numberShown) {
            fill(0);
            textAlign(CENTER, CENTER);
            textSize(30);
            text("X", this.posX + (this._width / 2), this.posY + (this._height / 2));
        }
    }
}
