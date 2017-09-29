<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enter</title>
    </head>
    <body>
        <h1>Choose what you want to do </h1>
        <a href="enter/enterCourse.jsp">Enter data in course table</a><br>
        <a href="enter/enterRoom.jsp">Enter data in room table</a><br>
        <a href="enter/enterStudent.jsp">Enter data in student table</a><br>
        <a href="enter/enterResult.jsp">Enter data in result table</a><br>
    </body>
</html>
