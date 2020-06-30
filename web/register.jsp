<%-- 
    Document   : register
    Created on : Jun 27, 2020, 3:51:39 PM
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
    <c:set var="errorRegister" value="${requestScope.ERROR_ACCOUNT}"/>
        <form action="MainController" method="POST">
            User name: <input type="text" name="userId" value="${requestScope.USER_ID_VALUE}"/></br>
            ${errorRegister.userIdError} </br>
            Full name: <input type="text" name="name" value="${requestScope.NAME_VALUE}"/></br>
            ${errorRegister.nameError} </br>
            Gender: <select name="cbxGender">
<%--                <c:set var="strFemale" value="female"/>--%>
<%--                <c:if test="${requestScope.GENDER_VALUE.equals(strFemale)}">--%>
<%--                    <c:set var="isFemale" value="true"/>--%>
<%--                </c:if>--%>
<%--                <c:if test="${!requestScope.GENDER_VALUE.equals(strFemale)}">--%>
<%--                    <c:set var="isFemale" value="false"/>--%>
<%--                </c:if>--%>
                <option value="male" selected="${!isFemale}">Male</option>
                <option value="female" selected="${isFemale}">Female</option>
            </select><br/>
            Phone: <input type="text" name="phone" value="${requestScope.PHONE_VALUE}"/></br>
            Address: <input type="text" name="address" value="${requestScope.ADDRESS_VALUE}"/></br>
            Password: <input type="password" name="password" value="${requestScope.PASSWORD_VALUE}"/></br>
            Password again: <input type="password" name="rePassword" value="${requestScope.RE_PASSWORD_VALUE}"/></br>
            ${errorRegister.passwordError}</br>
            <input type="submit" name="btnAction" value="Create account"/>
        </form>
    </body>
</html>
