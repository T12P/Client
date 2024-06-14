class Wuerfel {
    private int low;
    private int high;
    private int posX;
    private int posY;
    private int size = 50;
    private color dColor;
    private color tColor;
    private int lastDiceValue;
    
    private String[] dice = new String[]{"◻", "⚀", "⚁", "⚂", "⚃", "⚄", "⚅"};
   
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
    
    public String getUnicode(int x) {
        return this.dice[x];    
    }
    
    public void Draw() {
        if (keyPressed == true && key == ' ') {
            this.lastDiceValue = this.Run();
        }
        fill(this.dColor);
        strokeWeight(0);
        square(this.posX, this.posY, this.size);
        strokeWeight(2);
        
        fill(this.tColor);
        textAlign(CENTER, CENTER);
        PFont f = createFont("Arial Unicode MS", 64);
        textFont(f);
        text(this.getUnicode(this.lastDiceValue), this.posX + (this.size / 2), this.posY - 10 + (this.size / 2));
        fill(255);
    }
}
