<%-- 
    Document   : search
    Created on : Jun 27, 2020, 9:44:43 PM
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
        <c:set var="userDTO" value="${sessionScope.USER_DTO}"/>
        <c:if test="${userDTO == null}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <c:if test="${userDTO != null}">
            <h1>Welcome ${userDTO.name}</h1>
            <form action="MainController">
                <input name="txtSearch" type="text"/>
                <input type="submit" name="btnAction" value="Search"/>
            </form>
            <a href="MainController?btnAction=Logout">Logout</a>
        </c:if>


    </body>
</html>
