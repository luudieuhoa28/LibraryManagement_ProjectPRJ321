/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import dtos.BorrowedBook;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author dell
 */
public class BorrowedBookDAO {

    public static Map<Integer, List<BorrowedBook>> getBorrowBook(Map<Integer, OrderDTO> mapOrder) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Map<Integer, List<BorrowedBook>> mapBorrowBook = null;
        try {
            mapBorrowBook = new HashMap<>();
            conn = dbutils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Book.book_id, Book.book_name, Order_Detail.quantity "
                        + "FROM Book, Order_Detail "
                        + "WHERE Book.book_id = Order_Detail.book_id and Order_Detail.borrow_order_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                Set orderIdSet = mapOrder.keySet();
                Iterator it = orderIdSet.iterator();
                while (it.hasNext()) {
                    int orderId = (int) it.next();
                    preparedStatement.setInt(1, orderId);
                    rs = preparedStatement.executeQuery();
                    List<BorrowedBook> listBorrowedBook = new ArrayList<>();
                    while (rs.next()) {
                        String bookId = rs.getString("book_id");
                        String bookName = rs.getString("book_name");
                        int quantity = rs.getInt("quantity");
                        BorrowedBook borrowedBook = new BorrowedBook(bookId, bookName, quantity);
                        listBorrowedBook.add(borrowedBook);
                    }
                    mapBorrowBook.put(orderId, listBorrowedBook);
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
        return mapBorrowBook;
    }
}
