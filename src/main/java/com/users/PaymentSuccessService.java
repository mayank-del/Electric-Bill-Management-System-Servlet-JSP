package com.users;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;





public class PaymentSuccessService {

	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";

  public void processPaymentSuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.print("value:"+request.getParameter("custId"));
        	String custId = request.getParameter("custId"); // Get customer ID from request (could be passed from login)
        	ServletContext context=request.getServletContext();
			if(custId==null || custId=="") {
				custId=(String)context.getAttribute("userId");
			}
	     
	        Connection con=null;

	        PreparedStatement pstmt=null;
	        try {
        		String monYear=request.getParameter("paidMonth");
        		custId=request.getParameter("custIdPara");
        		context=request.getServletContext();
    			if(custId==null || custId=="") {
    				custId=(String)context.getAttribute("userId");
    			}
        		Class.forName(CLASS_NAME);
	            con = DriverManager.getConnection(URL,USER,PASSWORD);
	            

	            
	            
	            String query = "update custbills set paidStatus='paid' where monthYear=? and cust_id=?";
	            pstmt = con.prepareStatement(query);
	            
	            pstmt.setString(1,monYear);
	            pstmt.setString(2,custId);
	            
	            
	            pstmt.executeUpdate();
	            
	            
	            response.sendRedirect("transaction-successful.jsp?monthYear="+monYear+"&custId="+custId);
        		
        	}catch(Exception e) {
        		
        	}finally {
        		
	            try {
	            	
					pstmt.close();
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            
        	}
	        
        
  }
}