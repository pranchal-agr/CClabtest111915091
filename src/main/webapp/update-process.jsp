<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/employees";%>
<%!String user = "root";%>
<%!String psw = "Aman@123";%>
<%
String mis = request.getParameter("mis");
String first=request.getParameter("first");
String last=request.getParameter("last");
String birth=request.getParameter("birth");
String contact=request.getParameter("contact");
String jobrole=request.getParameter("jobrole");
String bonus=request.getParameter("bonus");
if(mis != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(mis);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update employee set mis=?,first=?,last=?,birth=?,contact=?,jobrole=?,bonus=? where mis="+mis;
ps = con.prepareStatement(sql);
ps.setString(1,mis);
ps.setString(2, first);
ps.setString(3, last);
ps.setString(4, birth);
ps.setString(5, contact);
ps.setString(6, jobrole);
ps.setString(7, bonus);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<a href="report.jsp">Report Page</a>
</body>
</html>