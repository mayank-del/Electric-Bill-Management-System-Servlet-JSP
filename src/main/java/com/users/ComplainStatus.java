package com.users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class  ComplainStatus{
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";

    public void checkStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        		
        		ArrayList<ComplainShortDesc> compList = new ArrayList<>();
        		String custId=request.getParameter("custId");
        		ServletContext context=request.getServletContext();
    			if(custId==null || custId=="") {
    				custId=(String)context.getAttribute("userId");
    			}
            	String query="select cust_id,complain_id,complaint_type, problem_desc,status from complaints where cust_id=?";
            	
            	Class.forName(CLASS_NAME);
	            Connection con = DriverManager.getConnection(URL,USER,PASSWORD);
	            
	            PreparedStatement pst = con.prepareStatement(query);
	            pst.setString(1, custId);
	            ResultSet rs = pst.executeQuery();
	            
	            while(rs.next()) {
	            	ComplainShortDesc comp=new ComplainShortDesc(rs.getString("cust_id"),rs.getString("complain_id"),rs.getString("complaint_type"),rs.getString("problem_desc"),rs.getString("status"));
	            	compList.add(comp);
	            }
	            
	           
	            
	            request.setAttribute("compList", compList);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("complaintStatus.jsp");
		        dispatcher.forward(request, response);
        	}catch(Exception e) {
        		System.out.print(e);
        	}
    }
}
