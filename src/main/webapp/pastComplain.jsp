<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.users.ComplainShortDesc" %> <!-- Import the ComplainShortDesc class -->
<!DOCTYPE html>
<html>
<head>
    <title>Complain History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 30px auto;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba( 255, 255, 255, 0.25 );
	box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
	backdrop-filter: blur( 10px );
-	webkit-backdrop-filter: blur( 10px );
	border-radius: 10px;
	border: 1px solid rgba( 255, 255, 255, 0.18 );
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn-pay {
            text-align: center;
            margin: 15px 0;
        }
        .btn-pay a {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn-pay a:hover {
            background-color: #45a049;
        }
        .no-complaints {
            text-align: center;
            color: #777;
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
    <div class="container">
        <h1>Complaint Status</h1>
        <%
            // Retrieve the complaint list from the request scope
            ArrayList<ComplainShortDesc> compList = (ArrayList<ComplainShortDesc>) request.getAttribute("compList");

            if (compList != null && !compList.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Complaint ID</th>
                    <th>Complaint Type</th>
                    <th>Problem Description</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (ComplainShortDesc complaint : compList) {
                %>
                <tr>
                    <td><%= complaint.getCust_id() %></td>
                    <td><%= complaint.getComplain_id() %></td>
                    <td><%= complaint.getComplaint_type() %></td>
                    
                    <td><%= complaint.getProblem_desc() %></td>
                    <td><%= complaint.getStatus() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <p class="no-complaints">No complaints found for this customer.</p>
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
</body>
</html>
