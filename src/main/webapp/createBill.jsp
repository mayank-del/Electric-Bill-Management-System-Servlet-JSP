<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Bill</title>
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
        <h2>Create Bills</h2>
        <form id="complaint-form" action="UsersControllers" method="post">
        	<input type="hidden" name="func" value="createBill">
        	
            <div class="form-group">
                <label for="contact-person">Customer Id</label>
                <input type="text" id="cidCompReg" name="cid" value="" required>
            </div>
            <div class="form-group">
                <label for="contact-person">Month Year</label>
                <input type="text" id="monthYear" name="monthYear" required>
            </div>
            <div class="form-group">
                <label for="landmark">Amount</label>
                <input type="text" id="amount" name="amount" required>
            </div>
            
            
            <div class="button-group">
                <button type="submit">Submit</button>
            </div>
            
        </form>
    </div>
</div>
    <script >
  
		
		
		
    </script>
    <script src="admDashboard-script.js"></script>
</body>
</html>
