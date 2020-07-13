<%-- 
    Document   : view_profile_page
    Created on : Jul 9, 2020, 2:53:00 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View profile Page</title>
    </head>
    <body>
        <a href="SearchController?txtSearch=${param.txtSearch}">Search</a>  
        <c:set var="userDTO" value="${sessionScope.USER_DTO}"/>
        <c:set var="errorUpdate" value="${requestScope.ERROR_UPDATE}"/>
        <c:if test="${userDTO != null}">
            <form action="MainController" method="POST">
                User name: <input type="text" name="userId" value="${param.userId}" readonly/></br>
                ${errorUpdate.userIdError} </br>
                Full name: <input type="text" name="name" value="${param.name}" maxlength="50"/></br>
                ${errorUpdate.nameError} </br>
                Gender: <select name="cbxGender">
                    <c:set var="strFemale" value="female"/>
                    <c:if test="${param.cbxGender.contains(strFemale)}">
                        <c:set var="isFemale" value="selected"/>
                    </c:if>
                    <c:if test="${!param.cbxGender.contains(strFemale)}">
                        <c:set var="isFemale" value=""/>
                    </c:if>
                    <option value="male">Male</option>
                    <option value="female" ${isFemale}>Female</option>
                </select><br/>
                Phone: <input type="text" name="phone" value="${param.phone}" maxlength="10"/></br>
                ${errorUpdate.phoneError} </br>
                Address: <input type="text" name="address" value="${param.address}" maxlength="200"/></br>
                <input type="submit" name="btnAction" value="Update profile"/>
            </form>
            ${requestScope.MESSAGE_UPDATE}
        </c:if>
    </body>
</html>
