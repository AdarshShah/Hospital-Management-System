<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Delete Patient</title>
	<link rel="stylesheet" type="text/css" href="/HospitalManagementSystem/css/create_patient.css">
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
				<form action="/HospitalManagementSystem/html/patient_search.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Search</button></form>
			</li>
			<li>
				<form action="/HospitalManagementSystem/html/view_table.jsp" method="post"><button type="Submit" id="func2" class=" btn"> View All</button></form>
			</li>

		</ul>
	</div>
	<h3 style="color:red"><%= request.getAttribute("message")==null?"":request.getAttribute("message") %></h3>
	<form class="reg-tab" action="/HospitalManagementSystem/Administrator" method="post">
		
		<% 	
		int patient_id=0; String patient_name="", address="", city="", state="";
		int age=0;
		String date_of_joining="";
		
		ResultSet rs = (ResultSet)request.getAttribute("patient");
		String room_type="";
			if(rs!=null){
				patient_id = rs.getInt(1);
				patient_name = rs.getString(2);
				age = rs.getInt(6);
				date_of_joining =  rs.getString(7);
				room_type =  rs.getString(8);
				address = rs.getString(3);
				state = rs.getString("state");
				city = rs.getString("city");
			}%>
		
		<table>
			<thead>
					<th colspan="2"><h2>Delete Patient </h2></th>
			</thead>
			<tbody>
				<tr>
					<td>Patient ID<sup>*</sup>:</td>
					<td><input type="text" name="ssn_id" value="<%=patient_id %>" required /> <button class="getbtn btn" name="get" value="get">Get</button></td>
				</tr>
				<tr>
					<td>Patient Name: </td>
					<td><input type="text" name="patient_name"  value="<%=patient_name %>" /></td>
				</tr>
				<tr>
					<td>Patient Age: </td>
					<td><input type="number" name="patient_age" value="<%=age %>"/></td>
				</tr>
				<tr>
					<td>Date of Admission:</td>
					<td><input type="Date" name="date_admission" value="<%=date_of_joining %>" /></td>
				</tr>
				<tr>
					<td>Type of Bed:</td>
					<td>
						<select name="beds">
							<option disabled selected>Select..</option>
							<option value="general" <%=room_type.equals("general")?"selected":"" %>>General Ward</option>
							<option value="semi" <%=room_type.equals("semi")?"selected":"" %>>Semi Sharing</option>
							<option value="single" <%=room_type.equals("single")?"selected":"" %>>Single Room</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>Address: </td>
					<td><textarea name="address" rows="4" cols="30" ><%=address %></textarea></td>
				</tr>

				<tr>
					<td>State:</td>
					<td>
						<select name="State">
							<option disabled selected>Select..</option>
							<option value="Gujarat" <%=state.equals("Gujarat")?"selected":"" %>>Gujarat</option>
							<option value="Maharashtra" <%=state.equals("Maharashtra")?"selected":"" %>>Maharashtra</option>
							<option value="Kerala" <%=state.equals("Kerela")?"selected":"" %>>Kerala</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>City: </td>
					<td><input type="text" name="city"  value="<%=city %>" /></td>
				</tr>

			</tbody>
		</table>
		<input type="hidden" value="delete" name="function">
		<button class="btn" type="Submit" name="delete" value="delete">Delete</button>
		<button class="btn" type="Reset">Reset</button><br>
	</form>
</body>
</html>