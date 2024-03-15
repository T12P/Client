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
        if (overCircle()) {
            this.overButton = true;
        } else {
            this.overButton = false;
        }
        this.mouseClicked();
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
    
    private void mouseClicked() {
        if (this.overButton && mousePressed) {
            this.numberShown = true;
            //println("KEKW");
        }
    }
    
    //Button Test End
    
    public void SetValue(int v) {
        if (!this.IsUsed) {
            this.Value = v;
            this.IsUsed = !this.IsUsed;
            return;
        }
        throw new Error("Field Is Already Used.");
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
            int lul = str(this.Value).length();
            textSize(100 / lul);
            
            if (this.numberShown) {
                text(str(this.Value), this.posX, this.posY);
            }
        }
    }
}
