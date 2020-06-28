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
                String sql = "SELECT book_id, name, author, publisher, total_books, available_books "
                        + "FROM Book "
                        + "WHERE name like '%?%'";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, txtSearch);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String bookId = resultSet.getString("book_id");
                    String bookName = resultSet.getString("name");
                    String author = resultSet.getString("author");
                    String publisher = resultSet.getString("publisher");
                    int tolalBook = resultSet.getInt("total_book");
                    int availableBook = resultSet.getInt("available_books");
                    BookDTO bookDTO = new BookDTO(bookId, bookName, author, publisher, tolalBook, availableBook);
                    listBook.add(bookDTO);
                }
            }
        } catch (Exception e) {
            System.out.println("Exception at searchBookByName " + e);
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

}
