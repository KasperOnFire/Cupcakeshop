package Cupcake;

/**
 * @author Pensam
 */
public class Orders {

    int ono;
    int uno;
    int bno;
    int tno;
    float totalPrice;

    public Orders(int ono, int uno, int bno, int tno, float totalPrice) {
        this.ono = ono;
        this.uno = uno;
        this.bno = bno;
        this.tno = tno;
        this.totalPrice = totalPrice;
    }

    public int getOno() {
        return ono;
    }

    public int getUno() {
        return uno;
    }

    public int getBno() {
        return bno;
    }

    public int getTno() {
        return tno;
    }

    public float getTotalPrice() {
        return totalPrice;
    }
}
