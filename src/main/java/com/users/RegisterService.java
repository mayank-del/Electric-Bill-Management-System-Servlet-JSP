package com.users;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class RegisterService {
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";

	public void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 Connection con=null;
     	PreparedStatement pst1=null;
	        try {
	        	String title = request.getParameter("title");
	    		String name = request.getParameter("name");
	    		String email = request.getParameter("email");
	    		String code=request.getParameter("code");
	    		String mobile=request.getParameter("mobile");
	            String password = request.getParameter("password");
	            String cpassword = request.getParameter("confirm-password");
	            Class.forName(CLASS_NAME);
	            con = DriverManager.getConnection(URL,USER,PASSWORD);
	            
	            String checkQuery = "SELECT name FROM cust WHERE email=? OR mobile=?";
	            
	            // Create a PreparedStatement
	            pst1 = con.prepareStatement(checkQuery);
	            pst1.setString(1, email);
	            pst1.setString(2, mobile);
	            
	            // Execute the query
	            ResultSet rs = pst1.executeQuery();
	            
	            // Process the result set
	            if(rs.next()) {
	            	response.sendRedirect("index.jsp?success=false");
	            }
	            
	        	long currentTimeMillis = System.currentTimeMillis();
	
	            // Use modulus to get the last 7 digits of the current time
	            int custId = (int) (currentTimeMillis % 10000000);
	
	            if (custId < 1000000) {
	            	custId += 1000000; // Ensures it's at least 7 digits
	            }
	            // Load the JDBC driver
	            
	
	            String query = "INSERT INTO cust (cust_id, title, name, email, code, mobile, password) VALUES (?, ?,?,?,?,?,?)";
	            PreparedStatement pstmt = con.prepareStatement(query);
	            pstmt.setInt(1,custId );
	            pstmt.setString(2, title);
	            pstmt.setString(3, name);
	            pstmt.setString(4, email);
	            pstmt.setString(5, code);
	            pstmt.setString(6, mobile);
	            pstmt.setString(7, password);
	            
	            
	            
	
	            boolean isRegistrationSuccessful = false;
	
	            // Simulating registration success (you should add actual database logic)
	            if(!cpassword.equals(password)) {
	            	response.sendRedirect("index.jsp?success=passwordnotmatch");
	            }else if(password.length()!=6) {
	            	response.sendRedirect("index.jsp?success=passwordissmall");
	            }else if(!email.contains("@") || !email.contains(".")) {
	            	response.sendRedirect("index.jsp?success=invalidemail");
	            }
	            else if (name != null && email != null && password != null && cpassword!=null && mobile!=null) {
	                // Assume registration was successful (write database logic here)
	                isRegistrationSuccessful = true;
	            }else {
	            	response.sendRedirect("index.jsp?success=datanotfilled");
	            }
	
	            // Redirect to registration page with success parameter
	            if (isRegistrationSuccessful) {
	                // Redirect back to registration.jsp with "success=true" in URL
	            	pstmt.executeUpdate();
	                response.sendRedirect("index.jsp?success="+isRegistrationSuccessful+"&name="+name+"&cid="+custId);
	            } else {
	                // Handle registration failure (optional)
	                response.sendRedirect("index.jsp?success=false");
	            }
	            
	        } catch (Exception e) {
	            System.out.print(e);
	        }finally {
     		
	            try {
	            	
					pst1.close();
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            
     	
     
     }
	}

}
