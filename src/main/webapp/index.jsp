<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assignment_6</title>
</head>
<body>
<table border="1">
    <tr>
        <td>stud_id</td>
        <td>stud_name</td>
        <td>class</td>
        <td>division</td>
        <td>city</td>
    </tr>
    <%
        ResultSet rs;
        try {
            String connectionURL = "jdbc:mysql://localhost:3306/assignment_6";

            Connection connection = null;

            rs = null;

            String stud_name = null;

            final String query = "select * from students_info";

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            try {
                connection = DriverManager.getConnection(connectionURL, "root", "Apple@5044");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            try {
                Statement stmt = connection.createStatement();
                rs = stmt.executeQuery(query);
                while (rs.next()) {
    %>
    <tr>
        <td><%=rs.getString("stud_id") %>
        </td>
        <td><%=rs.getString("stud_name") %>
        </td>
        <td><%=rs.getString("class") %>
        </td>
        <td><%=rs.getString("division") %>
        </td>
        <td><%=rs.getString("city") %>
        </td>
    </tr>
    <%
                }
                connection.close();


            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }


    %>
</table>
</body>
</html>
