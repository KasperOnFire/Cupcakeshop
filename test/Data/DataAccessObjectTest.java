/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Cupcake.*;
import User.*;
import java.util.*;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Kasper
 */
public class DataAccessObjectTest {

    private DBConnector db;
    private DataAccessObject dao;

    public DataAccessObjectTest() throws Exception {
        db = new DBConnector();
        dao = new DataAccessObject(db);
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getToppings method, of class DataAccessObject.
     */
    @Test
    public void testGetToppings() {
        System.out.println("getToppings");
        DataAccessObject instance = dao;
        boolean expResult = true;
        ArrayList result = instance.getToppings();
        System.out.println(result.get(2));
        assertEquals(expResult, (result != null));

    }
}
