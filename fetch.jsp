<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fetch</title>
    </head>
    <body>
        <h1>Choose what you want to do </h1>
        <a href="fetch/fetchRegistration.jsp">Fetch data from registration table</a><br>
        <a href="fetch/fetchCourse.jsp">Fetch data from course table</a><br>
        <a href="fetch/fetchRoom.jsp">Fetch data from room table</a><br>
        <a href="fetch/fetchStudent.jsp">Fetch data from student table</a><br>
        <a href="fetch/fetchAdmitCard.jsp">Fetch data from admit card table</a><br>
        <a href="fetch/fetchResult.jsp">Fetch data from result table</a><br>
    </body>
</html>
