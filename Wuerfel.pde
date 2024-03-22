class Wuerfel {
    private int low;
    private int high;
    private int posX;
    private int posY;
    private int size = 50;
    private color dColor;
    private color tColor;
    private int lastDiceValue;
   
    Wuerfel(int low, int high, int posX, int posY, color diceColor, color textColor) {
        this.low = low;
        this.high = high;
        this.posX = posX;
        this.posY = posY;
        this.dColor = diceColor;
        this.tColor = textColor;
    }
    
    public int exposeValue() {
        return this.lastDiceValue;
    }
    
    public int Run() {
        return int(random(this.low, this.high));
    }
    
    public void Draw() {
        if (keyPressed == true && key == ' ') {
            this.lastDiceValue = this.Run();
        }
        fill(this.dColor);
        square(this.posX, this.posY, this.size);
        
        fill(this.tColor);
        textAlign(CENTER, CENTER);
        text(str(this.lastDiceValue), this.posX + (this.size / 2), this.posY + (this.size / 2));
        fill(255);
    }
}
