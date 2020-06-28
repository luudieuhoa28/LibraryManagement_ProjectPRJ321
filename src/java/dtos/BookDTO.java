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
public class BookDTO {
    private String bookId;
    private String bookName;
    private String author;
    private String publisher;
    private int totalBook;
    private int availableBook;

    public BookDTO() {
    }

    public BookDTO(String bookId, String bookName, String author, String publisher, int totalBook, int availableBook) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.publisher = publisher;
        this.totalBook = totalBook;
        this.availableBook = availableBook;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getTotalBook() {
        return totalBook;
    }

    public void setTotalBook(int totalBook) {
        this.totalBook = totalBook;
    }

    public int getAvailableBook() {
        return availableBook;
    }

    public void setAvailableBook(int availableBook) {
        this.availableBook = availableBook;
    }
    
    
}
