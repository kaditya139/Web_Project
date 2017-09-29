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
        <h1 align="center">Enter Room</h1>
        <%
            String rid = new String();
            String sid = new String();
            String iid = new String();
            if (request.getParameter("rid") != null){
                rid = request.getParameter("rid").toUpperCase().trim();
            }
            if (request.getParameter("sid") != null){
                sid = request.getParameter("sid").toUpperCase().trim();
            }
            if (request.getParameter("iid") != null){
                iid = request.getParameter("iid").toUpperCase().trim();
            }
            %>
               
        <%!
        class RegisterValid {
            public ResultSet checkData(String id) throws SQLException {
                ResultSet resultSet = null;
                try{
                    Connection connnect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connnect.createStatement();
                    resultSet = statement.executeQuery("Select * from Room "
                            + " where RoomNo = '"+id+"'");
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                return resultSet;
            }
        }
        %>
        
        <%!
        class Register {
            public int fillData(String rid, String sid, String iid) {
                int check = 0;
                try{
                    Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connect.createStatement();
                    check = statement.executeUpdate("Insert into Room values "
                            + "('"+rid+"','"+sid+"', '"+iid+"')");
                }
                catch (Exception e){
                    e.printStackTrace();
                }
                return check;
            }
        }
        %>
        
        <%
            int check = 0;
            RegisterValid regValid = new RegisterValid();
            ResultSet resultSet = regValid.checkData(rid);
            if (resultSet.next()) {
                out.print("User ID exist. Choose different ID");
            }
            else {
                if (request.getParameter("enter") != null) {
                    if (!rid.equals("") && !sid.equals("") && !iid.equals("")) {
                        Register reg = new Register();
                        check = reg.fillData(rid, sid, iid);
                        if (check != 0) {
                            out.print("Your room data inserted successfully");
                        }
                        else {
                            out.print("We encountered some error. Please try again");
                        }
                    }
                    else {
                        out.print("Fill All the details");
                    }
                }
            }
            %>
             
        <% if (request.getParameter("enter") == null) { %>
            <form name="enter" action="enterRoom.jsp" method="POST">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <td>Room ID</td>
                            <td><input type="text" name="rid" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>No of Student</td>
                            <td><input type="text" name="sid" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>No of Invigilator</td>
                            <td><input type="text" name="iid" value="" size="20" /></td>
                        </tr>
                    </tbody>
                </table>
                <br><br>
                <div style="text-align:center">
                    <input type="reset" value="clear" name="clear" />
                    <input type="submit" value="enter" name="enter" />
                </div>
            </form>
        <% }

        if (request.getParameter("enter") != null && check == 0) { %>
            <br> <a href="enterRoom.jsp">enter again</a>
        <% } %>
        
        <br> <a href="http://localhost:8080/project/index.jsp">back to home</a>
    </body>
</html>