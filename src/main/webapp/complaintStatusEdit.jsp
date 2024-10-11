<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.users.ComplainShortDesc" %> <!-- Import the ComplainShortDesc class -->
<!DOCTYPE html>
<html>
<head>
    <title>Complaint Status Update Admin Page</title>
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
 select {
				  background-color: #C4DFE6;
				  color: rgb(80, 75, 75);
				  border: none;
				}
				
				option {
				  color: rgb(153, 148, 148);
				  border: none;
				}
		
				
				button {
			
				  padding:3px;
				  background-color: #4d7f86;
				  border: none;
				  color: white;
				  border-radius: 5px;
				  cursor: pointer;
				  font-size: 16px;
				}
				button:hover {
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

         <button class="nav-buttons" onclick="window.location.href='createBill.jsp'">Create Bill</button>
           
        </li>
        
        <li>
            <button class="nav-buttons" onclick="window.location.href='admindashboard.jsp'">Admin Dashboard</button>
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
			            <td>
			                <form method="post" action="UsersControllers" id="signup-form">
			                    <input type="hidden" name="func" value="updateCompStatusAdmin1" />
			                    <input type="hidden" name="comp_id" value="<%= complaint.getComplain_id()%>" />
			                    <select id="status" name="status">
			                        <option value="pending">Pending</option>
			                        <option value="resolved">Resolved</option>
			                        <option value="rejected">Rejected</option>
			                    </select>
			            </td>
			            <td>
			                    <button type="submit">Submit</button>
			                </form>
			            </td>
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
    <script src="admDashboard-script.js"></script>
</body>
</html>
