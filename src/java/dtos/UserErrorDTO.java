/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author dell
 */
public class UserErrorDTO {

    private String userIdError;
    private String passwordError;
    private String nameError;
    private String genderError;
    private String phoneError;
    private String addressError;

    public UserErrorDTO() {
    }

    public UserErrorDTO(String userIdError, String passwordError, String nameError, String genderError, String phoneError, String addressError) {
        this.userIdError = userIdError;
        this.passwordError = passwordError;
        this.nameError = nameError;
        this.genderError = genderError;
        this.phoneError = phoneError;
        this.addressError = addressError;
    }

    public String getUserIdError() {
        return userIdError;
    }

    public void setUserIdError(String userIdError) {
        this.userIdError = userIdError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }
    
    

}
