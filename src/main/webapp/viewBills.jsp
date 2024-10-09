<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.users.Bill" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bills</title>
        <link rel="stylesheet" href="dashboard-style.css">
    <style>
        body {
	  margin: 0;
	  padding: 0;
	  font-family: Arial, sans-serif;
	  background-image: url('https://msl-ltd.co.uk/wp-content/uploads/2020/04/Energy-Management.jpg');
	    background-size: cover;
	    background-position: center;
	  /* background: linear-gradient(135deg, #2a2b38, #52545c); */
	  height: 100vh;
	}
        .container {
        margin-top:20px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .card {
             background: rgba( 255, 255, 255, 0.25 );
	box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
	backdrop-filter: blur( 4px );
-	webkit-backdrop-filter: blur( 4px );
	border-radius: 10px;
	border: 1px solid rgba( 255, 255, 255, 0.18 );
  			width: 280px;
  			height:250px;
            padding: 20px;
            text-align: center;
            position: relative;
        }
        .card h3 {
            margin: 0;
            font-size: 1.5rem;
            color: white;
        }
        .card p {
            color: white;
            font-size: 1rem;
        }
        .card .amount {
            font-size: 1.2rem;
            color: white;
            margin-bottom: 15px;
        }
        .card .status {
            font-size: 1rem;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .card .status.unpaid {
            color: #dc3545;
        }
         .card .status.paid {
            color: lightgreen;
        }
        .pay-btn {
            	width: 40%;
			  padding: 10px;
			  background-color: #4d7f86;
			  border: none;
			  color:white;
			  border-radius: 5px;
			  cursor: pointer;
			  font-size: 16px;
			text-decoration: none;
        }
        .pay-btn:hover {
  			background-color: #3e676d;
        }
    </style>
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
                <input type="hidden" name="func" value="pastBill">
                 <input id ="cidparaPastView" type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">Past Bills</button>
            </form>
        </li>
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
            <form action="UsersControllers" method="get">
                <input type="hidden" name="func" value="getcust">
                <input id ="cidpara"type="hidden" name="custId" value="">
                <button class="nav-buttons" type="submit">Profile</button>
            </form>
        </li>
        <li>
            
                <button class="nav-buttons" onclick="window.location.href='updateProfile.jsp'">Logout</button>
           
        </li>
            
          <!--  <li><a onclick="callbill()">View Bill</a></li>
            <li><a onclick="callcomp()">Register Complaint</a></li>
            <li><a onclick="compstatus()">Complaint Status</a></li>
            <li><a onclick="pastcomp()">Complaint History</a></li>  -->
        </ul>
        <div class="user-info">
            <span id="customer-name"></span> | <span id="customer-id"></span>
        </div>
      </nav>

    <div class="container">
        <%
            // Retrieve the list of bills from the request scope
            ArrayList<Bill> billList = (ArrayList<Bill>) request.getAttribute("billList");
            
            if (billList != null && !billList.isEmpty()) {
                for (Bill bill : billList) {
        %>
            <div class="card">
                <h3>Month: <%= bill.getMonthYear() %></h3>
                <p class="amount">Amount: ₹ <%= bill.getAmount() %></p>
                <p class="status <%= bill.getPaidStatus().equals("unpaid") ? "unpaid" : "paid" %>">
                    Status: <%= bill.getPaidStatus() %>
                </p>
                <% if (bill.getPaidStatus().equals("unpaid")) { %>
                    <!-- Pay button for unpaid bills -->
                    <a class="pay-btn" href="payBill.jsp?custId=<%= bill.getCustId() %>&monthYear=<%= bill.getMonthYear() %>&amount=<%= bill.getAmount() %>">Pay Now</a>
                <% } %>
            </div>
        <%
                }
            } else {
        %>
            <p>No bills found for this customer.</p>
        <%
            }
        %>
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
