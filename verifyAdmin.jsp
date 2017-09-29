<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Verification</title>
    </head>
    <body>
        <h1 align="center">Administrator Log In</h1>
        <%
            int admin = 0;
            String username = new String();
            String password = new String();
            username = request.getParameter("username");
            password = request.getParameter("password");
            
            if (username == null || password == null) {
                //out.print ("Invalid Parameter");
            }
            
            else if (username.toLowerCase().trim().equals("user") &&
                    password.equals("admin")) {
                        admin = 1;
            }
            else {
                out.print ("Access unauthorized");
            }
            %>
            
        <% if (request.getParameter("submit") == null) { %>
            <form name="verifyAdmin" action="verifyAdmin.jsp" method="POST">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <td><input type="text" name="username" value="" placeholder="AdminID" size="30" /></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="password" value="" placeholder="Password" size="30" /></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <div style="text-align: center">
                    <input type="submit" style="background-color: #0000ff; color: #ffffff;" value="LOGIN" name="submit" />
                </div>
            </form>
        <% } %>
        <% if (admin == 1) {
            response.sendRedirect("admin.jsp");
        } %>
    </body>
</html>
