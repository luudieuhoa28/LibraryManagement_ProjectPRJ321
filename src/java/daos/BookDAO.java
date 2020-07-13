/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import utils.DBUtils;
import dtos.BookDTO;
import dtos.OrderDetailDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.sun.activation.registries.LogSupport.log;
import dtos.BorrowedBook;

/**
 *
 * @author dell
 */
public class BookDAO {

    public static List<BookDTO> searchBookByName(String txtSearch) throws SQLException {
        List<BookDTO> listBook = new ArrayList<>();
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT book_id, book_name, author, publisher, total_books, available_books, year_export, status "
                        + "FROM Book "
                        + "WHERE book_name like '%" + txtSearch + "%'";
                preparedStatement = conn.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String bookId = resultSet.getString("book_id");
                    String bookName = resultSet.getString("book_name");
                    String author = resultSet.getString("author");
                    String publisher = resultSet.getString("publisher");
                    int tolalBook = resultSet.getInt("total_books");
                    int availableBook = resultSet.getInt("available_books");
                    int yearExport = resultSet.getInt("year_export");
                    boolean isExisted = resultSet.getBoolean("status");
                    BookDTO bookDTO = new BookDTO(bookId, bookName, author, publisher, tolalBook, availableBook, yearExport, 0, isExisted);
                    listBook.add(bookDTO);
                }
            }
        } catch (Exception e) {
            log("Exception at searchBookByName " + e);
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        }
        return listBook;

    }

    public static void updateBook(BookDTO bookDTO) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Book SET book_name = ?, author = ?, "
                        + "publisher = ?, total_books = ?, year_export = ?, available_books = ? "
                        + "WHERE book_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, bookDTO.getBookName());
                preparedStatement.setString(2, bookDTO.getAuthor());
                preparedStatement.setString(3, bookDTO.getPublisher());
                preparedStatement.setInt(4, bookDTO.getTotalBook());
                preparedStatement.setString(5, bookDTO.getYearOfExport() + "");
                preparedStatement.setInt(6, bookDTO.getAvailableBook());
                preparedStatement.setString(7, bookDTO.getBookId());
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            log(e.toString());
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }

    public static void deleteBook(String bookId) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Book "
                        + "SET status = 0 "
                        + "WHERE book_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, bookId);
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("Delete Book " + e);
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }

    public static void addBook(BookDTO bookDTO) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Book(book_id, book_name, author, publisher, total_books, available_books, year_export, status) "
                        + "VALUES (?,?,?,?,?,?,?,?)";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, bookDTO.getBookId());
                preparedStatement.setString(2, bookDTO.getBookName());
                preparedStatement.setString(3, bookDTO.getAuthor());
                preparedStatement.setString(4, bookDTO.getPublisher());
                preparedStatement.setInt(5, bookDTO.getTotalBook());
                preparedStatement.setInt(6, bookDTO.getTotalBook());
                preparedStatement.setString(7, bookDTO.getYearOfExport() + "");
                preparedStatement.setBoolean(8, true);
                preparedStatement.executeQuery();
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }

    public static boolean updateAvailable(List<OrderDetailDTO> listDetail, Connection conn) throws SQLException {
        PreparedStatement preparedStatement = null;
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                conn.setAutoCommit(false);
                String sql = "UPDATE Book "
                        + "SET available_books = available_books - ? "
                        + "WHERE book_id = ?";

                for (OrderDetailDTO orderDetailDTO : listDetail) {
                    preparedStatement = conn.prepareStatement(sql);

                    preparedStatement.setInt(1, orderDetailDTO.getQuantity());
                    preparedStatement.setString(2, orderDetailDTO.getBookId());
                    preparedStatement.executeUpdate();
                }
                result = true;
                conn.commit();
                conn.setAutoCommit(true);
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
        return result;
    }

    public static boolean updateAvailable(String bookId, int numChange, Connection conn) throws SQLException {
        //  Connection conn = null;
        PreparedStatement preparedStatement = null;
        boolean resutl = false;
        try {
            //    conn = DBUtils.getConnection();
            //  if (conn != null) {

            String sql = "UPDATE Book "
                    + "SET available_books = available_books - ? "
                    + "WHERE book_id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, numChange);
            preparedStatement.setString(2, bookId);
            preparedStatement.executeUpdate();
            resutl = true;
            //  }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
//            if (conn != null) {
//                conn.close();
//            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
        return resutl;
    }

    public static boolean updateListAvailable(List<BorrowedBook> listBorrowedBook) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Book "
                        + "SET available_books = available_books + ? "
                        + "WHERE book_id = ?";
                conn.setAutoCommit(false);
                preparedStatement = conn.prepareStatement(sql);
                for (BorrowedBook borrowedBook : listBorrowedBook) {
                    preparedStatement.setInt(1, borrowedBook.getBorrowedQuantity());
                    preparedStatement.setString(2, borrowedBook.getBookId());
                    preparedStatement.executeUpdate();
                }
                conn.commit();
                conn.setAutoCommit(true);
                result = true;
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
        }
        return result;
    }

    public static BookDTO getBook(String bookId) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        BookDTO bookDTO = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT book_name, author, publisher, total_books, available_books, year_export, status "
                        + "FROM Book "
                        + "WHERE book_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, bookId);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    String bookName = resultSet.getString("book_name");
                    String author = resultSet.getString("author");
                    String publisher = resultSet.getString("publisher");
                    int totalBook = resultSet.getInt("total_books");
                    int available = resultSet.getInt("available_books");
                    int yearExport = resultSet.getInt("year_export");
                    boolean isExisted = resultSet.getBoolean("status");
                    bookDTO = new BookDTO(bookId, bookName, author, publisher, totalBook, available, yearExport, yearExport, isExisted);
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
            if (resultSet != null) {
                resultSet.close();
            }
        }
        return bookDTO;
    }

}
