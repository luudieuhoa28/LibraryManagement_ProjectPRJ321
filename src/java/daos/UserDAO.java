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
import java.util.ArrayList;
import java.util.List;

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
                String sql = "SELECT Library_User.library_user_id, Library_User.password, Role_User.role_id, Library_User.name, Library_User.phone, Library_User.gender, Library_User.address "
                        + "FROM Library_User, Role_User "
                        + "WHERE Library_User.role_id = Role_User.role_id and Library_User.library_user_id = ? and Library_User.password = ? and status = 1";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, userId);
                preparedStatement.setString(2, password);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    String userIdDTO = resultSet.getString("library_user_id");
                    String passwordDTO = resultSet.getString("password");
                    String role = resultSet.getString("role_id");
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
    
    public static void registAcc(UserDTO userDTO) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Library_User(library_user_id, password, role_id, name, gender, phone, address, status) "
                        + "VALUES (?,?,?,?,?,?,?,?)";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, userDTO.getUserId());
                preparedStatement.setString(2, userDTO.getPassword());
                preparedStatement.setString(3, userDTO.getRole());
                preparedStatement.setString(4, userDTO.getName());
                preparedStatement.setString(5, userDTO.getGender());
                preparedStatement.setString(6, userDTO.getPhone());
                preparedStatement.setString(7, userDTO.getAddress());
                preparedStatement.setBoolean(8, true);
                preparedStatement.executeUpdate();
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
    
    public static boolean updatePassword(String userId, String currentPass, String newPass) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Library_User "
                        + "SET password = ? "
                        + "WHERE library_user_id = ? AND password = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, newPass);
                preparedStatement.setString(2, userId);
                preparedStatement.setString(3, currentPass);
                int resutl = preparedStatement.executeUpdate();
                if (resutl > 0) {
                    return true;
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
        }
        return false;
    }
    
    public static List<UserDTO> getListUser() throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<UserDTO> listUser = null;
        try {
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                listUser = new ArrayList<>();
                String sql = "SELECT library_user_id, name, gender, phone, address, status "
                        + "FROM Library_User "
                        + "WHERE role_id = 'US'";
                preparedStatement = conn.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String userId = resultSet.getString("library_user_id");
                    String name = resultSet.getString("name");
                    String gender = resultSet.getString("gender");
                    String phone = resultSet.getString("phone");
                    String address = resultSet.getString("address");
                    boolean status = resultSet.getBoolean("status");
                    UserDTO userDTO = new UserDTO(userId, "", "user", name, gender, phone, address, status);
                    listUser.add(userDTO);
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
        return listUser;
    }
    
    public static boolean updateUserStatus(String userId, boolean status) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Library_User "
                        + "SET status = ? "
                        + "WHERE library_user_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setBoolean(1, status);
                preparedStatement.setString(2, userId);
                int resutl = preparedStatement.executeUpdate();
                if (resutl > 0) {
                    return true;
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
        }
        return false;
    }

    public static void updateProfile(UserDTO userDTO) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Library_User "
                        + "SET name = ?, gender = ?, phone = ?, address = ? "
                        + "WHERE library_user_id = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, userDTO.getName());
                preparedStatement.setString(2, userDTO.getGender());
                preparedStatement.setString(3, userDTO.getPhone());
                preparedStatement.setString(4, userDTO.getAddress());
                preparedStatement.setString(5, userDTO.getUserId());
                preparedStatement.executeUpdate();
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
