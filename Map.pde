class Map {
    private Field[] f;

    Map(Field[] f) {
        this.f = f;
    }

    public void generateNeighbours() {
        for (int i = 0; i < this.f.length; i++) {
            PVector p, o;
            float f;
            ArrayList<Field> k = new ArrayList<Field>();
            p = new PVector(this.f[i].GetX(), this.f[i].GetY());
            for (int z = 0; z < this.f.length; z++) {
                o = new PVector(this.f[z].GetX(), this.f[z].GetY());
                f = PVector.dist(o, p);
                if (f < 120.0 && f > 100) {
                    k.add(this.f[z]);
                }
            }
            Field[] x = new Field[k.size()];
            k.toArray(x);

            this.f[i].SetNeighbors(x);
        }
    }

    public void Evaluate() {
        Field[] k;
        for (int i = 0; i < this.f.length; i++) {
            Integer z = this.f[i].GetValue();
            k = this.f[i].GetNeighbors();
            this.f[i].LogEvalState();
            for (int j = 0; j < k.length; j++) {
                if ((k[j].GetValue() == z && k[j].GetValue() != null) || !k[j].GetEvalState()) {
                    points++;
                }
            }
        }
    }


    public void Draw() {
        for (int i = 0; i < this.f.length; i++) {
            this.f[i].Draw();
        }
    }
}
