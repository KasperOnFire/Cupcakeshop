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

    /**
     * The class constructor gives access to the getters in the class, which
     * give access to the database. The constructor also opens a connection to
     * the database.
     *
     * @param inputcon is the connection to the database that will be used.
     */
    public DataAccessObject(DBConnector inputcon) {
        try {
            db = inputcon;
            conn = db.getConnection();

        } catch (Exception ex) {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        }
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
