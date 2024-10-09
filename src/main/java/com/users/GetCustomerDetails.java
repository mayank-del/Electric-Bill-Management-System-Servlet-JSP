package com.users;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class GetCustomerDetails {
	private static final String URL = "jdbc:mysql://localhost:3306/elec"; // Replace 'mydatabase' with your database name
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root";
    private static final String CLASS_NAME="com.mysql.cj.jdbc.Driver";

    public void getCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int custId = Integer.parseInt(request.getParameter("custId"));
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName(CLASS_NAME);
            connection = DriverManager.getConnection(URL,USER, PASSWORD);

            String sql = "SELECT * FROM cust WHERE cust_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, custId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int cid = resultSet.getInt("cust_id");
                String title = resultSet.getString("title");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String code = resultSet.getString("code");
                String mobile = resultSet.getString("mobile");
                String password = resultSet.getString("password");

                request.setAttribute("custId", cid);
                request.setAttribute("title", title);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("code", code);
                request.setAttribute("mobile", mobile);
                request.setAttribute("password", password);

                RequestDispatcher dispatcher = request.getRequestDispatcher("updateProfile.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("Customer not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

