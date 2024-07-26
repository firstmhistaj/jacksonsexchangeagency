package com.jacksonsexchangeagency.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacksonsexchangeagency.dao.UserDAO;
import com.jacksonsexchangeagency.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the registration form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        
        // Validate input (can be enhanced with more validation checks)
        if (username.isEmpty() || password.isEmpty() || fullname.isEmpty() || email.isEmpty()) {
            // Handle validation failure, e.g., show error message to user
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            // Assuming UserDAO is implemented to save the user to database
            User user = new User(username, password, fullname, email);
            boolean success = false;
            success = new UserDAO().registerUser(user);
            
            if (success) {
                // Redirect to login page after successful registration
                response.sendRedirect("login.jsp");
            } else {
                // Handle registration failure, e.g., show error message to user
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }
}
