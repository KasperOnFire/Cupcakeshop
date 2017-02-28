package Data;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Data.Password;

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
    
    public boolean createUser(String uname, String password){
        PreparedStatement stmt = null;
        String sql = "INSERT INTO users (uname, hashedpw, salt, balance) VALUES (?, ?, ?, ?)";
        String salt = pass.getSaltString();
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uname);
            stmt.setString(2, pass.get_SHA_512_SecurePassword(password, salt));
            stmt.setString(3, salt);
            stmt.setInt(4, 100000);
            stmt.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return true;
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

    public Cupcake getCupcake(String bottom, String topping, float price) {
        return null;
    }
}
