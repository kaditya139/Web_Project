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
        <h1 align="center">Enter Result</h1>
        <%
            String examid = new String();
            String subid = new String();
            String subname = new String();
            String total = new String();
            String obtained = new String();
            if (request.getParameter("examid") != null){
                examid = request.getParameter("examid").toUpperCase().trim();
            }
            if (request.getParameter("subid") != null){
                subid = request.getParameter("subid").toUpperCase().trim();
            }
            if (request.getParameter("subname") != null){
                subname = request.getParameter("subname").toUpperCase().trim();
            }
            if (request.getParameter("total") != null){
                total = request.getParameter("total").trim();
            }
            if (request.getParameter("obtained") != null){
                obtained = request.getParameter("obtained").trim();
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
                    resultSet = statement.executeQuery("Select * from Registration "
                            + " where ExamID = '"+id+"'");
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
            public int fillData(String examid, String subid, String subname, 
                    String total, String obtained){
                int check = 0;
                try{
                    Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connect.createStatement();
                    check = statement.executeUpdate("Insert into Registration values "
                            + "('"+examid+"','"+subid+"', '"+subname+"', "
                            + "'"+total+"', '"+obtained+"')");
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
            ResultSet resultSet = regValid.checkData(examid);
            if (resultSet.next()) {
                out.print("User ID exist. Choose different ID");
            }
            else {
                if (request.getParameter("enter") != null) {
                    if (!examid.equals("") && !subid.equals("") && !subname.equals("")
                            && !total.equals("") && !obtained.equals("")) {
                        Register reg = new Register();
                        check = reg.fillData(examid, subid, subname, total, obtained);
                        if (check != 0) {
                            out.print("Your result data inserted successfully");
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
            <form name="enter" action="enterResult.jsp" method="POST">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <td>Exam ID</td>
                            <td><input type="text" name="examid" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Subject ID</td>
                            <td><input type="text" name="subid" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Subject name</td>
                            <td><input type="text" name="subname" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Total Marks</td>
                            <td><input type="text" name="total" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Obtained Marks</td>
                            <td><input type="text" name="obtained" value="" size="20" /></td>
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
            <br> <a href="enterResult.jsp">register again</a>
        <% } %>
        
        <br> <a href="http://localhost:8080/project/index.jsp">back to home</a>
    </body>
</html>
