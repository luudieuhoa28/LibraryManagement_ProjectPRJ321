<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : search_user
    Created on : Jun 29, 2020, 2:44:39 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search User Page</title>
    </head>
    <body>
        <c:set var="userDTO" value="${sessionScope.USER_DTO}"/>
        <h1>Welcome ${userDTO.name}</h1>
        <a href="MainController?btnAction=Logout">Logout</a>
        <a href="MainController?btnAction=ViewCart&txtSearch=${param.txtSearch}">View Cart</a>
        <a href="MainController?btnAction=ListBorrowedBook&txtSearch=${param.txtSearch}">View Borrowed Book</a>       
        <a href="MainController?btnAction=Change password&txtSearch=${param.txtSearch}">Change password</a>
        <a href="MainController?btnAction=ViewProfile&userId=${userDTO.userId}&name=${userDTO.name}&cbxGender=${userDTO.gender}&phone=${userDTO.phone}&address=${userDTO.address}&txtSearch=${param.txtSearch}">View profile</a>
        <form action="MainController">
            <input name="txtSearch" type="text" value="${param.txtSearch}"/>
            <input type="submit" name="btnAction" value="Search"/>
        </form>
        ${requestScope.BORROW_MESSAGE}
        ${requestScope.INFOR_MESSAGE}
        <p>${requestScope.MESSAGE_CART}</p>
        <c:if test="${sessionScope.LIST_SEARCH_BOOK != null}">
            <c:if test="${!sessionScope.LIST_SEARCH_BOOK.isEmpty()}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Order</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Available</th>
                            <th>Add to cart</th>
                            <th>Borrow</th>                          
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book"  varStatus="counter" items="${sessionScope.LIST_SEARCH_BOOK}">
                        <form action="MainController">
                            <c:if test="${book.isExisted}">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${book.bookId}</td>
                                <input type="hidden" name="bookId" value="${book.bookId}"/>
                                <td><a href="ShowBookInforController?bookId=${book.bookId}&txtSearch=${param.txtSearch}">${book.bookName}</a></td>
                                <input type="hidden" name="bookName" value="${book.bookName}"/>
                                <c:if test="${book.availableBook > 0}">
                                    <c:set var="isCheck" value="checked"/>
                                    <c:set var="isDisabled" value=""/>
                                </c:if>
                                <c:if test="${book.availableBook == 0}">
                                    <c:set var="isCheck" value=""/>
                                    <c:set var="isDisabled" value="disabled"/>
                                </c:if>
                                <td><input type="checkbox" disabled ${isCheck}/></td>
                                <input type="hidden" name="available" value="${book.availableBook}"/>
                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                <td>
                                    <input type="submit" name="btnAction" value="Add to cart" ${isDisabled}/>
                                </td>
                                <td>
                                    <input type="submit" name="btnAction" value="Borrow" ${isDisabled}/>
                                </td>
                                </tr>
                            </c:if>
                        </form>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>


    </c:if>
</body>
</html>
