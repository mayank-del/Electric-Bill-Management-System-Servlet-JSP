package com.users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminBillCreationService {
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";
	public void createBill(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Connection con=null;
    	PreparedStatement pstmt=null;
    	try {
    		String custId=request.getParameter("customer_Id");
    		
    		ServletContext context=request.getServletContext();
			if(custId==null || custId=="") {
				custId=(String)context.getAttribute("userId");
			}
    		long currentTimeMillis = System.currentTimeMillis();
    		
            // Use modulus to get the last 8 digits of the current time
            int complainId = (int) (currentTimeMillis % 100000000);

            if (complainId < 10000000) {
            	custId += 10000000; // Ensures it's at least 8 digits
            }
            //System.out.println((String)context.getAttribute("userId"));
    		String cid=request.getParameter("cid");
    		String monYr=request.getParameter("monthYear");
    		String amt=request.getParameter("amount");
    		
    		Class.forName(CLASS_NAME);
            con = DriverManager.getConnection(URL,USER,PASSWORD);
            
            double amountVal=Double.parseDouble(amt);
            
            
            String query = "insert into custbills(cust_id,monthYear,amount,paidStatus) values(?,?,?,?)";
            pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,cid);
            pstmt.setString(2, monYr);
            pstmt.setDouble(3,amountVal);
            pstmt.setString(4,"unpaid");
            
            
            pstmt.executeUpdate();
            
            response.sendRedirect("admindashboard.jsp");
        
		
	}catch(Exception e) {
		System.out.print(e);
	}finally {
		
        try {
        	
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
}
	}

}
