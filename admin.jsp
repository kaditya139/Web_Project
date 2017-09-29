<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <style>
        li <%--{display:inline;}--%>
        a.one:link{color:black;}
        a.one:visited{colour:yellow;}
        a.one:hover{font-size:130%;}
    </style>
    <body>
        <h1>Choose what you want to do </h1>
        <ul
            <li><a class="one" href="enter.jsp">Enter</a></li>
            <li><a class="one" href="update.jsp">Update</a></li>
            <li><a class="one" href="delete.jsp">Delete</a></li>
            <li><a class="one" href="fetch.jsp">Fetch</a></li>
        </ul>
        <a href="index.jsp">back to home</a><br>
    </body>
</html>
