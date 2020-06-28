<%-- 
    Document   : add_book_page
    Created on : Jun 28, 2020, 6:31:28 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Book Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            Book ID: <input type="text" name="bookId" value="${param.bookId}"/><br/>
            ${requestScope.BOOK_ERROR.bookIdError}<br/>
            Name: <input type="text" name="bookName" value="${param.bookName}"/><br/>
            ${requestScope.BOOK_ERROR.bookNameError}<br/>
            Author: <input type="text" name="bookAuthor" value="${param.bookAuthor}"/><br/>
            <br/>
            Publisher: <input type="text" name="bookPublisher" value="${param.bookPublisher}"/><br/>
            <br/>
            Total: <input type="text" name="bookTotal" value="${param.bookTotal}"/><br/>
            ${requestScope.BOOK_ERROR.bookTotalError}<br/>
            Export Year: <input type="text" name="bookExportYear" value="${param.bookExportYear}"/><br/>
            ${requestScope.BOOK_ERROR.bookYearExError}<br/>
            <input type="submit" name="btnAction" value="Add Book"/>
        </form>
    </body>
</html>
