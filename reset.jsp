<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset</title>
    </head>
    <body>
        <h1>Enter new password</h1>
        
        <%!
            class Reset {
                public int resetPassword(String username, String password){
                    int check = 0;
                    try {
                        Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                        Statement statement = connect.createStatement();
                        check = statement.executeUpdate("update Registration set password = "
                                + "'"+password+"' where ExamID = '"+username+"'");
                    }
                    catch(Exception e) {
                        e.printStackTrace();
                    }
                    return check;
                }
            }
            %>
        
        <%
            HttpSession sess = request.getSession();
            String user = sess.getAttribute("username").toString();
            String password = request.getParameter("pass");
            String repassword = request.getParameter("repass");
            if (request.getParameter("submit") != null) {
                if (password.equals(repassword)) {
                    Reset reset = new Reset();
                    int check = reset.resetPassword(user, password);
                    if (check != 0) {
                        out.println("Password update successfully");
                    }
                    else {
                        out.println("We encountered some error. Please try later");
                    }
                }
                else {
                    out.println("Password doesn't matches. Try again ");
                }
            }
            %>
        
        
        <form name="reset" action="reset.jsp" method="POST">
            <% if (request.getParameter("submit") == null) { %>
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Enter new password</td>
                            <td><input type="password" name="pass" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Confirm password</td>
                            <td><input type="password" name="repass" value="" size="20" /></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" value="submit" name="submit" /><br>
            <% } %>
            <a href ="recover.jsp">reset password<a/><br>
            <a href ="index.jsp">back to home</a><br>
        </form>
    </body>
</html>
