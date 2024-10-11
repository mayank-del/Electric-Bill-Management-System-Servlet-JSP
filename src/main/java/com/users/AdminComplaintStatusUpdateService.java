package com.users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminComplaintStatusUpdateService {
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";
	public void updateComplaintStatus(HttpServletRequest request, HttpServletResponse response) {
		Connection con=null;
    	PreparedStatement pstmt=null;
    	try {
    		String compId=request.getParameter("comp_id");
    		String status=request.getParameter("status");
    		
    		System.out.println(compId);
    		System.out.println(status);
    		
    		Class.forName(CLASS_NAME);
            con = DriverManager.getConnection(URL,USER,PASSWORD);
            
          
            
            
            String query = "update complaints set status =? where complain_id=?";
            pstmt = con.prepareStatement(query);
            
            
            pstmt.setString(1,status);
            pstmt.setString(2,compId);
            
            
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
