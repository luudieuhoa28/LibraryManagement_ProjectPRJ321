/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author dell
 */
public class OrderDAO {

    public static int addOrder(OrderDTO orderDTO) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        int key = 0;
        try {
            conn = dbutils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Borrow_Order(library_user_id, borrow_date, return_date) "
                        + "VALUES (?,?,?);";
                preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, orderDTO.getUserID());
                String bdate = orderDTO.getBorrowDate();
                preparedStatement.setString(2, orderDTO.getBorrowDate());
                String rDate = orderDTO.getReturnDate();
                preparedStatement.setString(3, orderDTO.getReturnDate());
                System.out.println(preparedStatement);
                System.out.println(preparedStatement.toString());
                preparedStatement.executeUpdate();
                rs = preparedStatement.getGeneratedKeys();
                if (rs.next()) {
                    key = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return key;
    }

}
