<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
    <link rel="stylesheet" href="dashboard-style.css">
</head>
<body>
<nav>
        <div class="logo">
          <h1>TATA</h1>
        </div>
        <ul>
        <li>
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="viewbills">
                <input id ="cidparaView" type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">View Bill</button>
            </form>
        </li>
        <li>
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="pastBill">
                 <input id ="cidparaPastView" type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">Past Bills</button>
            </form>
        </li>
        <!-- <li>
            <form action="UsersControllers" method="post">
                <input type="hidden" name="func" value="registerComplaint">
                <button class="nav-buttons" type="submit">Register Complaint</button>
            </form>
        </li>-->
        <li>

         <button class="nav-buttons" onclick="window.location.href='registerComplaint.jsp'">Register Complaint</button>
           
        </li>
        
        <li>
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="complainStatus">
                <input id ="cidStatus"type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">Complaint Status</button>
            </form>
        </li>
        
        <li>
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="viewPastComp">
                <input id ="cidPastCompStatus"type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">Complaint History</button>
            </form>
        </li>
        <li>
            
                <button class="nav-buttons" onclick="window.location.href='updateProfile.jsp'">Logout</button>
           
        </li>
        <li>
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="getcust">
                <input id ="cidpara"type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">Profile</button>
            </form>
        </li>
        
        
        
            
        </ul>
        <div class="user-info">
            <span id="customer-name"></span> | <span id="customer-id"></span>
        </div>
      </nav>
      <div class="content">
        <h2>Tata Electric</h2>
        <p>
          Tata Electrics Private Limited(TEPL), a greenfield venture of the Tata
          group, has expertise in manufacturing precision components.
        </p>
      </div>
      <script >
  
		const customerId=parseInt(localStorage.getItem('customerId'));
	  	document.getElementById("cidpara").value=customerId;
		document.getElementById("cidparaView").value=customerId;
		document.getElementById("cidparaPastView").value=customerId;
		document.getElementById("cidCompReg").value=customerId;
		document.getElementById("cidStatus").value=customerId;
		document.getElementById("cidPastCompStatus").value=customerId;
		
		
    </script>
     
		<script src="dashboard-script.js"></script>
		
		</body>
</html>