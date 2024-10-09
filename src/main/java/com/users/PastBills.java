package com.users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;





public class PastBills {

	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";

  public void getPastBills(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.print("value:"+request.getParameter("custId"));
        	String custId = request.getParameter("custId"); // Get customer ID from request (could be passed from login)
        	ServletContext context=request.getServletContext();
			if(custId==null || custId=="") {
				custId=(String)context.getAttribute("userId");
			}
	        ArrayList<Bill> billList = new ArrayList<>();
	        Connection con=null;
	        ResultSet rs=null;
	        PreparedStatement pst=null;
	        try {
	            // Database connection
	        	Class.forName(CLASS_NAME);
	            con = DriverManager.getConnection(URL,USER,PASSWORD);

	            // Query to fetch bills for the given customer ID
	            String query = "SELECT cust_id, monthYear, amount, paidStatus FROM custbills WHERE cust_id = ? and paidStatus like 'paid'";
	            pst = con.prepareStatement(query);
	            pst.setString(1, custId);
	            rs = pst.executeQuery();

	            // Add each bill to the list
	            while (rs.next()) {
	                Bill bill = new Bill(
	                    rs.getString("cust_id"),
	                    rs.getString("monthYear"),
	                    rs.getDouble("amount"),
	                    rs.getString("paidStatus")
	                );
	                billList.add(bill);
	            }

	            
	            
	            request.setAttribute("billList", billList);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("pastBill.jsp");
		        dispatcher.forward(request, response);

	        } catch (Exception e) {
	        	System.out.print(e);
	        	return;
	        }finally {
	    		
	            try {
	            	
	            	rs.close();
		            pst.close();
		            con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    	
	    
        	
        }
	        
        
  }
}