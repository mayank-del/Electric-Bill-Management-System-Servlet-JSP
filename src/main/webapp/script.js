// script.js



document.getElementById("signup-form").addEventListener("submit", async function (event) {
	event.preventDefault(); // Prevent form submission
  
	try {
		// Get form values
		const name = document.getElementById("name").value.trim();
		const email = document.getElementById("email").value.trim();
		const mobile = document.getElementById("mobile").value.trim();
		const password = document.getElementById("password").value.trim();
		const confirmPassword = document.getElementById("confirm-password").value.trim();
		const terms = document.getElementById("terms").checked;
  
		// Basic validation checks
		if (!name) {
			//alert("Please enter your name.");
			await swal("Error", "Name is empty, Please enter your name!", "error");
			return;
		}
  
		if (!validateEmail(email)) {
			//alert("Please enter a valid email address.");
			await swal("Error", "Email is empty, Please enter your email!", "error");
			return;
		}
  
		if (!mobile) {
		  await swal("Error", "Mobile number is empty, Please enter your number!", "error");
			return;
		}
  
		if (!validateMobile(mobile)) {
			
			await swal("Error", "Please enter a valid mobile number.", "error");
			return;
		}
  
		if (!password) {
			//alert("Please enter a password.");
			await swal("Error", "Please enter a password.", "error");
			return;
		}
  
		if (password.length < 6) {
			
			await swal("Error", "Password must be at least 6 characters long.", "error");
			return;
		}
  
		if (password !== confirmPassword) {
			
			await swal("Error", "Passwords do not match.", "error");
			return;
		}
  
		if (!terms) {
			//alert("You must agree to the Terms of Use.");
			await swal("Error", "You must agree to the Terms of Use.", "error");
			return;
		}
  
		// Generate a unique customer ID
		const customerId = generateCustomerId();
		const password1 = password;
		const name1 = name;
  
		// Clear previous localStorage data to prevent overflow issues
		localStorage.clear();
  
		// Store the new values in localStorage
		localStorage.setItem('signupPassword', password1);
		localStorage.setItem('signupCustomerName', name1);
		localStorage.setItem('signupCustomerId', customerId);
  
		
		await swal("Success", `Thank you for signing up, ${name}! Your Customer ID is ${customerId}.`, "success");
		// Redirect to the sign-in page with the Customer ID in the URL
		window.location.href = `signin.html?customerId=${customerId}`;
  
	} catch (error) {
		console.error("An error occurred during sign-up:", error);
		//alert("An error occurred. Please try again.");
		await swal("Error", "An error occurred. Please try again.", error.message);
	}
  });
  
  // Email validation function
  function validateEmail(email) {
	const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	return re.test(email);
  }
  
  // Mobile number validation function (basic)
  function validateMobile(mobile) {
	const re = /^\d{10}$/;
	return re.test(mobile);
  }
  
  // Function to generate a random 5-digit customer ID
  function generateCustomerId() {
	return Math.floor(10000 + Math.random() * 90000); // Generates a number between 10000 and 99999
  }
  
  function downloadPDF(){
			  const { jsPDF } = window.jspdf;
  
  
  
			  // Set the user inputs into the PDF template
			  document.getElementById('pdfName').textContent = localStorage.getItem("signupCustomerName");
			  document.getElementById('pdfId').textContent = localStorage.getItem("signupCustomerId");
  
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

  function callHome(){

    const storedCustomerName = localStorage.getItem('signupCustomerName');
    const storedCustomerId = localStorage.getItem('signupCustomerId');
  
    window.location.href = `dashboard.html?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;
  
  }
  function callbill(){
    const storedCustomerName = localStorage.getItem('signupCustomerName');
    const storedCustomerId = localStorage.getItem('signupCustomerId');
  
    window.location.href = `payBill.html?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;
  }
  
  function callcomp(){
    const storedCustomerName = localStorage.getItem('signupCustomerName');
    const storedCustomerId = localStorage.getItem('signupCustomerId');
  
    window.location.href = `registerComplaint.html?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;
  }
  