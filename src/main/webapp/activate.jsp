<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Activate your account</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="signin-card">
        <h2>Activate your account</h2>
        <p>Customer Id : <span><%=request.getAttribute("custId")%></span></p>
		<p>Name : <span><%=request.getAttribute("name")%></span></p>
		<p>Account Status : <span><%=request.getAttribute("accountStatus")%></span></p>
        <form method="post" action="UsersControllers" id="signin-form">
                <input type="hidden" name="func" value="accStatusActive" />
            <div class="form-group">
                <label for="customer-id"></label>
                <input type="hidden" id="email" name="custId" value="<%=request.getAttribute("custId")%>">
            </div>
            
            <div class="button-group">
                <button type="submit">Activate</button>
            </div>
        </form>
    </div> 
</body>
</html>