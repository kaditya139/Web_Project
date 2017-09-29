<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <h1>Choose what you want to do </h1>
        <a href="delete/deleteRegistration.jsp">Delete data from registration table</a><br>
        <a href="delete/deleteCourse.jsp">Delete data from course table</a><br>
        <a href="delete/deleteRoom.jsp">Delete data from room table</a><br>
        <a href="delete/deleteStudent.jsp">Delete data from student table</a><br>
        <a href="delete/deleteAdmitCard.jsp">Delete data from admit card table</a><br>
        <a href="delete/deleteResult.jsp">Delete data from result table</a><br>
    </body>
</html>
