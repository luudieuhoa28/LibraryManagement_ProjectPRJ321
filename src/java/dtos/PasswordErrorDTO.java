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
public class PasswordErrorDTO {
    private String currenPassError;
    private String newPassError;
    private String reNewPassError;

    public PasswordErrorDTO() {
    }

    public PasswordErrorDTO(String currenPassError, String newPassError, String reNewPassError) {
        this.currenPassError = currenPassError;
        this.newPassError = newPassError;
        this.reNewPassError = reNewPassError;
    }

    public String getCurrenPassError() {
        return currenPassError;
    }

    public void setCurrenPassError(String currenPassError) {
        this.currenPassError = currenPassError;
    }

    public String getNewPassError() {
        return newPassError;
    }

    public void setNewPassError(String newPassError) {
        this.newPassError = newPassError;
    }

    public String getReNewPassError() {
        return reNewPassError;
    }

    public void setReNewPassError(String reNewPassError) {
        this.reNewPassError = reNewPassError;
    }
    
    
    
}
