package Data;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataAccessObject {

    private DBConnector db = null;
    private Connection conn = null;
    private Password pass = new Password();
    
    public DataAccessObject(DBConnector inputcon) {
        try {
            db = inputcon;
            conn = db.getConnection();

        } catch (Exception ex) {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean createUser(String uname, String password){ //VIRKER
        PreparedStatement stmt = null;
        String sql = "INSERT INTO users (uname, hashedpw, salt, balance) VALUES (?, ?, ?, ?)";
        String salt = pass.getSaltString();
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uname);
            stmt.setString(2, pass.get_SHA_512_SecurePassword(password, salt));
            stmt.setString(3, salt);
            stmt.setInt(4, 25);
            stmt.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    
    public User getUserByUsername(String username){ //VIRKER
        User user = null;
        PreparedStatement stmt = null;
        String SQL = "SELECT * FROM users WHERE uname = ?";
        try {
            stmt = conn.prepareStatement(SQL);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                int uno = rs.getInt("uno");
                String uname = rs.getString("uname");
                String hashedPW = rs.getString("hashedpw");
                String salt = rs.getString("salt");
                float balance = rs.getFloat("balance");
                user = new User(uno, uname, hashedPW, salt, balance);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return user;
    } 

    public String getPriceLevel(int pno) {
        String level = null;
        CallableStatement stmt = null;
        try {
            stmt = conn.prepareCall("{call GetPartLevel(?,?)}");
            stmt.setInt(1, pno);
            stmt.registerOutParameter(2, java.sql.Types.VARCHAR);
            stmt.execute();
            level = stmt.getString(2);
        } catch (SQLException ignore) {
        }
        return level;
    }

    public void createOrder(int top, int bottom, int uno, int totalPrice){ //IKKE TESTET
        PreparedStatement stmt = null;
        String SQL = "INSERT INTO orders (uno, bno, tno, totalprice) VALUES (?, ?, ?, ?)";
        try {
            stmt = conn.prepareStatement(SQL);
            stmt.setInt(1, uno);
            stmt.setInt(2, bottom);
            stmt.setInt(3, top);
            stmt.setInt(4, totalPrice);
            stmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Cupcake getCupcake(String bottom, String topping, float price) {
        return null;
    }
}
