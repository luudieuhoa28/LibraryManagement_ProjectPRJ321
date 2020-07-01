<%-- 
    Document   : search_admin
    Created on : Jun 27, 2020, 9:44:43 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Admin Page</title>
    </head>
    <body>
        <c:set var="userDTO" value="${sessionScope.USER_DTO}"/>
        <c:if test="${userDTO == null}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <c:if test="${userDTO != null}">
            <h1>Welcome ${userDTO.name}</h1>
            <form action="MainController">
                <input name="txtSearch" type="text" value="${param.txtSearch}"/>
                <input type="submit" name="btnAction" value="Search"/>
            </form>
            <c:if test="${sessionScope.LIST_SEARCH_BOOK != null}">
                <c:if test="${!sessionScope.LIST_SEARCH_BOOK.isEmpty()}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Order</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Author</th>
                                <th>Publisher</th>
                                <th>Year Export</th>
                                <th>Total</th>
                                <th>Available</th>
                                <th>Add to card</th>
                                <th>Borrow</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book"  varStatus="counter" items="${sessionScope.LIST_SEARCH_BOOK}">
                            <form action="MainController">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${book.bookId}</td>
                                <input type="hidden" name="bookId" value="${book.bookId}"/>
                                <td>${book.bookName}</td>
                                <input type="hidden" name="bookName" value="${book.bookName}"/>
                                <td>${book.author}</td>
                                <input type="hidden" name="bookAuthor" value="${book.author}"/>
                                <td>${book.publisher}</td>
                                <input type="hidden" name="bookPublisher" value="${book.publisher}"/>
                                <td>${book.yearOfExport}</td>
                                <input type="hidden" name="yearOfExport" value="${book.yearOfExport}"/>
                                <td>${book.totalBook}</td>
                                <input type="hidden" name="bookTotal" value="${book.totalBook}"/>
                                <td>${book.availableBook}</td>
                                <input type="hidden" name="bookAvailable" value="${book.availableBook}"/>
                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                <td>
                                    <input type="submit" name="btnAction" value="Update Page"/>
                                </td>
                                <td>
                                    <input type="submit" name="btnAction" value="Delete Book"/>
                                </td>
                                </tr>
                            </form>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </c:if>
        <a href="MainController?btnAction=Logout">Logout</a>
        <a href="add_book_page.jsp">Add book</a>
    </c:if>


</body>
</html>
