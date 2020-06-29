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
    <table>
        <tr>
            <th>Patient Id</th>
            <th>Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>DOJ</th>
            <th>Type of Room</th>
        </tr>
        <tr>
            <td>1234</td>
            <td>Joseph</td>
            <td>56</td>
            <td>Rick Street</td>
            <td>03-May-2020</td>
            <td>Single</td>
        </tr>
    </table>

    <h2>Medicines in Stock</h2>
    <table id="medicinestock">
        <tr>
            <th>Medicine</th>
            <th>Quantity</th>
            <th>Rate(in Rs)</th>
            <th>Amount</th>

        </tr>
        <tr>
            <td>Acebutol</td>
            <td>10</td>
            <td>55</td>
            <td>550</td>
        </tr>
    </table>

    <h2>Medicines Issued</h2>
    <table id="medicineTable">
        <tr>
            <th>Medicine</th>
            <th>Quantity</th>
            <th>Rate(in Rs)</th>
            <th>Amount</th>
        </tr>

        <tbody>
        </tbody>
        <tfoot>
            <tr>
                <td><input type="text" id="medicine"></td>
                <td><input type="number" id="quantity"></td>
                <td></td>
                <td></td>
                <td><input type="button" onclick="Add()" value="Add" /></td>
            </tr>
        </tfoot>
    </table>                                                            

</body>
<script>
    function Add() {
        // Fetching the elements to insert in a new row
        var medicine = document.getElementById("medicine");
        var quantity = document.getElementById("quantity");

        //used to check whether medicine is in stock or not or whether the medicine is available
        let isvalid = false;

        // New Row will only be added if the input is not null
        if((medicine.value !== "" || quantity.value !== "")){
        
        var table = document.getElementById('medicinestock');

        for (i = 1; i < table.rows.length; i++) {
            var objCells = table.rows.item(i).cells;

            medicineNameInDatabase = objCells.item(0).innerHTML;
            availableQuantity = Number(objCells.item(1).innerHTML);
            rate = Number(objCells.item(2).innerHTML);

            if(medicine.value == medicineNameInDatabase && Number(quantity.value)<=availableQuantity){
                console.log("Hey")
                AddRow(medicine.value, quantity.value, rate, quantity.value*rate);
                isvalid = true
                break;
            }
            
        }
        if(isvalid == false){
            alert("Selected medicine is currently out of stock");
        }

        // Resetting the input box to null values
        medicine.value = "";
        quantity.value = "";

    }
    };


    function AddRow(medicine, quantity, rate, amount) {

        var tBody = document.getElementById("medicineTable").getElementsByTagName("tbody")[0];
        row = tBody.insertRow(-1);

        var cell = row.insertCell(-1);
        cell.innerHTML = medicine;

        cell = row.insertCell(-1);
        cell.innerHTML = quantity;

        cell = row.insertCell(-1);
        cell.innerHTML = rate;

        cell = row.insertCell(-1);
        cell.innerHTML = amount;
    }
</script>
</html>