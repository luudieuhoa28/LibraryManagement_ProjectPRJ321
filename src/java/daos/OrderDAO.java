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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Borrow_Order(library_user_id, borrow_date, return_date, is_returned) "
                        + "VALUES (?,?,?,?);";
                preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, orderDTO.getUserID());
                String bdate = orderDTO.getBorrowDate();
                preparedStatement.setString(2, orderDTO.getBorrowDate());
                String rDate = orderDTO.getReturnDate();
                preparedStatement.setString(3, orderDTO.getReturnDate());
                preparedStatement.setBoolean(4, false);
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

    public static Map<Integer, OrderDTO> getListOrder(String userId) throws SQLException {
        Map<Integer, OrderDTO> mapOrder = null;
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {

            mapOrder = new HashMap<>();
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT borrow_order_id, borrow_date, return_date, is_returned "
                        + "FROM Borrow_Order "
                        + "WHERE library_user_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, userId);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    SimpleDateFormat sdformat = new SimpleDateFormat("MM-dd-yyyy");
                    Integer orderId = rs.getInt("borrow_order_id");
                    String borrowDate = rs.getString("borrow_date");
                    String returnDate = rs.getString("return_date");
                    boolean isReturned = rs.getBoolean("is_returned");
                    Date currentDate = new Date();
                    int checkDate = compareDate(returnDate, sdformat.format(currentDate));
                    if (checkDate > 0) {
                        setIsReTurned(orderId);
                    }
                    if (!isReturned) {
                        OrderDTO orderDTO = new OrderDTO(userId, borrowDate, returnDate);
                        mapOrder.put(orderId, orderDTO);
                    }
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
        return mapOrder;
    }

    public static void setIsReTurned(int orderId) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Borrow_Order "
                        + "SET is_returned = 1"
                        + "WHERE borrow_order_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setInt(1, orderId);
                preparedStatement.executeUpdate();
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
    }

    public static int compareDate(String date, String currentDate) throws ParseException {
        SimpleDateFormat sdformat = new SimpleDateFormat("MM-dd-yyyy");
        Date tmpDate = sdformat.parse(date);
        Date tmpCurrentDate = sdformat.parse(currentDate);
        return tmpDate.compareTo(tmpCurrentDate);
    }

}
