/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author rafih
 */
public class DBConnection {
    Connection con;
    
    public Connection open() {
        
        try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1:3306/latihanjsp";
        con = DriverManager.getConnection(url, "root", "");
        return con;
        }
        catch(Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
