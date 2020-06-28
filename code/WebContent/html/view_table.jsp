<%@page import="dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
	<title>Create Patient</title>
	<link rel="stylesheet" type="text/css" href="/HospitalManagementSystem/css/view_table.css">
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
			<li>
				<form action="/HospitalManagementSystem/html/update_patient.jsp" method="post"><button type="Submit" id="func1" class="btn"> To Update</button></form>
			</li>
			<li>
				<form action="/HospitalManagementSystem/html/delete_patient.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Delete</button></form>
			</li>
			<li>
				<form action="/HospitalManagementSystem/html/create_patient.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Create</button></form>
			</li>
		</ul>
	</div>
	<form class="reg-tab" action="/HospitalManagementSystem/html/search_patient.jsp" method="post">
		<h2> View Patients </h2>
		<table>
			<tr class="tab">
				<td><h4>Patient Id</h4> </td>
				<td><h4> Name</h4></td>
				<td><h4> Age</h4></td>
				<td><h4> Address</h4></td>
				<td><h4> DOJ</h4></td>
				<td><h4> Type of room</h4></td>
			</tr>
				<% 
				ResultSet rs = DBConnection.getAllPatients();
				while(rs.next()){
				%>
			<tr class="tab">
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getInt(6) %></td>
				<td><%= rs.getString(3)+", "+ rs.getString("city")+","+rs.getString("state") %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(8) %></td>
			</tr>
				<% }; %>
		</table>
		<button class="btn" type="Submit">Done</button>
	</form>

</body>
</html>