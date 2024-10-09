package com.users;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UsersControllers
 */
@WebServlet("/UsersControllers")
public class UsersControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersControllers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String functionToCall = request.getParameter("func");

        if (functionToCall.equals("getcust")) {
            GetCustomerDetails getCustomerDetails = new GetCustomerDetails();
            getCustomerDetails.getCustomer(request, response);

        } else if (functionToCall.equals("viewbills")) {
            ViewBills viewBills = new ViewBills();
            viewBills.viewBills(request, response);

        } else if (functionToCall.equals("pastBill")) {
            PastBills pastBill = new PastBills(); // You need to create this class similar to others
            pastBill.getPastBills(request, response);

        } else if (functionToCall.equals("complainStatus")) {
            ComplainStatus complainStatus = new ComplainStatus(); // You need to create this class
            complainStatus.checkStatus(request, response);

        } else if (functionToCall.equals("getAllPendingComp")) {
            PendingComplaints pendingComplaints = new PendingComplaints(); // Create this class
            pendingComplaints.getAllPendingComplaints(request, response);

        } else if (functionToCall.equals("viewPastComp")) {
            ViewPastComplaints viewPastComplaints = new ViewPastComplaints(); // Create this class
            viewPastComplaints.viewPastComplaints(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String functionToCall = request.getParameter("func");

        if (functionToCall.equals("register")) {
            RegisterService registerService = new RegisterService();
            registerService.registerUser(request, response);

        } else if (functionToCall.equals("login")) {
            LoginService loginService = new LoginService();
            loginService.loginUser(request, response);

        } else if (functionToCall.equals("userLogout")) {
            LogoutService logoutService = new LogoutService();
            logoutService.logoutUser(request, response);

        } else if (functionToCall.equals("paymentSuccess")) {
            PaymentSuccessService paymentSuccessService = new PaymentSuccessService();
            paymentSuccessService.processPaymentSuccess(request, response);

        } else if (functionToCall.equals("updateProfile")) {
            UpdateProfileService updateProfileService = new UpdateProfileService();
            updateProfileService.updateUserProfile(request, response);

        } else if (functionToCall.equals("accStatusInactive")) {
            AccountStatusService accountStatusService = new AccountStatusService();
            accountStatusService.updateAccountStatus(request, response);

        } else if (functionToCall.equals("accStatusActive")) {
            AccountStatusService accountStatusService = new AccountStatusService();
            accountStatusService.updateAccountStatusActivate(request, response);

        } else if (functionToCall.equals("registerComp")) {
            ComplaintRegistrationService complaintRegistrationService = new ComplaintRegistrationService();
            complaintRegistrationService.registerComplaint(request, response);

        } else if (functionToCall.equals("createBill")) {
            AdminBillCreationService billCreationService = new AdminBillCreationService();
            billCreationService.createBill(request, response);

        } else if (functionToCall.equals("updateCompStatusAdmin1")) {
            AdminComplaintStatusUpdateService complaintStatusUpdateService = new AdminComplaintStatusUpdateService();
            complaintStatusUpdateService.updateComplaintStatus(request, response);
        }
    }

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
