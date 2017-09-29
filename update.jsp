<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>
        <h1>Choose what you want to do </h1>
        <a href="update/updateRegistration.jsp">Update data into registration table</a><br>
        <a href="update/updateCourse.jsp">Update data into course table</a><br>
        <a href="update/updateRoom.jsp">Update data into room table</a><br>
        <a href="update/updateStudent.jsp">Update data into student table</a><br>
        <a href="update/updateAdmitCard.jsp">Update data into admit card table</a><br>
        <a href="update/updateResult.jsp">Update data into result table</a><br>
    </body>
</html>
