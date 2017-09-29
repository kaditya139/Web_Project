<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify</title>
    </head>
    <body>
        <h1>Provide answer</h1>
        
        <%
            HttpSession sess = request.getSession();
            String user = sess.getAttribute("username").toString();
            String question = sess.getAttribute("question").toString();
            String pAnswer = request.getParameter("answer");
            String sAnswer = sess.getAttribute("answer").toString();
            if (request.getParameter("submit") != null){
                if (pAnswer != null) {
                    if (pAnswer.equals(sAnswer)) {
                        response.sendRedirect("reset.jsp");
                    }
                    else {
                        out.println("Your answer do not match. Try again !!");
                    }
                }
                else {
                    out.println("Your didn't provide answer !!");
                }
            }
            %>
            
        <form name="recover" action="verify.jsp" method="POST">
            <% if (request.getParameter("submit") == null){ %>
            Hello <%= user %>. Please provide answer to following question <br>
            <b><i> <%= question %></i></b><br>
                Answer : <input type="text" name="answer" value="" size="20" /><br>
                <input type="submit" value="submit" name="submit" /><br>
                <a href ="recover.jsp">reset password<a/><br>
            <% } %>
            <a href ="index.jsp">back to home</a><br>
        </form>
    </body>
</html>
