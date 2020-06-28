<%-- 
    Document   : update_book
    Created on : Jun 28, 2020, 4:51:31 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="bookError" value="${requestScope.BOOK_ERROR}"/>
        <form action="MainController" method="POST">
            Book ID: <input type="text" readonly value="${param.bookId}" name="bookId"/><br/>
            <br/>
            Name: <input type="text" value="${param.bookName}" name="bookName"/><br/>
            ${bookError.bookNameError}<br/>
            Author: <input type="text" value="${param.bookAuthor}" name="bookAuthor"/><br/>
            <br/>
            Publisher: <input type="text" value="${param.bookPublisher}" name="bookPublisher"/><br/>
            <br/>
            Export year: <input type="text" value="${param.yearOfExport}" name="yearOfExport"/><br/>
            ${bookError.bookYearExError}<br/>
            Total<input type="number" value="${param.bookTotal}" name="bookTotal"/><br/>
            ${bookError.bookTotalError}<br/>
            Available: <input type="number" readonly value="${param.bookAvailable}" name="bookAvailable"/><br/>
            <br/>
            <input type="hidden" name="txtSearch" value="${param.txtSearch}">
            <input type="submit" name="btnAction" value="Update Book"/>
        </form>
    </body>
</html>
