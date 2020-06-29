<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
                <form action="/HospitalManagementSystem/html/create_patient.jsp" method="post"><button type="Submit" id="func1" class="btn"> To Register</button></form>
            </li>
            <li>
                <form action="/HospitalManagementSystem/html/update_patient.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Update</button></form>
            </li>
            <li>
                <form action="/HospitalManagementSystem/html/delete_patient.jsp" method="post"><button type="Submit" id="func2" class=" btn"> To Delete</button></form>
            </li>
            <li>
                <form action="/HospitalManagementSystem/html/delete_patient.jsp" method="post"><button type="Submit" id="func2" class=" btn"> View All</button></form>
            </li>
        </ul>
    </div>
<div class="reg-tab">
    <h2 align="center"><font><strong>Patient Billing</strong></font></h2>
    <table class="table1">
        <tr>
            <td class="td">Patient Id</td>
            <td class="td">Name</td>
            <td class="td">Age</td>
            <td class="td">Address</td>
            <td class="td">DOJ</td>
            <td class="td">Date of Discharge</td>
            <td class="td">Type of Room</td>
        </tr>
            
         <%
         	ResultSet patient = (ResultSet)request.getAttribute("patient");
         	ResultSet patMed = (ResultSet)request.getAttribute("medicines");
         	ResultSet test = (ResultSet)request.getAttribute("tests");
         	
         	if(patient.next()){
                %>
                <tr>
                    <td><%=patient.getInt(1) %></td>
                    <td><%=patient.getString(2) %></td>
                    <td><%=patient.getInt(6) %></td>
                    <td><%=patient.getString(3) %></td>
                    <td><%=patient.getString(7) %></td>
                    <td><%=new Date().toString() %></td>
                    <td><%=patient.getString(8) %></td>
                </tr>
                <%} %>
    </table>
    <%
    	String date = patient.getString(7);
    	int year = Integer.parseInt(date.substring(0,4));
    	int mon = Integer.parseInt(date.substring(5,7));
    	int day = Integer.parseInt(date.substring(8));
    	LocalDate begin = LocalDate.of(year,mon,day);
    	LocalDate today = LocalDate.now();
    	
    	Period p = Period.between(today, begin);
    	
    	long days = -1*p.getDays();
    	
    	long amount=0;
    	switch(patient.getString(8)){
    	case "general": amount=days*2000; break;
    	case "semi": amount=days*4000; break;
    	case "single": amount=days*8000; break;
    	}
    %>
     <div class="bill-gen">
        <b>No. of days: </b><span><%=days %></span>
        <b> Bill for room: </b><span> Rs. <%=amount %></span>
    </div>
    <br>
</div>
<div class="reg-tab">
    <h2 align="center"><font><strong>Pharmacy Charges</strong></font></h2>
    <table class="table2">
        <tr>
            <td class="td">Medicine</td>
            <td class="td">Quantity</td>
            <td class="td">Rate(in Rs.)</td>
            <td class="td">Amount(in Rs.)</td>
        </tr>
       <%
       		long amountMed =0;
			while(patMed.next()){
				
				amountMed+=patMed.getInt(4);
		%>
		<tr>
			<td><%=patMed.getString("medicine_name") %></td>
			<td><%=patMed.getInt(2) %></td>
			<td><%=patMed.getInt(3) %></td>
			<td><%=patMed.getInt(4) %></td>
		</tr>
		
		<%} %>
    </table>
    <div class="bill-gen">
        <b>Bill for Pharmacy: </b><span><%=amountMed %></span>
    </div>
    <br>
</div>
<div class="reg-tab">
    <h2 align="center"><font><strong>Diagnostics Charges</strong></font></h2>
    <table class="table3">
        <tr>
            <td class="td">Name of test</td>
            <td class="td">Amount(in Rs.)</td>
        </tr>
        <%
        	long testAmt=0;
			while(test.next()){
				
				testAmt+=test.getInt("rate");
		%>
		<tr>
			<td><%=test.getString("test_name") %></td>
			<td><%=test.getInt("rate") %></td>
		</tr>
		
		<%} %>
    </table>
    <div class="bill-gen">
        <b>Bill for Diagnostics: </b><span><%=testAmt %></span>
    </div>
    <br>                                               
    <div>    
        <button class="btn">Confirm</button>
        <b>Grand Total:</b> <span>Rs <%=amount+testAmt+amountMed %></span>
    </div>
</div>
</body>
</html>
