package recipe.model;

public class Recipe_Jjim {
    private String id;
    private int rnum;

    public Recipe_Jjim(String id, int rnum) {
        this.id = id;
        this.rnum = rnum;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getRnum() {
        return rnum;
    }

    public void setRnum(int rnum) {
        this.rnum = rnum;
    }
}
