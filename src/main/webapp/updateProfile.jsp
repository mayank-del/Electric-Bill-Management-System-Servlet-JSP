<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Customer Update</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	 <div class="signup-card">
        <h2>Update User(ID=<%=request.getAttribute("custId")%>) </h2>
        <form method="post" action="UsersControllers" id="signup-form">
        <input type="hidden" name="func" value="updateProfile" />
        <div class="form-group">
                <label for="custid">Customer ID</label>
                <input type="hidden" id="custid" name="custId"  required value="<%=request.getAttribute("custId")%>" >
            </div>
            <div class="form-group">
                <div class="form-group">
                    <label for="title">Title</label>
                    <select id="title" name="title">
                        <option value="Mr" <%= (request.getAttribute("title") != null && request.getAttribute("title").equals("Mr")) ? "selected" : "" %>>Mr.</option>
                        <option value="Mrs" <%= (request.getAttribute("title") != null && request.getAttribute("title").equals("Mrs")) ? "selected" : "" %>>Mrs.</option>
                        <option value="Ms" <%= (request.getAttribute("title") != null && request.getAttribute("title").equals("Ms")) ? "selected" : "" %>>Ms.</option>
                        <option value="Dr" <%= (request.getAttribute("title") != null && request.getAttribute("title").equals("Dr")) ? "selected" : "" %>>Dr.</option>
                        </select>
                </div>
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required value="<%= request.getAttribute("name") %>">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email"   
 required value="<%= request.getAttribute("email") %>">
            </div>
            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <select id="country-code" name="code">
                    <option value="+1" <%= (request.getAttribute("code") != null && request.getAttribute("code").equals("+1")) ? "selected" : "" %>>United States (+1)</option>
                    <option value="+44" <%= (request.getAttribute("code") != null && request.getAttribute("code").equals("+44")) ? "selected" : "" %>>United Kingdom (+44)</option>
                    <option value="+91" <%= (request.getAttribute("code") != null && request.getAttribute("code").equals("+91")) ? "selected" : "" %>>India (+91)</option>
                    </select>
                <input type="tel" id="mobile" name="mobile" placeholder="Enter your mobile number" required value="<%= request.getAttribute("mobile") %>">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="text" id="password" name="password" value="<%= request.getAttribute("password") %>" required>
            </div>
            
            
            <div class="button-group">
                <button type="submit">Update</button>   

                
            </div>
        </form>
        <div>
        	
	        <div style="display:flex;justify-content:space-evenly;">
	        		<form method="post" action="UsersControllers">
			        	<input type="hidden" id="custid" name="custId"  required value="<%=request.getAttribute("custId")%>" >
			        	<input type="hidden" name="func" value="userLogout"/>
			        	<div class="button-group">
			        	<button style="width: 150px" type="submit" >Logout User</button>
			        	</div>
			        </form>
			        
			        <form method="post" action="UsersControllers">
			        	<input type="hidden" id="custid" name="custId"  required value="<%=request.getAttribute("custId")%>" >
			        	<input type="hidden" name="func" value="accStatusInactive"/>
			        	<div class="button-group">
			        	<button  style="width: 200px" type="submit" >Deactivate Account</button>
			        	</div>
			        </form>
	        </div>
        
        </div>
        
    </div>
    <script>
        // This script checks if registration was successful
        // A flag "success" is sent from the servlet to indicate success
        const urlParams = new URLSearchParams(window.location.search);
        const success = urlParams.get('success');
        const uname = decodeURIComponent(urlParams.get('name'));
        const cid = decodeURIComponent(urlParams.get('cid'));
        
        console.log('Success:', success);
        console.log('Name:', uname);
        console.log('Customer ID:', cid);

        if (success.toString() === 'true') {
        	Swal.fire({
                title: 'Success',
                text: `Profile Updated Successfully!`,
                icon: 'success'
            }).then(() => {
                // After SweetAlert closes, redirect to the login page
                window.location.href = "dashboard.jsp";
            });
        }else if(success.toString() === 'false'){
        	Swal.fire({
                title: 'Error',
                text: `User is already registered with this phone number or email`,
                icon: 'error'
            })
        }
    </script>
    <script src="dashboard-script.js"></script>
</body>
</html>