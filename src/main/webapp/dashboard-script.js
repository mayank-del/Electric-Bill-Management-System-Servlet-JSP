document.addEventListener('DOMContentLoaded', function() {

    const urlParams = new URLSearchParams(window.location.search);

    const customerName = localStorage.getItem('customerName');
    const customerId =localStorage.getItem('customerId');

    if (customerName && customerId) {
        document.getElementById('customer-name').textContent = customerName;
        document.getElementById('customer-id').textContent = customerId;
		document.getElementById("cidpara").value=customerId;
		document.getElementById("cidparaView").value=customerId;
		document.getElementById("cidparaPastView").value=customerId;
		document.getElementById("cidCompReg").value=customerId;
		document.getElementById("cidStatus").value=customerId;
		

    } else {
        alert('User information not found. Redirecting to the sign-in page.');
        window.location.href = 'signin.jsp'; // Redirect to sign-in if information is missing
    }
});


function callHome(){

    const storedCustomerName = localStorage.getItem('customerName');
    const storedCustomerId = localStorage.getItem('customerId');

    window.location.href = `dashboard.jsp?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;

}
function callbill(){
    const storedCustomerName = localStorage.getItem('customerName');
    const storedCustomerId = localStorage.getItem('customerId');

    window.location.href = `payBill.jsp?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;
}

function callcomp(){
    const storedCustomerName = localStorage.getItem('customerName');
    const storedCustomerId = localStorage.getItem('customerId');
  
    window.location.href = `registerComplaint.jsp?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;
  }

function compstatus(){
	const storedCustomerName = localStorage.getItem('customerName');
	const storedCustomerId = localStorage.getItem('customerId');
	 
	window.location.href = `complaintStatus.jsp?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;
}

function pastcomp(){
	const storedCustomerName = localStorage.getItem('customerName');
	const storedCustomerId = localStorage.getItem('customerId');
		 
	window.location.href = `pastComp.jsp?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;
}