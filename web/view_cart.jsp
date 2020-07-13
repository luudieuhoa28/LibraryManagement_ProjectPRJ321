<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : view_cart
    Created on : Jun 29, 2020, 4:43:31 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <a href="SearchController?txtSearch=${param.txtSearch}">Search</a>  
        <c:if test="${sessionScope.CART == null}">
            <p>You have not selected the book!!!</p>
        </c:if>
        <c:if test="${sessionScope.CART != null}">
            <c:if test="${sessionScope.CART.cart.size() <= 0}">
                <p>You have not selected the book!!!</p>
            </c:if>
            <c:if test="${sessionScope.CART.cart.size() > 0}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Order</th>
                            <th>Book ID</th>
                            <th>Book Name</th>
                            <th>Book quantity</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="cart" value="${sessionScope.CART.cart}"/>
                        <c:forEach varStatus="counter" var="mapCart" items="${sessionScope.CART.cart}">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${mapCart.value.bookId}</td>
                            <input type="hidden" value="${mapCart.value.bookId}" name="bookId"/>
                            <td>${mapCart.value.bookName}</td>
                            <td><input type="text" value="${mapCart.value.numInCart}" name="numInCart"/></td>
                            <input type="hidden" value="${param.txtSearch}" name="txtSearch"/>
                            <td><input type="submit" name="btnAction" value="Update Cart"/></td>
                            <td><input type="submit" name="btnAction" value="Delete"/></td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
            <p>${requestScope.MESSAGE_CART}</p>
            <a href="MainController?btnAction=Borrow">Borrow</a>

        </c:if>
    </c:if>
    ${requestScope.BORROW_MESSAGE}
</body>
</html>
