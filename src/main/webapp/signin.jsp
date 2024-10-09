<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Electric Management System Signup</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	   <div class="signin-card">
        <h2>Sign In</h2>
        <form method="post" action="UsersControllers" id="signin-form">
                <input type="hidden" name="func" value="login" />
            <div class="form-group">
                <label for="customer-id">Email</label>
                <input type="text" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                
            </div>
            <div class="button-group">
                <button type="submit">Sign In</button>
            </div>
            
            <a style="position:relative; top:10px; text-decoration:none;color:white;" href="adminlogin.jsp">Admin Login</a>
        </form>
    </div>    
    <script>

		const urlParams = new URLSearchParams(window.location.search);
        const success = urlParams.get('success');
       
        const uname = decodeURIComponent(urlParams.get('name'));
        const cid = decodeURIComponent(urlParams.get('cid'));
        
        console.log('Success:', success);


        if (success.toString() === 'true') {
        	Swal.fire({
                title: 'Success',
                text: `Login successful!`,
                icon: 'success'
            }).then(() => {
                // After SweetAlert closes, redirect to the login page
                localStorage.setItem("customerName",uname);
                localStorage.setItem("customerId",cid);
                window.location.href = "dashboard.jsp";
            });
        }else if(success.toString() === 'false'){
        	Swal.fire({
                title: 'Error',
                text: `Wrong email or password!`,
                icon: 'error'
            })
        }else if(success.toString()==="logout"){
        	Swal.fire({
                title: 'User Logout',
                text: `Logout successfully!`,
                icon: 'success'
            }).then(()=>{
            	localStorage.clear();
            })
        }
    </script>
</body>
</html>