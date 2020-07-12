<%-- 
    Document   : list_user
    Created on : Jul 8, 2020, 12:05:29 PM
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
        <c:set var="listUser" value="${sessionScope.LIST_USER}"/>
        <c:if test="${listUser != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>User name</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach varStatus="counter" var="userDTO" items="${listUser}">
                        <tr>
                            <td>${userDTO.userId}</td>
                            <td>${userDTO.name}</td>
                            <td>${userDTO.gender}</td>
                            <td>${userDTO.phone}</td>
                            <td>${userDTO.address}</td>
                    <form action="MainController" method="POST">
                        <input type="hidden" name="userId" value="${userDTO.userId}"/>
                        <c:if test="${userDTO.isExisted != true}">
                            <td><input type="submit" name="btnAction" value="Disable User" disabled/></td>
                            <td><input type="submit" name="btnAction" value="Enable User"/></td>
                            </c:if>
                            <c:if test="${userDTO.isExisted}">
                            <td><input type="submit" name="btnAction" value="Disable User"/></td>
                            <td><input type="submit" name="btnAction" value="Enable User" disabled/></td>
                            </c:if>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
