<%@page import="dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
	<title>View All Patient</title>
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
				<form action="/HospitalManagementSystem/html/create_patient.jsp" method="post"><button type="Submit" id="func1" class="btn"> To Register</button></form>
			</li>
			<li>
				<form action="/HospitalManagementSystem/html/update_patient.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Update</button></form>
			</li>
			<li>
				<form action="/HospitalManagementSystem/html/delete_patient.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Delete</button></form>
			</li>
			<li>
				<form action="/HospitalManagementSystem/html/patient_search.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Search</button></form>
			</li>
			
		</ul>
	</div>
	<form class="reg-tab" action="/HospitalManagementSystem/html/patient_search.jsp" method="post">
<h2 align="center"><font><strong>View Patients</strong></font></h2>
<table class="table1">
	<tr> 
		<td class="td"> Patient Id</td>
		<td class="td"> Name</td>
		<td class="td"> Age</td>
		<td class="td"> Address</td>
		<td class="td"> DOJ</td>
		<td class="td"> Type of room</td>
	</tr>
		<% 
				ResultSet rs = DBConnection.getAllPatients();
				while(rs.next()){
				%>
	<tr>
		<td ><%=rs.getInt(1) %></td>
		<td ><%=rs.getString(2) %></td>
		<td ><%=rs.getInt(6) %></td>
		<td ><%= rs.getString(3)+", "+ rs.getString("city")+","+rs.getString("state") %></td>
		<td ><%=rs.getString(7) %></td>
		<td ><%=rs.getString(8) %></td>
	</tr>
		<% }; %>

</table>
<button class="btn" type="Submit">Done</button>
	</form>
</body>
</html>