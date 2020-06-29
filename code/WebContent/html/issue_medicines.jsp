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
                <form action="/HospitalManagementSystem/html/search_patient.jsp" method="post"><button type="Submit" id="func1" class="btn"> To Search</button></form>
            </li>
            
    </div>
<div class="reg-tab">
    <h2 align="center"><font><strong>Pharmacy</strong></font></h2>
        <h3 style="color:red"><%= request.getAttribute("message")==null?"":request.getAttribute("message") %></h3>
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
            ResultSet stock = DBConnection.getMedicines();
            ResultSet patMed = DBConnection.getIssuedMedicines(patient_id);
            
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
    <h2 align="center"><font><strong>Medicines in Stock</strong></font></h2>
    <table id="medicinestock" class="table2">
        <tr>
            <td class="td">Medicine</td>
            <td class="td">Rate(in Rs)</td>
            <td class="td">Quantity</td>
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
</div>
<div class="reg-tab">
    <h2 align="center"><font><strong>Medicines Issued</strong></font></h2>
    <table id="medicineTable" class="table2">
        <tr>
            <td class="td">Medicine</td>
            <td class="td">Quantity</td>
            <td class="td">Rate(in Rs)</td>
            <td class="td">Amount</td>
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
                <td id="issue-btn"><button name="function" value="issue"  class="btn">Issue</button></td>
                </form>
            </tr>
        </tfoot>
    </table>
    <br><br>
</div>  

</body>
</html>