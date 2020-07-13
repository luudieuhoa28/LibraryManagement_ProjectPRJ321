/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.BookDTO;
import dtos.OrderDetailDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author dell
 */
public class OrderDetailDAO {

    public static boolean addOrderDetail(OrderDetailDTO orderDetailDTO, Connection conn) throws SQLException {
        PreparedStatement preparedStatement = null;
        boolean result = false;
        try {
            String sql = "INSERT INTO Order_Detail(borrow_order_id, book_id, quantity) "
                    + "VALUES (?,?,?)";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, orderDetailDTO.getOrderId());
            preparedStatement.setString(2, orderDetailDTO.getBookId());
            preparedStatement.setInt(3, orderDetailDTO.getQuantity());
            preparedStatement.executeUpdate();
            result = true;
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
        return result;
    }

    public static boolean addOrderDetail(List<OrderDetailDTO> listDetail, Connection conn) throws SQLException {
        PreparedStatement preparedStatement = null;
        boolean resutl = false;
        try {

            String sql = "INSERT INTO Order_Detail(borrow_order_id, book_id, quantity) "
                    + "VALUES (?,?,?)";
            preparedStatement = conn.prepareStatement(sql);
            for (OrderDetailDTO orderDetailDTO : listDetail) {
                int orderID = orderDetailDTO.getOrderId();
                preparedStatement.setInt(1, orderDetailDTO.getOrderId());
                String bookId = orderDetailDTO.getBookId();
                preparedStatement.setString(2, orderDetailDTO.getBookId());
                int quantity = orderDetailDTO.getQuantity();
                preparedStatement.setInt(3, orderDetailDTO.getQuantity());
                preparedStatement.executeUpdate();
            }
            resutl = true;
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
        return resutl;
    }

}
