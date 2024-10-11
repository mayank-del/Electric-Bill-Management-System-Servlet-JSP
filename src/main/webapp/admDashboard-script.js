document.addEventListener('DOMContentLoaded', function() {

    

    const role = localStorage.getItem('userRole');
	const customerName = localStorage.getItem('adminName');
	const customerId =localStorage.getItem('adminId');

    if (role) {
        console.log("Welcome Admin!");
		document.getElementById('customer-name').textContent = customerName;
		document.getElementById('customer-id').textContent = customerId;
		

    } else {
        alert('Admin information not found. Redirecting to the sign-in page.');
        window.location.href = 'signin.jsp'; // Redirect to sign-in if information is missing
    }
});

