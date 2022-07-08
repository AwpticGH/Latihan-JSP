/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Query;

/**
 *
 * @author rafih
 */
public class ProductQuery {
    public String get = "SELECT product.*, pt.name as product_type_name "
            + "FROM product INNER JOIN product_type pt "
            + "ON product.product_type_id = pt.id";
    public String create = "INSERT INTO product (name, product_type_id, " + 
                "stock, price, expired) VALUES (?, ?, ?, ?, ?)";
    public String getByName = "SELECT * FROM product where name LIKE ?";
    public String getById = "SELECT * FROM product where id = ?";   
    public String update = "UPDATE product SET name = ?, product_type = ?, "
            + "stock = ?, price = ?, expired = ? WHERE id = ?";
    public String delete = "DELETE FROM product WHERE id = ?";
    public String updateId = "UPDATE product SET id = ? WHERE product.id = ?";
}
