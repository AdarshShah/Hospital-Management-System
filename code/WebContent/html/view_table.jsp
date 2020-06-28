<%@page import="dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Create Patient</title>
	<link rel="stylesheet" type="text/css" href="../css/view_table.css">
</head>
<body>
	<div class="head">
		<h1>Hospital Management System</h1>
		<ul >
			<li>
				<select class="select-menu">
					<option value="patient">Patient</option>
				</select>
			</li>

			<li>
				<select class="select-menu">
					<option value="pharmacy">Pharmacy</option>
				</select>
			</li>

			<li>
				<select class="select-menu">
					<option value="diagnostics">Diagnostics</option>
				</select>
			</li>
	</ul>
	</div>
<h2 align="center"><font><strong>View Patients</strong></font></h2>
<table align="center" border="1">
<tr> 
<td> patient Id</td>
<td> Name</td>
<td> Age</td>
<td> Address</td>
<td> DOJ</td>
<td> type of room</td>
</tr>
<% 
	ResultSet rs = DBConnection.getAllPatients();
	while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getInt(6) %></td>
<td><%= rs.getString(3)+", "+ rs.getString("city")+","+rs.getString("state") %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
</tr>
<% }; %>
</table>