<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam</title>
    </head>
    <body background ="image/index.jpg">
        <h1 align="center">Examination Management</h1>
        
        <%!
            class Sign_In {
                public ResultSet checkData(String user, String pass) {
                    ResultSet resultSet = null;
                    try{
                        Connection connnect = DriverManager.getConnection(
                                "jdbc:oracle:thin:@localhost:1521:orcl",
                                                    "Aditya", "Aditya");
                        Statement statement = connnect.createStatement();
                        resultSet = statement.executeQuery("select * from"
                                + " Registration where ExamID = '"+user+"'"
                                + "and Password = '"+pass+"'");
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }
            }
            %>
            
        <%
            if(request.getParameter("adminLogin") != null)
                response.sendRedirect("verifyAdmin.jsp");
            else if(request.getParameter("register") != null)
                response.sendRedirect("register.jsp");
            else if(request.getParameter("reset") != null)
                response.sendRedirect("recover.jsp");
            else {
                String user = request.getParameter("username");
                if(user != null)
                    user = user.toUpperCase().trim();
                HttpSession sess = request.getSession();
                sess.setAttribute("userID", user);
                String pass = request.getParameter("password");
                if (request.getParameter("studentLogin") != null){
                    if (user.equals("") || pass.equals("")) {
                        out.println("Username or password is missing");
                    }
                    else {
                        Sign_In sign = new Sign_In();
                        ResultSet resultSet = sign.checkData(user, pass);
                        if (resultSet.next()) {
                            response.sendRedirect("profile.jsp");
                        }
                        else {
                            out.println("Your username or password is wrong<br>");
                            out.println("<a href =\"index.jsp\"><b>try again</b></a><br>");
                            out.println("<a href =\"recover.jsp\"><b>recover password</b></a><br>");
                        }
                    }
                }
            }
            %>
            
        <% if (request.getParameter("studentLogin") == null) { %>
            <form name="myForm" action="index.jsp" method="POST">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <td><input type="text" name="username" value="" placeholder="StudentID" size="30" /></td>
                        </tr><br/>
                        <tr>
                            <td><input type="password" name="password" value="" placeholder="Password" size="30" /></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <div style="text-align:center">  
                    <input type ="submit" style="background-color: #0000ff; color: #ffffff;" name ="studentLogin" value="STUDENT LOGIN" />
                    <input type ="submit" style="background-color: #0000ff; color: #ffffff;" name ="adminLogin" value="ADMIN LOGIN" />
                </div>
                <br>
                <div style="text-align:center">  
                    <input type ="submit" style="background-color: #0000ff; color: #ffffff;" name ="register" value="REGISTER" /> 
                    <input type ="submit" style="background-color: #0000ff; color: #ffffff;" name ="reset" value="RESET PASSWORD" />
                </div>
            </form>
        <% } %>
    </body>
</html>