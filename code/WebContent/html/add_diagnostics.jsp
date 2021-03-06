<%@page import="dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Hospital Management System</title>
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
				<form action="/HospitalManagementSystem/html/search_diagnostic.jsp" method="post"><button type="Submit" id="func1" class="btn"> To Search</button></form>
			</li>

		</ul>
		
	</div>
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
                <form action="/HospitalManagementSystem/html/search_patient.jsp" method="post"><button type="Submit" id="func1" class="btn"> To Search</button></form>
            </li>
        </ul> 
    </div>
<div class="reg-tab">
    <h2 align="center"><font><strong>Diagnostics</strong></font></h2>
    <table class="table1">
        <tr>
            <td class="td">Patient Id</td>
            <td class="td">Name</td>
            <td class="td">Age</td>
            <td class="td">Address</td>
            <td class="td">DOJ</td>
            <td class="td">Type of Room</td>
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
</div>
<div class="reg-tab">
    <h2 align="center"><font><strong>Diagnostics Available</strong></font></h2>
    <table id="availableDiagnostics" class="table2">
        <tr>
            <td class="td">Name of test</td>
            <td class="td">Amount(in Rs.)</td>
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
</div>
<div class="reg-tab">
    <h2 align="center"><font><strong>Diagnostics Conducted</strong></font></h2>
    <table id="testTable" class="table2">
        <tr>
            <td class="td">Name of test</td>
            <td class="td">Amount(in Rs.)</td>
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
                <td id="issue-btn"><button name="function" value="issue" class="btn">Issue</button></td>
                </form>
            </tr>
        </tfoot>
    </table>                                             
    <br><br>
</div>            
</body>
</html>