<%-- 
    Document   : about
    Created on : Jun 23, 2022, 10:01:02 PM
    Author     : rafih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/views/layouts/head.jsp">
            <jsp:param name="title" value="Home"/>
        </jsp:include>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="/views/layouts/navbar.jsp"></jsp:include>
        <h1>About us</h1>
        <a href="Home">Go to index</a>
        <jsp:include page="/views/layouts/footer.jsp"></jsp:include>
        <jsp:include page="/views/layouts/scripts.jsp"></jsp:include>
    </body>
</html>
