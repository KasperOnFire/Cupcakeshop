package Cupcake;

/**
 * @author Pensam
 */
public class Orders {

    int ono;
    int uno;
    String bottom;
    String topping;
    float totalPrice;
    float tPrice;
    float bPrice;

    public Orders(int ono, int uno, String bottom, String topping, float tPrice, float bPrice, float totalPrice) {
        this.ono = ono;
        this.uno = uno;
        this.bottom = bottom;
        this.topping = topping;
        this.totalPrice = totalPrice;
    }

    public int getOno() {
        return ono;
    }

    public int getUno() {
        return uno;
    }

    public String getBottom() {
        return bottom;
    }

    public String getTopping() {
        return topping;
    }

    public float getTotalPrice() {
        return totalPrice;
    }
}
