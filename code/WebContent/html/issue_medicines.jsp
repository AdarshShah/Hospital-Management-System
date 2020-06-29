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

    <h2>Pharmacy</h2>
    	<h3 style="color:red"><%= request.getAttribute("message")==null?"":request.getAttribute("message") %></h3>
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
        	int patient_id = 10001;
        	ResultSet patient = DBConnection.searchPatient(patient_id);
        	request.setAttribute("patient_id",patient_id);
        	ResultSet stock = DBConnection.getMedicines();
        	ResultSet patMed = DBConnection.getIssuedMedicines(10001);
        	
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
		
    <h2>Medicines in Stock</h2>
    <table id="medicinestock">
        <tr>
            <th>Medicine</th>
            <th>Rate(in Rs)</th>
            <th>Quantity</th>
        </tr>
        <%
        	while(stock.next()){
        %>
        <tr>
            <td><%=stock.getString("medicine_name") %></td>
            <td><%=stock.getString("rate") %></td>
            <td><%=stock.getString("quantity_available") %></td>
        </tr>
        <% } %>
    </table>

    <h2>Medicines Issued</h2>
    <table id="medicineTable">
        <tr>
            <th>Medicine</th>
            <th>Quantity</th>
            <th>Rate(in Rs)</th>
            <th>Amount</th>
        </tr>
		<%
			while(patMed.next()){
		%>
		<tr>
			<td><%=patMed.getString("medicine_name") %></td>
			<td><%=patMed.getInt(2) %></td>
			<td><%=patMed.getInt(3) %></td>
			<td><%=patMed.getInt(4) %></td>
		</tr>
		
		<%} %>
        <tbody>
        </tbody>
        <tfoot>
            <tr>
            	<form method="post" action="/HospitalManagementSystem/Pharmacist">
                <td><input type="text" name="medicine" required></td>
                <td><input type="number" name="quantity" required></td>
                <td></td>
                <td></td>
                <td><button name="function" value="issue">Issue</button></td>
               	</form>
            </tr>
        </tfoot>
    </table>                                                            

</body>
</html>