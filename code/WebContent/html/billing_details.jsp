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
            
        <tr>
            <td>1234</td>
            <td>Joseph</td>
            <td>56</td>
            <td>Rick Street</td>
            <td>03-May-2020</td>
            <td>10-May-2020</td>
            <td>Single</td>
        </tr>
    </table>
     <div class="bill-gen">
        <b>No. of days: </b><span> 7</span>
        <b> Bill for room: </b><span> Rs. 56000</span>
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
        <tr>
            <td>Acebutol</td>
            <td>10</td>
            <td>55</td>
            <td>550</td>
        </tr>
    </table>
    <div class="bill-gen">
        <b>Bill for Pharmacy: </b><span> Rs.4500</span>
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
        <tr>
            <td>CBP</td>
            <td>2000</td>
        </tr>
    </table>
    <div class="bill-gen">
        <b>Bill for Diagnostics: </b><span> Rs.10500</span>
    </div>
    <br>                                               
    <div>    
        <button class="btn">Confirm</button>
        <b>Grand Total:</b> <span>Rs 71000</span>
    </div>
</div>
</body>
</html>
