<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.users.ComplainShortDesc" %> <!-- Import the ComplainShortDesc class -->
<!DOCTYPE html>
<html>
<head>
    <title>Complaint Status</title>
    <style>
        body {
            background-image: url('https://msl-ltd.co.uk/wp-content/uploads/2020/04/Energy-Management.jpg');
		    background-size: cover;
		    background-position: center;
		    color: white;
            margin: 0;
            padding: 0;
            width:100vw;
            height:100vh;
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
            background-color: #66A5AD;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #8fb7c1;
        }
        tr:nth-child(odd) {
            color: #8fb7c1;
        }
        tr:nth-child(odd):hover {
            background-color: #f1f1f1;
        }
        tr:nth-child(even):hover {
            background-color: #b6ccd1;
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
        nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background-color: rgba(0, 0, 0, 0.5);
}

.logo h1 {
    font-size: 24px;
    color:whitesmoke;
    font-family: 'Arial Black', Gadget, sans-serif;
}

nav ul {
    display: flex;
    list-style-type: none;
}

nav ul li {
    margin-left: 20px;
}

.nav-buttons {
    text-decoration: none;
    color: white;
    font-size: 16px;
    font-weight: bold;
    padding: 10px;
    transition: background 0.3s;
    background:transparent;
    border:2px solid transparent;
}

.nav-buttons:hover {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 5px;
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
    <div class="container">
       
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
    <script src="dashboard-script.js"></script>
</body>
</html>
