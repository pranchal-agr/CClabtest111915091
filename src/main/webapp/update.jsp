<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String mis = request.getParameter("mis");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "employees";
String userid = "root";
String password = "Aman@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from employee where mis="+mis;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<h1>Update data from database Except MIS no:</h1>
<form method="post" action="update-process.jsp">
<input type="hidden" name="mis" value="<%=resultSet.getString("mis") %>">
MIS:<br>
<input type="text" name="mis" value="<%=resultSet.getString("mis") %>">
<br>
First name:<br>
<input type="text" name="first" value="<%=resultSet.getString("first") %>">
<br>
Last name:<br>
<input type="text" name="last" value="<%=resultSet.getString("last") %>">
<br>
Date Of Birth:<br>
<input type="text" name="birth" value="<%=resultSet.getString("birth") %>">
<br>
Contact:<br>
<input type="text" name="contact" value="<%=resultSet.getString("contact") %>">
<br>
Job Role:<br>
<input type="text" name="jobrole" value="<%=resultSet.getString("jobrole") %>">
<br>
Yearly Bonus:<br>
<input type="text" name="bonus" value="<%=resultSet.getString("bonus") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>