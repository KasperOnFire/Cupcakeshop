package Cupcake;

public class Toppings {

    int tno;
    String name;
    float price;

    public Toppings(int bno, String top, float price) {
        this.tno = bno;
        this.name = top;
        this.price = price;
    }

    public int getBno() {
        return tno;
    }

    public String getTop() {
        return name;
    }

    public float getPrice() {
        return price;
    }
}