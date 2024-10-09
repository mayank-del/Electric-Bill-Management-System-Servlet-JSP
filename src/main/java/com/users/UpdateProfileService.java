package com.users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateProfileService {
	
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";
    
	public void updateUserProfile(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Connection con=null;
    	PreparedStatement pstmt=null;
    
    	try {
    		String custId=request.getParameter("custId");
        	String title = request.getParameter("title");
    		String name = request.getParameter("name");
    		String email = request.getParameter("email");
    		String code=request.getParameter("code");
    		String mobile=request.getParameter("mobile");
            String password = request.getParameter("password");
            
            //System.out.println(custId+" "+name+" "+email);
            int cidInt=Integer.parseInt(custId);
            Class.forName(CLASS_NAME);
            con = DriverManager.getConnection(URL,USER,PASSWORD);
            

            

            String query = "update cust set title=?, name=?, email=?, code=?, mobile=?, password=? where cust_id=?";
            pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, title);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, code);
            pstmt.setString(5, mobile);
            pstmt.setString(6, password);
            pstmt.setInt(7,cidInt);
            
            
            pstmt.executeUpdate();

            boolean isRegistrationSuccessful = false;

            // Simulating registration success (you should add actual database logic)
            if (name != null && email != null && password != null) {
                // Assume registration was successful (write database logic here)
                isRegistrationSuccessful = true;
            }

            // Redirect to registration page with success parameter
            if (isRegistrationSuccessful) {
                // Redirect back to registration.jsp with "success=true" in URL
                response.sendRedirect("dashboard.jsp");
            } else {
                // Handle registration failure (optional)
                response.sendRedirect("index.jsp?success=false");
            }
           
            
        } catch (Exception e) {
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
