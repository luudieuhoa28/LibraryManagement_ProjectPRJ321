<%-- 
    Document   : login
    Created on : Jun 25, 2020, 4:41:26 PM
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
    <form action="MainController" method="post">
        User name<input type="text" name="userId"/></br>
        Password<input type="password" name="password"/></br>
        <input type="submit" name="btnAction" value="Login"/>
        <input type="reset" value="Reset"/>
    </form>
        <a href="register.jsp">Create an account</a>
    </body>
</html>
