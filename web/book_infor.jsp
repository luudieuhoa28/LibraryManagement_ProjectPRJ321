<%-- 
    Document   : book_infor
    Created on : Jul 1, 2020, 3:56:27 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Author</th>
                    <th>Publisher</th>
                    <th>Export Year</th>
                    <th>Available</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
            <form action="MainController" method="post">
                <tr>
                    <td>${param.bookId}</td>
                <input type="hidden" name="bookId" value="${param.bookId}"/>
                <td>${param.bookName}</td>
                <input type="hidden" name="bookName" value="${param.bookName}"/>
                <td>${param.author}</td>
                <input type="hidden" name="author" value="${param.author}"/>
                <td>${param.publisher}</td>
                <input type="hidden" name="publisher" value="${param.publisher}"/>
                <td>${param.exportYear}</td>
                <input type="hidden" name="exportYear" value="${param.exportYear}"/>
                <td>${requestScope.AVAILABLE}</td>
                <input type="hidden" name="available" value="${requestScope.AVAILABLE}"/>
                <td><input type="text" name="quantityInCart" value="${requestScope.NUM_IN_CARD}"/></td>
                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                <c:if test="${requestScope.AVAILABLE > 0}">
                    <c:set var="isDisabled" value=""/>
                </c:if>
                <c:if test="${requestScope.AVAILABLE == 0}">
                    <c:set var="isDisabled" value="disabled"/>
                </c:if>
                <td>
                    <input type="submit" name="btnAction" value="Add to cart" ${isDisabled}/>
                </td>
                <td>
                    <input type="submit" name="btnAction" value="Borrow" ${isDisabled}/>
                </td>
                </tr>
            </form>
        </tbody>
    </table>
    <p>${requestScope.MESSAGE_CART}</p>
    <a href="view_cart.jsp">View Cart</a>
    <a href="SearchController?txtSearch=${param.txtSearch}">Search</a>
    ${requestScope.BORROW_MESSAGE}
</body>
</html>
