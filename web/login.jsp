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
       Tiếng việt nè!! User name<input type="text" name="userId"/></br>
        Password<input type="password" name="password"/></br>
        <input type="submit" name="btnAction" value="Login"/>
         <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/FinalProjectPRJ321/googlecallback&response_type=code
    &client_id=321765933526-j5blsda3p6483mjffa9djo9peqh2j16p.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>  

        <input type="reset" value="Reset"/>
    </form>
        <a href="register.jsp">Create an account</a>
    </body>
</html>
