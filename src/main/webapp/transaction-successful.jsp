<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Reciept</title>
        <link rel="stylesheet" href="payBill.css" type="text/css"/>
        <link rel="stylesheet" href="transaction-successful.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
        <style>
        body {
		    background-image: url('https://msl-ltd.co.uk/wp-content/uploads/2020/04/Energy-Management.jpg');
		    background-size: cover;
		    background-position: center;
		    color: white;
		}
		        
        
        </style>
</head>
<body>
<body style="height: 100vh; color: rgb(248, 243, 243);">
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
            <form action="UsersControllers" method="post">
                <input type="hidden" name="action" value="registerComplaint">
                <button class="nav-buttons" type="submit">Register Complaint</button>
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
    <div class="transac-container">
      <div id="transaction-details">
        <h2>Transaction Successful</h2>
        <p>Transaction ID: <span id="transaction-id"></span></p>
        <p>Download Receipt: <button class="smooth-scroll-button" onclick="downloadPDF()">Download</button></p>
    </div>

    
    </div>
    <div id="pdfContent" class="pdf-content" style="display:none;">
        <h1>Payment Receipt</h1>
        <div class="user-info">
            <p><span>Name:</span> <span id="pdfName"></span></p>
            <p><span>ID:</span> <span id="pdfId"></span></p>
            <p><span>Bill of:</span> <span id="pdfMonth"></span></p>
        </div>
        <p class="success">Payment Successful</p>
    </div>
  
  
    <script >
    
	const customerId=parseInt(localStorage.getItem('customerId'));
  	document.getElementById("cidpara").value=customerId;
	document.getElementById("cidparaView").value=customerId;
	document.getElementById("cidparaPastView").value=customerId;
	document.getElementById("cidCompReg").value=customerId;
	document.getElementById("cidStatus").value=customerId;
	document.getElementById("cidPastCompStatus").value=customerId;
	
	
		


    function downloadPDF(){
  			  const { jsPDF } = window.jspdf;
    
  			const urlParams = new URLSearchParams(window.location.search);
            

  		const monthYear=decodeURIComponent(urlParams.get('monthYear'));
  		const  cID=decodeURIComponent(urlParams.get("custId")) | localStorage.getItem("customerId");
    
  			  // Set the user inputs into the PDF template
  			  document.getElementById('pdfName').textContent = localStorage.getItem("customerName");
  			  document.getElementById('pdfId').textContent = localStorage.getItem("customerId");
  			document.getElementById('pdfMonth').textContent =monthYear;
  			  // Display the PDF content div (which was hidden)
  			  const pdfContent = document.getElementById('pdfContent');
  			  pdfContent.style.display = 'block';
    
  			  // Convert the HTML content to a canvas using html2canvas
  			  html2canvas(pdfContent).then(canvas => {
  				  const imgData = canvas.toDataURL('image/png');
  				  const pdf = new jsPDF('p', 'mm', 'a4');
    
  				  // Add the canvas image to the PDF
  				  pdf.addImage(imgData, 'PNG', 0, 0);
    
  				  // Save the PDF
  				  pdf.save('payment_receipt.pdf');
    
  				  // Hide the PDF content div after generating the PDF
  				  pdfContent.style.display = 'none';
  			  });
    }
    </script>
    <script src="dashboard-script.js"></script>
  </body>

</body>
</html>