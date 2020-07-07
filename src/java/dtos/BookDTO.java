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
public class BookDTO implements Serializable {

    private String bookId;
    private String bookName;
    private String author;
    private String publisher;
    private int totalBook;
    private int availableBook;
    private int yearOfExport;
    private int numInCart;
    private boolean isExisted;

    public BookDTO() {
    }

    public BookDTO(String bookId, String bookName, String author, String publisher, int totalBook, int availableBook, int yearOfExport, int numInCart) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.publisher = publisher;
        this.totalBook = totalBook;
        this.availableBook = availableBook;
        this.yearOfExport = yearOfExport;
        this.numInCart = numInCart;
    }

    public BookDTO(String bookId, String bookName, int numInCart, int availableBook) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.numInCart = numInCart;
        this.availableBook = availableBook;
    }

    public BookDTO(String bookId, String bookName, String author, String publisher, int totalBook, int availableBook, int yearOfExport) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.publisher = publisher;
        this.totalBook = totalBook;
        this.availableBook = availableBook;
        this.yearOfExport = yearOfExport;
    }

    public BookDTO(String bookId, String bookName, String author, String publisher, int totalBook, int availableBook, int yearOfExport, int numInCart, boolean isExisted) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.publisher = publisher;
        this.totalBook = totalBook;
        this.availableBook = availableBook;
        this.yearOfExport = yearOfExport;
        this.numInCart = numInCart;
        this.isExisted = isExisted;
    }

    public boolean isIsExisted() {
        return isExisted;
    }

    public void setIsExisted(boolean isExisted) {
        this.isExisted = isExisted;
    }
    
    

    public int getNumInCart() {
        return numInCart;
    }

    public void setNumInCart(int numInCart) {
        this.numInCart = numInCart;
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

    public int getYearOfExport() {
        return yearOfExport;
    }

    public void setYearOfExport(int yearOfExport) {
        this.yearOfExport = yearOfExport;
    }

}
