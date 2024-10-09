package com.users;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutService {

    
    public void logoutUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		ServletContext context=request.getServletContext();
        	context.removeAttribute("userId");
        	response.sendRedirect("signin.jsp?success=logout");
    	}catch(Exception e) {
    		
    	}
    }

}
