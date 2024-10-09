<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
        
         
        <!-- <li>
            <form action="UsersControllers" method="post">
                <input type="hidden" name="func" value="registerComplaint">
                <button class="nav-buttons" type="submit">Register Complaint</button>
            </form>
        </li>-->
        <li>

         <button class="nav-buttons" onclick="window.location.href='createBill.jsp'">Create Bill</button>
           
        </li>
        
        <li>
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="getAllPendingComp">
                
               <button class="nav-buttons" type="submit">Update Complain Status</button>
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
     
		<script src="admDashboard-script.js"></script>
		
		</body>
</html>