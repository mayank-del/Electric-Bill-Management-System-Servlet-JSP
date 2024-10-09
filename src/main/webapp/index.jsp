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
	 <div class="signup-card">
        <h2>Sign Up</h2>
        <form method="post" action="UsersControllers" id="signup-form">
        <input type="hidden" name="func" value="register" />
            <div class="form-group">
                <div class="form-group">
                    <label for="title">Title</label>
                    <select id="title" name="title">
                        <option value="Mr">Mr.</option>
                        <option value="Mrs">Mrs.</option>
                        <option  
                 value="Ms">Ms.</option>
                        <option value="Dr">Dr.</option>
                        </select>
                </div>
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <select id="country-code" name="code">
                    <option value="+1">United States (+1)</option>
                    <option value="+44">United Kingdom (+44)</option>
                    <option value="+91">India (+91)</option>
                    </select>
                <input type="tel" id="mobile" name="mobile" placeholder="Enter your mobile number" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" required>
            </div>
            <div class="form-group-agree">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">I agree to the Terms of Use</label>
            </div>
            <div class="button-group">
                <button type="submit">Sign Up</button>
                <button onclick="window.location.href='signin.jsp'" type="button">Sign In</button>
            </div>
        </form>
    </div>
    <script>
        // This script checks if registration was successful
        // A flag "success" is sent from the servlet to indicate success
        function loadALertMessage(){
	        const urlParams = new URLSearchParams(window.location.search);
	        const success = urlParams.get('success');
	        const uname = decodeURIComponent(urlParams.get('name'));
	        const cid = decodeURIComponent(urlParams.get('cid'));
	        
	        console.log('Success:', success);
	        console.log('Name:', uname);
	        console.log('Customer ID:', cid);
	        
	        let regMessage=`Thank you for signing up, ${urlParams.get('name')}! Your customer id is ${urlParams.get('cid')}.`
	
	        if (success.toString() === 'true') {
	        	Swal.fire({
	                title: 'Success',
	                text: `Thank you for signing up`,
	                icon: 'success'
	            }).then(() => {
	                // After SweetAlert closes, redirect to the login page
	                alert(regMessage)
	                window.location.href = "signin.jsp";
	            });
	        }else if(success.toString() === 'false'){
	        	Swal.fire({
	                title: 'Error',
	                text: `User is already registered with this phone number or email`,
	                icon: 'error'
	            })
	        }else if(success.toString()==="passwordnotmatch"){
	        	Swal.fire({
	                title: 'Error',
	                text: `Passwords are not matching!`,
	                icon: 'error'
	            })
	        }
	        else if(success.toString()==="passwordissmall"){
	        	Swal.fire({
	                title: 'Error',
	                text: `Passwords should contain minimum 6 characters!`,
	                icon: 'error'
	            })
	        }else if(success.toString()==="datanotfilled"){
	        	Swal.fire({
	                title: 'Error',
	                text: "Please fill all the fields.",
	                icon: 'error'
	            })
	        }else if(success.toString()==="invalidemail"){
	        	Swal.fire({
	                title: 'Error',
	                text: "Your email is invalid, Please add a valid email.",
	                icon: 'error'
	            })
	        }
	        }
        loadALertMessage();
        
    </script>
</body>
</html>