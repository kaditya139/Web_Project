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
        <h1 align="center">Enter Course</h1>
        <%
            String dept = new String();
            String sem = new String();
            String id = new String();
            String name = new String();
            if (request.getParameter("dept") != null){
                dept = request.getParameter("dept").toUpperCase().trim();
            }
            if (request.getParameter("sem") != null){
                sem = request.getParameter("sem").trim();
            }
            if (request.getParameter("id") != null){
                id = request.getParameter("id").toUpperCase().trim();
            }
            if (request.getParameter("name") != null){
                name = request.getParameter("name").toUpperCase().trim();
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
                    resultSet = statement.executeQuery("Select * from Course "
                            + " where SubID = '"+id+"'");
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
            public int fillData(String dept, String sem, String id, String name) {
                int check = 0;
                try{
                    Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connect.createStatement();
                    check = statement.executeUpdate("Insert into Course values "
                            + "('"+dept+"','"+sem+"', '"+id+"', '"+name+"')");
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
                    if (!dept.equals("") && !sem.equals("") && !id.equals("") && !name.equals("")) {
                        Register reg = new Register();
                        check = reg.fillData(dept, sem, id, name);
                        if (check != 0) {
                            out.print("You course data inserted successfully");
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
            <form name="enter" action="enterCourse.jsp" method="POST">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <td>Department</td>
                            <td><input type="text" name="dept" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Semester</td>
                            <td><input type="text" name="sem" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Subject ID</td>
                            <td><input type="text" name="id" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Subject Name</td>
                            <td><input type="text" name="name" value="" size="20" /></td>
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
            <br> <a href="enterCourse.jsp">enter again</a>
        <% } %>
        
        <br> <a href="http://localhost:8080/project/index.jsp">back to home</a>
    </body>
</html>
