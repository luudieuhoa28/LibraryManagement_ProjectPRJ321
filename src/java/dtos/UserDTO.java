/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author dell
 */
public class UserDTO implements Serializable {

    private String userId;
    private String password;
    private String role;
    private String name;
    private String gender;
    private String phone;
    private String address;
    private boolean isExisted;

    public UserDTO() {
    }

    public UserDTO(String userId, String password, String role, String name, String gender, String phone, String address) {
        this.userId = userId;
        this.password = password;
        this.role = role;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
    }

    public UserDTO(String userId, String password, String role, String name, String gender, String phone, String address, boolean isExisted) {
        this.userId = userId;
        this.password = password;
        this.role = role;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.isExisted = isExisted;
    }

    public boolean isIsExisted() {
        return isExisted;
    }

    public void setIsExisted(boolean isExisted) {
        this.isExisted = isExisted;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
