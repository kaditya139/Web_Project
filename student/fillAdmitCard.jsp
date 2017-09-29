<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fill Admit Card</title>
    </head>
    <body background ="image/grad.jpg">
        <h1>Admit Card filling status</h1>
        
        <%!
            class AdmitCard {
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
                
                public ResultSet checkData(String user) {
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
                
                public int fillData(String id, String name, String roomno, String seatno) {
                    int check = 0;
                    try{
                        Connection connnect = DriverManager.getConnection(
                                "jdbc:oracle:thin:@localhost:1521:orcl",
                                                    "Aditya", "Aditya");
                        Statement statement = connnect.createStatement();
                        check = statement.executeUpdate("Insert into AdmitCard values ('"+id+"', "
                                + "'"+name+"', '"+roomno+"', '"+seatno+"')");
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                    return check;
                }
            }
            %>
            
        <%
            AdmitCard ac = new AdmitCard();
            ResultSet resultSet = ac.fetchData();
            int count = 0;
            while(resultSet.next()) {
                String id = resultSet.getString("ExamID");
                String name = resultSet.getString("Name");
                int sub1 = Integer.parseInt(id.substring(0, 2));
                int sub2 = Integer.parseInt(id.substring(2, 4));
                int sub3 = Integer.parseInt(id.substring(6, 9));
                String roomno = Integer.toString((((sub3/25)*10)+sub2));
                String seatno = Integer.toString(((sub3%25)*2)-((17-sub1)/2));
                ResultSet rs = ac.checkData(id);
                count++;
                if(rs.next())
                    out.println(count+"    Data already there<br>");
                else {
                    int check = ac.fillData(id, name, roomno, seatno);
                    if(check == 1)
                        out.println(count+"    Data inserted successfully<br>");
                    else
                        out.println(count+"    We encountered some error. Try again after a moment<br>");
                }
            }
            %>
    </body>
</html>