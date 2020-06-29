<%@page import="dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Hospital Management System</title>
<link rel="stylesheet" type="text/css" href="/HospitalManagementSystem/css/style.css">

</head>
<body>
	<div class="head">
		<h1>Hospital Management System</h1>
	</div>

    <h2>Diagnostics</h2>
    <table>
        <tr>
            <th>Patient Id</th>
            <th>Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>DOJ</th>
            <th>Type of Room</th>
        </tr>
        <%
        	int patient_id = request.getAttribute("patient_id")==null?10001:(Integer)request.getAttribute("patient_id");
        	ResultSet patient = DBConnection.searchPatient(patient_id);
        	request.setAttribute("patient_id",patient_id);
        	ResultSet stock = DBConnection.getDiagnostics(patient_id);
        	ResultSet patMed = DBConnection.getIssuedDiagnostics(patient_id);
        	
        	if(patient.next()){
        %>
        <tr>
            <td><%=patient.getInt(1) %></td>
            <td><%=patient.getString(2) %></td>
            <td><%=patient.getInt(6) %></td>
            <td><%=patient.getString(3) %></td>
            <td><%=patient.getString(7) %></td>
            <td><%=patient.getString(8) %></td>
        </tr>
        <%} %>
    </table>

    <h2>Diagnostics Available</h2>
    <table id="availableDiagnostics">
        <tr>
            <th>Name of test</th>
            <th>Amount(in Rs.)</th>
        </tr>
        <%
        	while(stock.next()){
        %>
        <tr>
            <td><%=stock.getString("test_name") %></td>
            <td><%=stock.getInt("rate") %></td>
        </tr>
        <% } %>    
        </table>

    <!-- <button class="button1">Add Diagnostics</button> -->

    <h2>Diagnostics Conducted</h2>
    <table id="testTable">
        <tr>
            <th>Name of test</th>
            <th>Amount(in Rs.)</th>
        </tr>
		<%
			while(patMed.next()){
		%>
		<tr>
			<td><%=patMed.getString("test_name") %></td>
			<td><%=patMed.getInt("rate") %></td>
		</tr>
		
		<%} %>
        <tbody>
        </tbody>

        <tfoot>
            <tr>
            	<form method="post" action="/HospitalManagementSystem/Diagnostic">
                <td><input type="text" name="test"></td>
                <td></td>
                <td><button name="function" value="issue">Issue</button></td>
                </form>
            </tr>
        </tfoot>
    </table>                                                            
</body>
</html>