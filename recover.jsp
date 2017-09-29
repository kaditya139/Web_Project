<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recover</title>
    </head>
    <body>
        <h1>Follow instruction to recover password</h1>
            
        <%!
            class FindQuestion {
                public ResultSet printQuestion(String id) throws SQLException {
                    ResultSet resultSet = null;
                    try {
                        Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                        Statement statement = connect.createStatement();
                        resultSet = statement.executeQuery("select * from Registration "
                                + "where ExamID = '"+id+"'");
                        
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }
            }
            %>
        
        <%
            String userID = request.getParameter("id");
            if(userID != null)
                userID = userID.toUpperCase().trim();
            HttpSession sess = request.getSession();
            sess.setAttribute("username", userID);
            FindQuestion find = new FindQuestion();
            ResultSet detail = find.printQuestion(userID);
            if (request.getParameter("submit") != null) {
                if (detail.next()) {
                    sess.setAttribute("question", detail.getString(6));
                    sess.setAttribute("answer", detail.getString(7));
                    response.sendRedirect("verify.jsp");
                }
                else {
                    out.println("User ID do not exist");
                }
            }
            %>
            
        <form name="recover" action="recover.jsp" method="POST">
            <% if (request.getParameter("submit") == null) { %>
                Enter username of your account<br><br>
                Username : <input type="text" name="id" value="" size="20" /><br>
                <input type="submit" value="submit" name="submit" /><br>
            <% } %>
            <a href ="index.jsp">back to home</a><br>
        </form>
    </body>
</html>
