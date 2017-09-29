<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    
    <body background ="image/register.jpg">
        <h1 align="center">Registration</h1>
        <%
            String id = new String();
            String name = new String();
            String pass = new String();
            String repass= new String();
            String dept = new String();
            String email = new String();
            String ques = new String();
            String ans = new String();
            String mobile = new String();
            String sem = new String();
            if (request.getParameter("id") != null){
                id = request.getParameter("id").toUpperCase().trim();
            }
            if (request.getParameter("name") != null){
                name = request.getParameter("name").toUpperCase().trim();
            }
            if (request.getParameter("pass") != null){
                pass = request.getParameter("pass");
            }
            if (request.getParameter("repass") != null){
                repass = request.getParameter("repass");
            }
            if (request.getParameter("dept") != null){
                dept = request.getParameter("dept").toUpperCase().trim();
            }
            if (request.getParameter("email") != null){
                email = request.getParameter("email").toLowerCase().trim();
            }
            if (request.getParameter("ques") != null){
                ques = request.getParameter("ques");
            }
            if (request.getParameter("ans") != null){
                ans = request.getParameter("ans").toLowerCase().trim();
            }
            if (request.getParameter("mobile") != null){
                mobile = request.getParameter("mobile").trim();
            }
            if (request.getParameter("sem") != null){
                sem = request.getParameter("sem").trim();
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
            public int fillData(String id, String name, String pass, String dept, 
                    String email, String ques, String ans, String mobile, String sem) {
                int check = 0;
                try{
                    Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connect.createStatement();
                    check = statement.executeUpdate("Insert into Registration values "
                            + "('"+id+"','"+name+"', '"+pass+"', "
                            + "'"+dept+"', '"+email+"', '"+ques+"', "
                            + "'"+ans+"', '"+mobile+"', '"+sem+"')");
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
            else if (!(pass.equals(repass))) {
                out.print ("Password didn't match");
            }
            else {
                if (request.getParameter("submit") != null) {
                    if (!id.equals("") && !name.equals("") && !pass.equals("")
                            && !dept.equals("") && !email.equals("") && 
                            !ques.equals("") && !ans.equals("")&&
                            !mobile.equals("")&& !sem.equals("")) {
                        Register reg = new Register();
                        check = reg.fillData(id, name, pass, dept, email, ques, ans, mobile, sem);
                        if (check != 0) {
                            out.print("You are successfully registered");
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
             
        <% if (request.getParameter("submit") == null) { %>
            <form name="register" action="register.jsp" method="POST">
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
                            <td>Password</td>
                            <td><input type="password" name="pass" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Retype Password</td>
                            <td><input type="password" name="repass" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Department</td>
                            <td><input type="text" name="dept" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Email ID</td>
                            <td><input type="text" name="email" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Security Question</td>
                            <td><select name="ques">
                                    <option>Your favourite sport</option>
                                    <option>Your pet name</option>
                                    <option>Your hobby</option>
                                    <option>Your favourite time pass</option>
                                    <option>Your favourite player</option>
                                    <option>Your dream</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Security Answer</td>
                            <td><input type="text" name="ans" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Mobile Number</td>
                            <td><input type="text" name="mobile" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Semester</td>
                            <td><input type="text" name="sem" value="" size="20" /></td>
                        </tr>
                    </tbody>
                </table>
                <br><br>
                <div style="text-align:center">
                    <input type="reset" value="clear" name="clear" />
                    <input type="submit" value="register" name="submit" />
                </div>
            </form>
        <% }

        if (request.getParameter("submit") != null && check == 0) { %>
            <br> <a href="register.jsp">register again</a>
        <% } %>
        
        <br> <a href="index.jsp">back to home</a>
    </body>
</html>
