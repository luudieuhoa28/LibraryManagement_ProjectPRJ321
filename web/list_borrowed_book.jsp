<%-- 
    Document   : list_borrowed_book
    Created on : Jul 2, 2020, 4:57:52 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="SearchController?txtSearch=${param.txtSearch}">Search</a>  
        <c:if test="${sessionScope.MAP_BORROWED_BOOK != null}">
            <c:set var="mapBorrowedBook" value="${sessionScope.MAP_BORROWED_BOOK}"/>
            <c:set var="mapOrder" value="${sessionScope.MAP_ORDER}"/>
            <c:forEach var="mapItem" items="${mapBorrowedBook}">
                <table border='1'>
                    Borrowed Date: ${mapOrder.get(mapItem.key).borrowDate}<br/>
                    Return Date: ${mapOrder.get(mapItem.key).returnDate}<br/>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Book ID</th>
                            <th>Book Name</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach varStatus="counter" var="listBorrowedBook" items="${mapItem.value}">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${listBorrowedBook.bookId}</td>
                                <td>${listBorrowedBook.bookName}</td>
                                <td>${listBorrowedBook.borrowedQuantity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <form action="MainController" method="post">
                    <input type="hidden" name="orderId" value="${mapItem.key}"/>
                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                    <input type="submit" name="btnAction" value="Return Books"/>
                </form>

            </c:forEach>
            <c:if test="${sessionScope.MAP_BORROWED_BOOK.isEmpty()}">
                <p>You have not borrowed any books yet!!!</p>
            </c:if>
        </c:if>

    </body>
</html>
