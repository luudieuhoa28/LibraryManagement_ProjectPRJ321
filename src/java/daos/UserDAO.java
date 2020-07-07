/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class UserDAO {

    public static UserDTO checkLogin(String userId, String password) throws SQLException {
        UserDTO userDTO = null;
        Connection conn = null;
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Library_User.library_user_id, Library_User.password, Role_User.role_name, Library_User.name, Library_User.phone, Library_User.gender, Library_User.address "
                        + "FROM Library_User, Role_User "
                        + "WHERE Library_User.role_id = Role_User.role_id and Library_User.library_user_id = ? and Library_User.password = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, userId);
                preparedStatement.setString(2, password);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    String userIdDTO = resultSet.getString("library_user_id");
                    String passwordDTO = resultSet.getString("password");
                    String role = resultSet.getString("role_name");
                    String name = resultSet.getString("name");
                    String gender = resultSet.getString("gender");
                    String phone = resultSet.getString("phone");
                    String address = resultSet.getString("address");
                    userDTO = new UserDTO(userIdDTO, passwordDTO, role, name, gender, phone, address);
                }
            }
        } catch (Exception e) {
            System.out.println("Error at UserDAO " + e);
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
        return userDTO;
    }

    public static void registAcc(UserDTO userDTO) throws SQLException, ClassNotFoundException{
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Library_User(library_user_id, password, role_id, name, gender, phone, address) "
                        + "VALUES (?,?,?,?,?,?,?)";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, userDTO.getUserId());
                preparedStatement.setString(2, userDTO.getPassword());
                preparedStatement.setString(3, userDTO.getRole());
                preparedStatement.setString(4, userDTO.getName());
                preparedStatement.setString(5, userDTO.getGender());
                preparedStatement.setString(6, userDTO.getPhone());
                preparedStatement.setString(7, userDTO.getAddress());
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
}
