package com.users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ComplaintRegistrationService {
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; 
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";
	public void registerComplaint(HttpServletRequest request, HttpServletResponse response) {
		Connection con=null;
    	PreparedStatement pstmt=null;
    	try {
    		String custId=request.getParameter("customer_Id");
    		System.out.println("it came tille line 689");
    		ServletContext context=request.getServletContext();
			if(custId==null || custId=="") {
				custId=(String)context.getAttribute("userId");
			}
    		long currentTimeMillis = System.currentTimeMillis();
    		
            // Use modulus to get the last 8 digits of the current time
            int complainId = (int) (currentTimeMillis % 100000000);

            if (complainId < 10000000) {
            	complainId += 10000000; // Ensures it's at least 8 digits
            }
            System.out.println((String)context.getAttribute("userId"));
    		String compType=request.getParameter("complaint-type");
    		String contactPerson=request.getParameter("contact-person");
    		String landmark=request.getParameter("landmark");
    		String consumerNo=request.getParameter("consumer-no");
    		String problemDesc=request.getParameter("problem-description");
    		String mob=request.getParameter("mobile-number");
    		String address=request.getParameter("address");
    		Class.forName(CLASS_NAME);
            con = DriverManager.getConnection(URL,USER,PASSWORD);
            

            
            
            String query = "insert into complaints values(?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,custId);
            pstmt.setString(2,complainId+"");
            pstmt.setString(3,compType);
            pstmt.setString(4,contactPerson);
            pstmt.setString(5,landmark);
            pstmt.setString(6,consumerNo);
            pstmt.setString(7,problemDesc);
            pstmt.setString(8,mob);
            pstmt.setString(9,address);
            pstmt.setString(10, "pending");
            
            pstmt.executeUpdate();
            
            response.sendRedirect("UsersControllers?func=complainStatus&custId="+custId);
        
		
	}catch(Exception e) {
		System.out.print(e);
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
