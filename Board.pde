class Board {
    
    private int w;
    private int h;
    private String[] a;
    
    private int boardField = width / 20;
    
    private Select s;
    private Select[][] arr;
    
    Board(int h, String[] a) {
        this.a = a;
        this.w = this.a.length;
        this.h = h;
        
        this.arr = new Select[this.w][this.h];
        
        for (int i = 0; i < this.w; i = i + 1) {
            for (int j = 0; j < this.h; j = j + 1) {
                //this.s = new Select(375 + 50 * j,25 + 50 * i,50,50, this.a[i]); <- OUTDATED
                this.s = new Select(width - (boardField * (j + 1)) - 50, boardField * i, boardField, boardField, this.a[i]);
                this.arr[i][j] = this.s;
            }
        }
}
    
    public void Draw() {
        fill(0);
        textSize(20);
        int i = 0;
        
        for (i = 0; i < this.w; i = i + 1) {
            

            //rect(width - (boardField * (this.w)) - 50, boardField * i + boardField / 2);
            fill(0);
            textSize(25);
            textAlign(CENTER, CENTER);
            //text(this.a[i], 720, 50 + 50 * i);
            text(this.a[i], width - (boardField * (this.w)) - 50, boardField * i + boardField / 2);
            
            
            for (int j = 0; j < this.h; j = j + 1) {
                this.arr[i][j].Draw();
            }
        }
        
        fill(0);
        textSize(25);
        textAlign(CENTER, CENTER);
        if (selectedNumber != null) {
            //text("Selected: " + str(selectedNumber), 720, 50 + 50 * i);
            text("Selected: " + str(selectedNumber), width - (boardField * (this.w)) -15, boardField + boardField * i - 28);
        }
}
}
