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
        <h1>Fetch Registration</h1>
        
        <%!
        class Fetch {
            public ResultSet fetchData() {
                ResultSet resultSet = null;
                 try{
                    Connection connnect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connnect.createStatement();
                    resultSet = statement.executeQuery("select * from Registration");
                 }
                 catch (Exception e) {
                     e.printStackTrace();
                 }
                 return resultSet;
            }
        }
        %>
        
        <%
            Fetch fetch = new Fetch();
            ResultSet data = fetch.fetchData();
            %>
            
        <table border="1">
            <tbody>
                <tr>
                    <td>ExamID</td>
                    <td>Name</td>
                    <td>Password</td>
                    <td>Department</td>
                    <td>Email</td>
                    <td>Question</td>
                    <td>Answer</td>
                    <td>Mobile</td>
                    <td>Semester</td>
                </tr>
                <% while (data.next()) { %>
                <tr>
                    <td><%= data.getString("ExamID")%></td>
                    <td><%= data.getString("Name")%></td>
                    <td><%= data.getString("Password")%></td>
                    <td><%= data.getString("Department")%></td>
                    <td><%= data.getString("Email")%></td>
                    <td><%= data.getString("SecQuestion")%></td>
                    <td><%= data.getString("SecAnswer")%></td>
                    <td><%= data.getString("MobileNo")%></td>
                    <td><%= data.getString("Semester")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="http://localhost:8080/project/index.jsp">back to home</a>
    </body>
</html>
