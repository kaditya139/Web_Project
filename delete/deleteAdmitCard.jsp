<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <h1>Delete Admit Card</h1>
        <%
            String attribute = new String();
            String value = new String();
            if (request.getParameter("choose") != null){
                attribute = request.getParameter("choose");
            }
            if (request.getParameter("value") != null){
                value = request.getParameter("value").toUpperCase().trim();
            }
            if(request.getParameter("delete") != null) {
                Delete delete = new Delete();
                int check = delete.deleteData(attribute, value);
                if(check != 0)
                    out.println("Row deleted successfully");
                else
                    out.println("Row not found");
            }
            %>
        
        <%!
        class Delete {
            public int deleteData(String attribute, String value) {
                int check = 0;
                try{
                    Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connect.createStatement();
                    check = statement.executeUpdate("Delete from AdmitCard where "+attribute+" = '"+value+"'");
                }
                catch (Exception e){
                    e.printStackTrace();
                }
                return check;
            }
        }
        %>
        
             
        <% if (request.getParameter("delete") == null) { %>
            <form name="delete" action="deleteAdmitCard.jsp" method="POST">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <td>Choose Attribute</td>
                            <td><select name="choose">
                                    <option>ExamID</option>
                                    <option>Name</option>
                                    <option>RoomNo</option>
                                    <option>SeatNo</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Choose value</td>
                            <td><input type="text" name="value" value="" size="20" /></td>
                        </tr>
                    </tbody>
                </table>
                <br><br>
                <div style="text-align:center">
                    <input type="reset" value="clear" name="clear" />
                    <input type="submit" value="delete" name="delete" />
                </div>
            </form>
        <% }

        if (request.getParameter("delete") != null) { %>
            <br> <a href="deleteAdmitCard.jsp">delete again</a>
        <% } %>
        
        <br> <a href="http://localhost:8080/project/index.jsp">back to home</a>
    </body>
</html>
