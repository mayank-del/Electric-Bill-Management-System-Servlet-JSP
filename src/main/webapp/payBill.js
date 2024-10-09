// Use the following to include th"is JavaScript file 
// <script src="script1.js"></script>
document.addEventListener('DOMContentLoaded', function () {

  const customerName = localStorage.getItem('customerName');

  const customerId = localStorage.getItem('customerId');
  
  if (customerName && customerId) {
      document.getElementById('customer-name').textContent = customerName;
      document.getElementById('customer-id').textContent = customerId;
  }
  
  			const urlParams = new URLSearchParams(window.location.search);
          
          const amount = decodeURIComponent(urlParams.get('amount'));
		const monthYear=decodeURIComponent(urlParams.get('monthYear'));
		const  cID=decodeURIComponent(urlParams.get("custId"));
		
		  document.getElementById("bill-amount").value= parseInt(amount);
		  document.getElementById("pg-charge").value=2;
		  document.getElementById("total-payable").value=parseInt(amount)+2;
		  document.getElementById("paidMonth").value=monthYear;
		  document.getElementById("custIdPara").value=cID;
		  

  
});


// start rotate animation

let cvv = document.querySelector("input[data-id='cvv']");

let card = document.querySelector(".card");

//document.getElementById("greet").textContent=localStorage.getItem("uId");

cvv.addEventListener('focus', function(){
card.classList.add('inversed');
});

cvv.addEventListener('blur', function(){
card.classList.remove('inversed');
});
// end rotate animation


// initializing data-binding

// name binding
const name = document.querySelector('input.name');

const labelName = document.querySelector('.label.name');

name.addEventListener('keyup', (e) => {
labelName.innerHTML = e.target.value;
if(!e.target.value){
 labelName.innerHTML = 'Cesar Oliveira Filho';
   }
});
// end name binding

// number binding
const number = document.querySelector('input.number');

const labelNumber = document.querySelector('.label.number');

number.addEventListener('keyup', (e) => {
labelNumber.innerHTML = e.target.value;
if(e.target.value[0] == 4){
card.classList.add('visa');
} else if(e.target.value[0] == 5){
      card.classList.add('mastercard');     
          }
if(e.target.value === ''){
 labelNumber.innerHTML = '2422 3658 4379 8574';
  card.classList.remove('mastercard');
card.classList.remove('visa')
   }


});
// end number binding

// date binding
const date = document.querySelector('input.months');

const labelDate = document.querySelector('.label.date');

date.addEventListener('keyup', (e) => {
labelDate.innerHTML = e.target.value;
if(!e.target.value){
 labelDate.innerHTML = '09/23';
   }
});
// end date binding

// number cvv

const labelCvv = document.querySelector('span.cvv');

cvv.addEventListener('keyup', (e) => {
labelCvv.innerHTML = e.target.value;
if(!e.target.value){
 labelCvv.innerHTML = '436';
   }
});


function logout(){
localStorage.clear();
window.location.href="login.html";
}
function backToHome(){
  const storedCustomerName = localStorage.getItem('signupCustomerName');
  const storedCustomerId = localStorage.getItem('signupCustomerId');

  window.location.href = `dashboard.html?customerName=${storedCustomerName}&customerId=${storedCustomerId}`;
}

function payNow(){
let divElement = document.getElementById('cardform');
// Scroll to the bottom of the div
divElement.scrollIntoView({ behavior: 'smooth', block: 'end' });
}
function makePayment(){

 /* const cardNumber = document.getElementById('card-number').value.trim();
      const cardHolder = document.getElementById('card-holder').value.trim();
      const expiryDate = document.getElementById('expiry-date').value.trim();
      const cvv = document.getElementById('cvv-num').value.trim();

      if (cardNumber.length !== 16 || !/^\d+$/.test(cardNumber)) {
          //alert('Please enter a valid 16-digit card number.');
          await swal("Error", "Please enter a valid 16-digit card number.", "error");
          return;
      }

      if (!cardHolder) {
          //alert('Please enter the cardholder name.');
          await swal("Error", "Please enter the cardholder name.", "error");
          return;
      }

      if (!expiryDate) {
          //alert('Please enter the expiry date.');
          await swal("Error", "Please enter the expiry date.", "error");
          return;
      }

      if(expiryDate){
          const expRegex = /^(0[1-9]|1[0-2])\/([0-9]{4})$/;

  // Test the expiryDate against the regular expression
      if (expRegex.test(expiryDate)) {
          const [month, year] = expiryDate.split('/').map(Number);
          const currentDate = new Date();
          const currentMonth = currentDate.getMonth() + 1; // Months are zero-based in JS
          const currentYear = currentDate.getFullYear();

          // Check if the expiry date is in the future
          if (year < currentYear || (year === currentYear && month < currentMonth)) {
              
              await swal("Error", "Your card is expired, Please use a valid card.", "error");
              return;
          } 
          } else {
              await swal("Error", "Invalid expiry date format. Please use MM/YYYY format.", "error");
              return;
          }
      }

      if (cvv.length !== 3 || !/^\d+$/.test(cvv)) {
          //alert('Please enter a valid 3-digit CVV.');
          await swal("Error", "Please enter a valid 3-digit CVV.", "error");
          return;
      }*/
      window.location.href = `transaction-successful.jsp?customerName=${localStorage.getItem('signupCustomerName')}&customerId=${localStorage.getItem('signupCustomerId')}`;

}

function callHome(){

  const storedCustomerName = localStorage.getItem('signupCustomerName');
  const storedCustomerId = localStorage.getItem('signupCustomerId');

  window.location.href = `dashboard.jsp`;

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