<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Create Patient</title>
	<link rel="stylesheet" type="text/css" href="../CSS/create_patient.css">
</head>
<body>
	<div class="head">
		<h1>Hospital Management System</h1>
		<ul class="select-menu">
			<li>
				<select>
					<option value="patient">Patient</option>
				</select>
			</li>

			<li>
				<select>
					<option value="pharmacy">Pharmacy</option>
				</select>
			</li>

			<li>
				<select>
					<option value="diagnostics">Diagnostics</option>
				</select>
			</li>
		</ul>
	</div>
	<form class="reg-tab" action="<%= request.getContextPath()%>/register_patient" method="post">
		<table>
			<thead>
					<tr>
						<th><h2> Patient Registration </h2></th>
					<tr>
			</thead>
			<tbody>
				<tr>
					<td>Patient SSN ID<sup>*</sup>:</td>
					<td><input type="text" name="ssn_id"  required /></td>
				</tr>
				<tr>
					<td>Patient Name<sup>*</sup>: </td>
					<td><input type="text" name="patient_name"  required /></td>
				</tr>
				<tr>
					<td>Patient Age<sup>*</sup>: </td>
					<td><input type="number" name="patient_age"  required /></td>
				</tr>
				<tr>
					<td>Date of Admission<sup>*</sup>:</td>
					<td><input type="Date" name="date_admission" required /></td>
				</tr>
				<tr>
					<td>Type of Bed<sup>*</sup>:</td>
					<td>
						<select name="beds">
							<option disabled selected>Select..</option>
							<option value="general_ward">General Ward</option>
							<option value="semi_sharing">Semi Sharing</option>
							<option value="single_room">Single Room</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>Address<sup>*</sup>: </td>
					<td><textarea name="address" rows="4" cols="30" required></textarea></td>
				</tr>

				<tr>
					<td>State<sup>*</sup>:</td>
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
					<td>City<sup>*</sup>: </td>
					<td>
						<select name="City">
							<option disabled selected>Select..</option>
							<option value="general_ward">General Ward</option>
							<option value="semi_sharing">Semi Sharing</option>
							<option value="single_room">Single Room</option>
						</select>
					</td>
				</tr>

			</tbody>
		</table>
		<button class="btn" type="Submit">Submit</button>
		<button class="btn" type="Reset">Reset</button><br>
			
	</form>
	


</body>
</html>