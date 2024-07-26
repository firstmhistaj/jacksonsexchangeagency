package com.jacksonsexchangeagency.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/expressInterest")
public class ExpressInterestServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the express interest JSP page
        request.getRequestDispatcher("/express_interest.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String itemIdParam = request.getParameter("itemId");
        // String userIdParam = request.getParameter("userId");

        // Debugging statements
        System.out.println("itemIdParam: " + itemIdParam);
        // System.out.println("userIdParam: " + userIdParam);

        if (itemIdParam == null || itemIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID and User ID are required.");
            return;
        }

        int itemId;
        int userId;
        try {
            itemId = Integer.parseInt(itemIdParam);
            // userId = Integer.parseInt(userIdParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID and User ID must be numbers.");
            return;
        }

        // Store IDs in session
        session.setAttribute("itemId", itemId);
        // session.setAttribute("userId", userId);

        // Debugging statements
        System.out.println("Stored in session - itemId: " + session.getAttribute("itemId"));
        // System.out.println("Stored in session - userId: " + session.getAttribute("userId"));

        // Redirect to confirmation page
        response.sendRedirect(request.getContextPath() + "/confirmExchange");
    }
}







// package com.jacksonsexchangeagency.servlets;

// import java.io.IOException;

// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

// import com.jacksonsexchangeagency.dao.InterestDAO;

// @WebServlet("/expressInterest")
// public class ExpressInterestServlet extends HttpServlet {
//     private static final long serialVersionUID = 1L;
//     private InterestDAO interestDAO = new InterestDAO();

//     @Override
//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         HttpSession session = request.getSession();
//         String itemIdParam = request.getParameter("itemId");
//         String userIdParam = request.getParameter("userId");

//         if (itemIdParam == null || itemIdParam.isEmpty() || userIdParam == null || userIdParam.isEmpty()) {
//             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID and User ID are required.");
//             return;
//         }

//         int itemId;
//         int userId;
//         try {
//             itemId = Integer.parseInt(itemIdParam);
//             userId = Integer.parseInt(userIdParam);
//         } catch (NumberFormatException e) {
//             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID and User ID must be numbers.");
//             return;
//         }

//         // Store IDs in session
//         session.setAttribute("itemId", itemId);
//         session.setAttribute("userId", userId);

//         // Redirect to confirmation page or further processing
//         response.sendRedirect(request.getContextPath() + "/confirmExchange");
//     }
// }

