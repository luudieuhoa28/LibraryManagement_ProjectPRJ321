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
public class BorrowedBook {
    private String bookId;
    private String bookName;
    private int borrowedQuantity;

    public BorrowedBook() {
    }

    public BorrowedBook(String bookId, String bookName, int borrowedQuantity) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.borrowedQuantity = borrowedQuantity;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getBorrowedQuantity() {
        return borrowedQuantity;
    }

    public void setBorrowedQuantity(int borrowedQuantity) {
        this.borrowedQuantity = borrowedQuantity;
    }
    
    
}
