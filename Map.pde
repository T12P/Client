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
}
