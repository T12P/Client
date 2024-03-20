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
        if (overRect()) {
            this.overButton = true;
        } else {
            this.overButton = false;
        }
        this.mouseClicked();
    }
    
    private Boolean overRect()  {
        if (mouseX >= this.posX && mouseX <= this.posX + this._width && 
            mouseY >= this.posY && mouseY <= this.posY + this._height) {
            return true;
        } else{
            return false;
        }
    }
    
    private void mouseClicked() {
        if (this.overButton && mousePressed) {
            this.numberShown = true;
        }
    }
    
    //Button Test End
    
    public void Draw() {
        this.Update();
        
        if (this.overButton) {
            fill(100);
            textSize(30);
            text("X", this.posX + 25, this.posY + 25);
            fill(0,0,0,0);
        } else {
            stroke(0);
            strokeWeight(2);
            fill(255);
        }
        
        rect(this.posX, this.posY, this._width, this._height);
        
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(30);
        
        if (this.numberShown) {
            text("X", this.posX, this.posY);
        }
    }
}