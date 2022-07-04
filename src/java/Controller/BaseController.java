/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Config.DBConnection;
import com.sun.rowset.CachedRowSetImpl;
import java.sql.*;
import java.util.Map;
import java.sql.SQLException;


/**
 *
 * @author rafih
 */
public class BaseController {
        DBConnection conn = new DBConnection();
    
        public ResultSet get(String sql) {
        try{
            Connection con = conn.open();
            
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            CachedRowSetImpl crs = new CachedRowSetImpl();
            crs.populate(rs);
            
            con.close();
            
            return crs;
        } catch (Exception e ){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public ResultSet getWithParameter(Map<Integer, Object> map, String sql) {
        try{
            Connection con = conn.open();
            PreparedStatement ps = con.prepareStatement(sql);
            
            for(Map.Entry<Integer, Object> entry : map.entrySet()) {
                ps.setString(entry.getKey(), entry.getValue().toString());
            }
            
            ResultSet rs = ps.executeQuery();
            
            CachedRowSetImpl crs = new CachedRowSetImpl();
            crs.populate(rs);
            
            con.close();
            return crs;
        } catch (Exception e ){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public boolean preparedStatement(Map<Integer, Object> map, String sql) {
        try {
            Connection con = conn.open();
            PreparedStatement ps = con.prepareStatement(sql);
            
            for(Map.Entry<Integer, Object> entry : map.entrySet()) {
                ps.setString(entry.getKey(), entry.getValue().toString());
            }
            
            int rows = ps.executeUpdate();
            con.close();
            
            return rows != 0;
        } catch(SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}