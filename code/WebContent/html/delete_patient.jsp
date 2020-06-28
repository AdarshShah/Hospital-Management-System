<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Delete Patient</title>
	<link rel="stylesheet" type="text/css" href="../css/create_patient.css">
</head>
<body>
	<div class="head">
		<h1>Hospital Management System</h1>s
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
				<form action="create_patient.jsp" method="post"><button type="Submit" id="func1" class="btn"> To Register</button></form>
			</li>
			<li>
				<form action="update_patient.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Update</button></form>
			</li>


		</ul>
	</div>
	<h3 style="color:red"><%= request.getAttribute("message")==null?"":request.getAttribute("message") %></h3>
	<form class="reg-tab" action="<%= request.getContextPath()%>/delete_patient" method="post">
		<table>
			<thead>
					<th colspan="2"><h2>Delete Patient </h2></th>
			</thead>
			<tbody>
				<tr>
					<td>Patient ID<sup>*</sup>:</td>
					<td><input type="text" name="ssn_id"  required /><button class="getbtn btn">Get</button></td>
				</tr>
				<tr>
					<td>Patient Name: </td>
					<td><input type="text" name="patient_name"   /></td>
				</tr>
				<tr>
					<td>Patient Age: </td>
					<td><input type="number" name="patient_age" /></td>
				</tr>
				<tr>
					<td>Date of Admission:</td>
					<td><input type="Date" name="date_admission" required /></td>
				</tr>
				<tr>
					<td>Type of Bed:</td>
					<td>
						<select name="beds">
							<option disabled selected>Select..</option>
							<option value="general">General Ward</option>
							<option value="semi">Semi Sharing</option>
							<option value="single">Single Room</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>Address: </td>
					<td><textarea name="address" rows="4" cols="30" ></textarea></td>
				</tr>

				<tr>
					<td>State:</td>
					<td>
						<select name="State">
							<option disabled selected>Select..</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Kerala">Kerala</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>City: </td>
					<td><input type="text" name="city"   /></td>
				</tr>

			</tbody>
		</table>
		<input type="hidden" value="create" name="function">
		<button class="btn" type="Submit">Delete</button>
		<button class="btn" type="Reset">Reset</button><br>
	</form>
</body>
</html>