<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject List</title>
    </head>
    <body background ="image/grad.jpg">
        <h1>Subject List</h1>
        
        <%!
            class FetchList {
                public ResultSet fetchList(String user) {
                    ResultSet resultSet = null;
                    try{
                        Connection connnect = DriverManager.getConnection(
                                "jdbc:oracle:thin:@localhost:1521:orcl",
                                                    "Aditya", "Aditya");
                        Statement statement = connnect.createStatement();
                        resultSet = statement.executeQuery("select SubID, SubName from Registration r, "
                                + "Student s, Course c where r.ExamID = s.ExamID and (s.Department = "
                                + "c.Department and s.Semester = c.Semester) and s.ExamID = '"+user+"'");
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }
            }
            %>
            
        <%
            String user = null;
            HttpSession sess = request.getSession();
            if(sess.getAttribute("userID") != null)
                user = sess.getAttribute("userID").toString();
            if(user != null) {
                FetchList fetch = new FetchList();
                ResultSet resultSet = fetch.fetchList(user);
                out.println("Your subjects are :<br>");
                while(resultSet.next()) {
                    out.println(resultSet.getString(1)+"    "+resultSet.getString(2)+"<br>");
                }
            }
            %>
    </body>
</html>