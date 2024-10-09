package com.users;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginService {
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";
  
  public void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection con=null;
        	PreparedStatement pst1=null;
        	ResultSet rs=null;
        	try {
        		
	            
        		Class.forName(CLASS_NAME);
	            con = DriverManager.getConnection(URL,USER,PASSWORD);
	            String email = request.getParameter("email");
	    		
	            String password = request.getParameter("password");
	            String checkQuery = "SELECT cust_id,name,acc_status,role FROM cust WHERE email=? and password=?";
	            
	            // Create a PreparedStatement
	            pst1 = con.prepareStatement(checkQuery);
	            pst1.setString(1, email);
	            pst1.setString(2, password);
	            
	            rs = pst1.executeQuery();
	            
	            if(rs.next()) {
	            	String cid=rs.getString("cust_id");
	            	String name=rs.getString("name");
	            	String accountStatus=rs.getString("acc_status");
	            	String role=rs.getString("role");
	            	if(accountStatus.equalsIgnoreCase("inactive")) {
	            		//response.sendRedirect("activate.jsp?success=true&name="+name+"&cid="+uid+"&account="+accountStatus);
	            		
		                request.setAttribute("custId",cid );
		                
		                request.setAttribute("name", name);
		                
		                request.setAttribute("accountStatus", accountStatus);
		                
		                RequestDispatcher dispatcher = request.getRequestDispatcher("activate.jsp");
		                dispatcher.forward(request, response);
	            	}else  {
		            	ServletContext context=request.getServletContext();
		            	if(role.equals("admin")) {
		            		context.setAttribute("admin",cid);
			            	response.sendRedirect("adminlogin.jsp?success=true&name="+name+"&cid="+cid);
		            	}else if(role.equals("user")){
			            	context.setAttribute("userId",cid);
			            	response.sendRedirect("signin.jsp?success=true&name="+name+"&cid="+cid);
		            	}
	            
	            }
}
	            else {
	            	response.sendRedirect("signin.jsp?success=false");
	            }
	            
	            
	            
        	}catch(Exception e) {
        		System.out.print(e);
        		response.sendRedirect("signin.jsp?success=something_bad");
        	}finally {
        		
	            try {
	            	rs.close();
					pst1.close();
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            
        	}
  }
}
