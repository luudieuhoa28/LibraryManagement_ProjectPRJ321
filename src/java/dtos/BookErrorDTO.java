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
public class BookErrorDTO {
    private String bookIdError;
    private String bookNameError;
    private String bookAuthorError;
    private String bookPublisherError;
    private String bookTotalError;
    private String bookAvaiError;
    private String bookYearExError;

    public BookErrorDTO() {
    }

    public BookErrorDTO(String bookIdError, String bookNameError, String bookAuthorError, String bookPublisherError, String bookTotalError, String bookAvaiError, String bookYearExError) {
        this.bookIdError = bookIdError;
        this.bookNameError = bookNameError;
        this.bookAuthorError = bookAuthorError;
        this.bookPublisherError = bookPublisherError;
        this.bookTotalError = bookTotalError;
        this.bookAvaiError = bookAvaiError;
        this.bookYearExError = bookYearExError;
    }

    public String getBookIdError() {
        return bookIdError;
    }

    public void setBookIdError(String bookIdError) {
        this.bookIdError = bookIdError;
    }

    public String getBookNameError() {
        return bookNameError;
    }

    public void setBookNameError(String bookNameError) {
        this.bookNameError = bookNameError;
    }

    public String getBookAuthorError() {
        return bookAuthorError;
    }

    public void setBookAuthorError(String bookAuthorError) {
        this.bookAuthorError = bookAuthorError;
    }

    public String getBookPublisherError() {
        return bookPublisherError;
    }

    public void setBookPublisherError(String bookPublisherError) {
        this.bookPublisherError = bookPublisherError;
    }

    public String getBookTotalError() {
        return bookTotalError;
    }

    public void setBookTotalError(String bookTotalError) {
        this.bookTotalError = bookTotalError;
    }

    public String getBookAvaiError() {
        return bookAvaiError;
    }

    public void setBookAvaiError(String bookAvaiError) {
        this.bookAvaiError = bookAvaiError;
    }

    public String getBookYearExError() {
        return bookYearExError;
    }

    public void setBookYearExError(String bookYearExError) {
        this.bookYearExError = bookYearExError;
    }

   
    
    
}
