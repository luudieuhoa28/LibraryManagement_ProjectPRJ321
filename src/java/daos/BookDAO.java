/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dbutils.DBUtils;
import dtos.BookDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.sun.activation.registries.LogSupport.log;

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
                String sql = "SELECT book_id, book_name, author, publisher, total_books, available_books, year_export "
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
                    BookDTO bookDTO = new BookDTO(bookId, bookName, author, publisher, tolalBook, availableBook, yearExport, 0);
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
                        + "publisher = ?, total_books = ?, year_export = ? "
                        + "WHERE book_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, bookDTO.getBookName());
                preparedStatement.setString(2, bookDTO.getAuthor());
                preparedStatement.setString(3, bookDTO.getPublisher());
                preparedStatement.setInt(4, bookDTO.getTotalBook());
                preparedStatement.setString(5, bookDTO.getYearOfExport() + "");
                preparedStatement.setString(6, bookDTO.getBookId());
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
                String sql = "DELETE Book WHERE book_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, bookId);
                preparedStatement.executeQuery();
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

    public static void addBook(BookDTO bookDTO) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Book(book_id, book_name, author, publisher, total_books, available_books, year_export) "
                        + "VALUES (?,?,?,?,?,?,?)";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, bookDTO.getBookId());
                preparedStatement.setString(2, bookDTO.getBookName());
                preparedStatement.setString(3, bookDTO.getAuthor());
                preparedStatement.setString(4, bookDTO.getPublisher());
                preparedStatement.setInt(5, bookDTO.getTotalBook());
                preparedStatement.setInt(6, bookDTO.getTotalBook());
                preparedStatement.setString(7, bookDTO.getYearOfExport() + "");
                preparedStatement.executeQuery();
            }
        } catch (SQLException e) {
            //throw e;
            String err = e.toString();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }

}
