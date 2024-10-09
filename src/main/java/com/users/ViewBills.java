package com.users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class ViewBills {
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";

    public void viewBills(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String custId = request.getParameter("custId");
        ServletContext context = request.getServletContext();
        if (custId == null || custId.equals("")) {
            custId = (String) context.getAttribute("userId");
        }

        ArrayList<Bill> billList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName(CLASS_NAME);
            con = DriverManager.getConnection(URL,USER,PASSWORD);

            String query = "SELECT cust_id, monthYear, amount, paidStatus FROM custbills WHERE cust_id = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, custId);
            rs = pst.executeQuery();

            while (rs.next()) {
                Bill bill = new Bill(rs.getString("cust_id"), rs.getString("monthYear"),
                        rs.getDouble("amount"), rs.getString("paidStatus"));
                billList.add(bill);
            }

            request.setAttribute("billList", billList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewBills.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
