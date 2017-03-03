package Cupcake;

public class Toppings {

    int tno;
    String topping;
    float price;

    public Toppings(int bno, String top, float price) {
        this.tno = bno;
        this.topping = top;
        this.price = price;
    }

    public int getBno() {
        return tno;
    }

    public String getTop() {
        return topping;
    }

    public float getPrice() {
        return price;
    }
}