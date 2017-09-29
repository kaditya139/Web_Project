<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admit Card</title>
    </head>
    <body bgcolor="#9f9f9f">
        <h1 align="center">Admit Card</h1>
        
        <%!
            class AdmitCard {
                public ResultSet fetchAdmitCard(String user) {
                    ResultSet resultSet = null;
                    try{
                        Connection connnect = DriverManager.getConnection(
                                "jdbc:oracle:thin:@localhost:1521:orcl",
                                                    "Aditya", "Aditya");
                        Statement statement = connnect.createStatement();
                        resultSet = statement.executeQuery("select * from AdmitCard where ExamID = '"+user+"'");
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
            ResultSet resultSet = null;
            HttpSession sess = request.getSession();
            if(sess.getAttribute("userID") != null)
                user = sess.getAttribute("userID").toString();
            if(user != null) {
                AdmitCard fetch = new AdmitCard();
                resultSet = fetch.fetchAdmitCard(user);
            }
            %>
            
        <table border="0">
            <tbody>
                <tr>
                    <td>Exam ID :</td>
                    <% if (resultSet.next()) { %>
                    <td><b><%= resultSet.getString("ExamID")%></b></td>
                    <%}%>
                </tr>
                 <tr>
                    <td>Name :</td>
                    <td><b><%= resultSet.getString("Name")%></b></td>
                </tr>
                 <tr>
                    <td>Room No :</td>
                    <td><b><%= resultSet.getString("RoomNo")%></b></td>
                </tr>
                 <tr>
                    <td>Seat No :</td>
                    <td><b><%= resultSet.getString("SeatNo")%></b></td>
                </tr>
            </tbody>
        </table>
        <br>
        <button onclick="myFunction()">Print</button>
        <script>
            function myFunction() {
                window.print();
            }
        </script>
    </body>
</html>