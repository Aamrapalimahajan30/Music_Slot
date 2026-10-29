<%@ page import="java.sql.*" %>
<html>
    <head>
        <style>
            body{
                font-family: Arial;
                background-color: lightblue;
            }
            h2{
                text-align: center;
                color: darkblue;
            }
            table{
                margin: auto;
                width : 80%;
                border-collapse: collapse;
                background-color: white;
            }
            th{
                background-color: darkblue;
                color: white;
                padding: 10px;
            }
            td{
                padding: 10px;
                text-align: center;
                border:1px solid #888;
            }
        </style>
    </head>
<body>
<%
    String student = request.getParameter("student");
    String instrument = request.getParameter("instrument");
    String day = request.getParameter("day");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicDB", "root", "Aachu30@");
        PreparedStatement ps = con.prepareStatement("INSERT INTO music_slot (student, instrument, day) VALUES (?, ?, ?)");
        ps.setString(1, student);
        ps.setString(2, instrument);
        ps.setString(3, day);
        ps.executeUpdate();
%>
<h2>Saved! Music Class Slot Records</h2>
<table>
    <tr>
        <th>Student</th>
        <th>Instrument</th>
        <th>Day</th>
    </tr>
<%
    Statement st = con.createStatement(); 
    ResultSet rs = st.executeQuery("SELECT * FROM music_slot");
    while(rs.next()){
%>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString("student") %></td>
        <td><%= rs.getString("instrument") %></td>
        <td><%= rs.getString("day") %></td>
    </tr>
<%} con.close(); %>
</table>
<p text-align="center"><a href="index.html">Add Another City</a></p>

</body>
</html>
