<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Complaint</title>
    <link rel="stylesheet" href="registerComplaint.css">
</head>
<body>
    
    <nav>
        <div class="logo">
          <h1>TATA</h1>
        </div>
        <ul>
        <li>

         <button class="nav-buttons" onclick="callHome()">Home</button>
           
        </li>
        <li>
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="viewbills">
                <input id ="cidparaView"type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">View Bill</button>
            </form>
        </li>
        <li>
            <form action="UsersControllers" method="get">
                <input type="hidden" name="action" value="pastBill">
                <button class="nav-buttons" type="submit">Past Bills</button>
            </form>
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
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="getcust">
                <input id ="cidpara"type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">Profile</button>
            </form>
        </li>
        
        <li>
            
                <button class="nav-buttons" onclick="window.location.href='updateProfile.jsp'">Logout</button>
           
        </li>
        
        </ul>
        <div  style="color:white;"class="user-info">
            <span id="customer-name"></span> | <span id="customer-id"></span>
        </div>
      </nav>
    <div style="display: flex; width: 100%; align-items: center; justify-content: center; margin-top: 10px;">
    <div  class="signup-card">
        <h2>Register Complaint/Service</h2>
        <form id="complaint-form" action="UsersControllers" method="post">
        	<input type="hidden" name="func" value="registerComp">
        	<input type="hidden" id="cidCompReg" name="customer_Id" value="">
            <div class="form-group">
            	
                <label for="complaint-type">Complaint/Service Type</label>
                <select id="complaint-type" name="complaint-type" required>
                    <option value="Billing Related">Billing Related</option>
                    <option value="Voltage Related">Voltage Related</option>
                    <option value="Frequent Disruption">Frequent Disruption</option>
                    <option value="Street Light Related">Street Light Related</option>
                    <option value="Pole Related">Pole Related</option>
                </select>
            </div>
            <div class="form-group">
                <label for="contact-person">Contact Person</label>
                <input type="text" id="contact-person" name="contact-person" required>
            </div>
            <div class="form-group">
                <label for="landmark">Landmark</label>
                <input type="text" id="landmark" name="landmark" required>
            </div>
            <div class="form-group">
                <label for="consumer-no">Consumer No</label>
                <input type="text" id="consumer-no" name="consumer-no" maxlength="13" required>
            </div>
            <div class="form-group">
                <label for="problem-description">Problem Description</label>
                <textarea id="problem-description" name="problem-description" required></textarea>
            </div>
            <div class="form-group">
                <label for="mobile-number">Mobile Number</label>
                <input type="tel" id="mobile-number" name="mobile-number" maxlength="10" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" required></textarea>
            </div>
            <div class="button-group">
                <button type="submit">Submit</button>
            </div>
            
        </form>
    </div>
</div>
    <script >
  
		const customerId=localStorage.getItem('customerId');
	  	document.getElementById("cidpara").value=customerId;
		document.getElementById("cidparaView").value=customerId;
		document.getElementById("cidparaPastView").value=customerId;
		document.getElementById("cidCompReg").value=customerId;
		document.getElementById("cidStatus").value=customerId;
		document.getElementById("cidPastCompStatus").value=customerId;
		
		
    </script>
    <script type="text/javascript" src="dashboard-script.js"></script>
</body>
</html>
