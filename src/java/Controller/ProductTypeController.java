/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Query.ProductTypeQuery;
import java.sql.ResultSet;

/**
 *
 * @author rafih
 */
public class ProductTypeController extends BaseController {
    
    ProductTypeQuery query = new ProductTypeQuery();
    
    public ResultSet get() {
        String sql = this.query.get;
        return this.get(sql);
    }
}
