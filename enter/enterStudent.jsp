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
        <h1 align="center">Enter Student</h1>
        <%
            String id = new String();
            String name = new String();
            String dept = new String();
            String sem = new String();
            String total = new String();
            String attended = new String();
            if (request.getParameter("id") != null){
                id = request.getParameter("id").toUpperCase().trim();
            }
            if (request.getParameter("name") != null){
                name = request.getParameter("name").toUpperCase().trim();
            }
            if (request.getParameter("dept") != null){
                dept = request.getParameter("dept").toUpperCase().trim();
            }
            if (request.getParameter("sem") != null){
                sem = request.getParameter("sem").trim();
            }
            if (request.getParameter("total") != null){
                total = request.getParameter("total").trim();
            }
            if (request.getParameter("attended") != null){
                attended = request.getParameter("attended").trim();
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
                    resultSet = statement.executeQuery("Select * from Student "
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
            public int fillData(String id, String name, String dept, String sem, 
                    String total, String attended) {
                int check = 0;
                try{
                    Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connect.createStatement();
                    check = statement.executeUpdate("Insert into Student values "
                            + "('"+id+"','"+name+"', '"+dept+"', "
                            + "'"+sem+"', '"+total+"', '"+attended+"')");
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
            ResultSet resultSet = regValid.checkData(id);
            if (resultSet.next()) {
                out.print("User ID exist. Choose different ID");
            }
            else {
                if (request.getParameter("enter") != null) {
                    if (!id.equals("") && !name.equals("") && !dept.equals("")
                            && !sem.equals("") && !total.equals("") && !attended.equals("")) {
                        Register reg = new Register();
                        check = reg.fillData(id, name, dept, sem, total, attended);
                        if (check != 0) {
                            out.print("Your student data inserted successfully");
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
            <form name="enter" action="enterStudent.jsp" method="POST">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <td>Exam ID</td>
                            <td><input type="text" name="id" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="name" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Department</td>
                            <td><input type="text" name="dept" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Semester</td>
                            <td><input type="text" name="sem" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Total Class</td>
                            <td><input type="text" name="total" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Class Attended</td>
                            <td><input type="text" name="attended" value="" size="20" /></td>
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
            <br> <a href="enterStudent.jsp">enter again</a>
        <% } %>
        
        <br> <a href="http://localhost:8080/project/index.jsp">back to home</a>
    </body>
</html>
