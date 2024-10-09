package com.users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountStatusService {
	
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";
    
	public void updateAccountStatus(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstmt=null;
	try {
		
		String custId=request.getParameter("custId");
		ServletContext context=request.getServletContext();
		if(custId==null || custId=="") {
			custId=(String)context.getAttribute("userId");
		}
		
		Class.forName(CLASS_NAME);
        con = DriverManager.getConnection(URL,USER,PASSWORD);
        
        String query = "update cust set acc_status='inactive' where cust_id=?";
        pstmt = con.prepareStatement(query);
        
        pstmt.setString(1,custId);
        
        
        pstmt.executeUpdate();
        response.sendRedirect("signin.jsp");
        
		
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
	public void updateAccountStatusActivate(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		Connection con=null;
    	PreparedStatement pstmt=null;
    	try {
    		String custId=request.getParameter("custId");
    		ServletContext context=request.getServletContext();
			if(custId==null || custId=="") {
				custId=(String)context.getAttribute("userId");
			}
    		Class.forName(CLASS_NAME);
            con = DriverManager.getConnection(URL,USER,PASSWORD);
            
            String query = "update cust set acc_status='active' where cust_id=?";
            pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,custId); 
            pstmt.executeUpdate();

            response.sendRedirect("signin.jsp");
            
    		
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
