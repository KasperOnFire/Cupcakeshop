package Data;

public class Cupcake {

    private String bottom;
    private String topping;
    private float price;
    private int amount;

    public Cupcake(String bottom, String topping, float price, int amount) {
        this.bottom = bottom;
        this.topping = topping;
        this.price = price;
        this.amount = amount;
    }


    public String getBottom() {
        return bottom;
    }

    public String getTopping() {
        return topping;
    }

    public float getPrice() {
        return price;
    }

    public int getAmount() {
        return amount;
    }

}
