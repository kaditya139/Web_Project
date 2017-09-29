<%@ page import = "java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>
        <h1>Update Student</h1>
        <%
            String attribute1 = new String();
            String value1 = new String();
            String attribute2 = new String();
            String value2 = new String();
            if (request.getParameter("choose1") != null){
                attribute1 = request.getParameter("choose1");
            }
            if (request.getParameter("value1") != null){
                value1 = request.getParameter("value1").toUpperCase().trim();
            }
            if (request.getParameter("choose2") != null){
                attribute2 = request.getParameter("choose2");
            }
            if (request.getParameter("value2") != null){
                value2 = request.getParameter("value2").toUpperCase().trim();
            }
            if(request.getParameter("update") != null) {
                Update update = new Update();
                int check = update.updateData(attribute1, value1, attribute2, value2);
                if(check != 0)
                    out.println("Row updated successfully");
                else
                    out.println("Row not found");
            }
            %>
        
        <%!
        class Update {
            public int updateData(String attribute1, String value1, String attribute2, String value2) {
                int check = 0;
                try{
                    Connection connect = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:orcl",
                                                "Aditya", "Aditya");
                    Statement statement = connect.createStatement();
                    check = statement.executeUpdate("Update Student set "+attribute2+" = '"+value2+"' "
                            + " where "+attribute1+" = '"+value1+"'");
                }
                catch (Exception e){
                    e.printStackTrace();
                }
                return check;
            }
        }
        %>
        
             
        <% if (request.getParameter("update") == null) { %>
            <form name="update" action="updateStudent.jsp" method="POST">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <td>Choose Attribute1</td>
                            <td><select name="choose1">
                                    <option>ExamID</option>
                                    <option>Name</option>
                                    <option>Department</option>
                                    <option>Semester</option>
                                    <option>Class</option>
                                    <option>Attended</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Choose value1</td>
                            <td><input type="text" name="value1" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Choose Attribute2</td>
                            <td><select name="choose2">
                                    <option>ExamID</option>
                                    <option>Name</option>
                                    <option>Department</option>
                                    <option>Semester</option>
                                    <option>Class</option>
                                    <option>Attended</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Choose value2</td>
                            <td><input type="text" name="value2" value="" size="20" /></td>
                        </tr>
                    </tbody>
                </table>
                <br><br>
                <div style="text-align:center">
                    <input type="reset" value="clear" name="clear" />
                    <input type="submit" value="update" name="update" />
                </div>
            </form>
        <% }

        if (request.getParameter("update") != null) { %>
            <br> <a href="updateStudent.jsp">update again</a>
        <% } %>
        
        <br> <a href="http://localhost:8080/project/index.jsp">back to home</a>
    </body>
</html>
