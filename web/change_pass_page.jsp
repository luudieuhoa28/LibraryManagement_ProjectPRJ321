<%-- 
    Document   : change_pass_page
    Created on : Jul 7, 2020, 10:03:15 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password Page</title>
    </head>
    <body>
        <a href="SearchController?txtSearch=${param.txtSearch}">Search</a>  
        <form action="MainController" method="POST">
            Your current password: <input type="password" name="currentPass" value="${param.currentPass}" maxlength="50"/><br/>
            ${requestScope.CHANGE_PASS_MESSAGE.currenPassError}<br/>
            Enter new password: <input type="password" name="newPass" value="${param.newPass}" maxlength="50"/><br/>
            ${requestScope.CHANGE_PASS_MESSAGE.newPassError}<br/>
            Re-Enter new current password: <input type="password" name="reNewPass" value="${param.reNewPass}" maxlength="50"/><br/>
            ${requestScope.CHANGE_PASS_MESSAGE.reNewPassError}<br/>
            <input type="submit" name="btnAction" value="Change password"/>
        </form>
    </body>
</html>
