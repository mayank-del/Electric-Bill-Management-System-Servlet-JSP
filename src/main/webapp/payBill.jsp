<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Payment Page</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script> 
 <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link> 
    <link rel="stylesheet" href="payBill.css" type="text/css"/>
	    
    </head>
<body>
	 
   <div class="top-container">
   <nav>
        <div class="logo">
          <h1 style="color:white;">TATA</h1>
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
   <div class="pay-form-container">
    <div class="pay-form">
        <h1 style="color: white">Payment Details</h1>

        <div class="payment-info">
           <div class="bill-details">
               <label for="bill-amount">Bill Amount:</label>
               <input type="text" id="bill-amount" readonly value="">
           </div>
           <div class="bill-details">
               <label for="pg-charge">PG :</label>
               <input type="text" id="pg-charge" readonly value="">
           </div>
           <div class="bill-details">
               <label for="total-payable">Total Payable Amount:</label>
               <input type="text" id="total-payable" readonly value="">
           </div>
           <div class="bill-details">
               <label for="payment-mode">Mode of Payment:</label>
               <select id="payment-mode">
                   <option value="debit">Debit Card</option>
                   <option value="credit">Credit Card</option>
                   <option value="other">Other</option>
               </select>
           </div>
        </div>
    
        <div style="width: 100%; display: flex; justify-content: space-evenly; margin-top: 5vh;">
            <button class="smooth-scroll-button" onclick="payNow()" > <a style="color: inherit;" id="scrollATag" href="#cardform">Pay Now</a>  </button>
        <input  onclick="backToHome()" value="Back to Home" type="button"/>
        </div>
        
    </div >
</div>
</div>
    <div class="registration-container">
      <h2>Card Details</h2>
      <form id ="cardform"action="" class="form">
            <div class="form-group col-12">
              <label for="card-holder">Card Holder Name</label>
              <input type="text" id="card-holder" class="name">
            </div>
            <div class="form-group col-4">
              <label for="card-number">Card Number</label>
              <input type="text" id="card-number" class="number">
            </div>
            <div class="form-group col-4">
              <label for="">Expiry Date</label>
              <input type="text" id="expiry-date" class="months">
            </div>
            <div class="form-group col-4">
              <label for="cvv">CVV</label>
              <input type="text" id="cvv-num" data-id="cvv">
            </div>
            
            
          </form>
      <div class="content">
        <div class="card visa">
          <div class="side front">
            <div class="card-logo"> <b>Bank</b></div>
            <span class="label name">
              Card Holder Name
            </span>
            <span class="label number">
              <b>Card Number</b>
            </span>
            <span class="label date">
              <i><b>Expiry Date</b></i>
            </span>
          </div>
          <div class="side back">
            <span class="cvv">CVV</span>
          </div>
          
          
    </div>
    <form method="post" action="UsersControllers">
	    <input type="hidden" name="func" value="paymentSuccess">
	    <input type="hidden" id="paidMonth" name="paidMonth" value="">
	    <input type="hidden" id="custIdPara" name="custIdPara" value="">
	    <input style="margin:30px 10px 15px 10px"  type="submit" name="" id="make-payment" value="Make Payment" />
    </form>
  </div>
  
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
     
    <script src="payBill.js" type="text/javascript" charset="utf-8"></script>
    <script src="dashboard-script.js"></script>
    
    </body>
</html>