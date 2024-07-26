
package com.jacksonsexchangeagency.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacksonsexchangeagency.dao.ExchangeDAO;

@WebServlet("/confirmExchange")
public class ConfirmExchangeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ExchangeDAO exchangeDAO = new ExchangeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the confirmation JSP page (assuming it exists)
        request.getRequestDispatcher("/confirmExchange.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer itemId = (Integer) session.getAttribute("itemId");
        // Integer userId = (Integer) session.getAttribute("userId");

        // Debugging statements
        System.out.println("Retrieved from session - itemId: " + itemId);
        // System.out.println("Retrieved from session - userId: " + userId);

        if (itemId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID or User ID is missing or invalid.");
            return;
        }

        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request parameters.");
            return;
        }

        String status = "Rejected";
        if ("confirm".equalsIgnoreCase(action)) {
            status = "Confirmed";
        }

        // Update exchange status in the database
        exchangeDAO.updateExchangeStatus(itemId, status); // Adjust according to your database schema

        // Redirect to a confirmation page or list of exchanges
        response.sendRedirect(request.getContextPath() + "/expressInterestConfirmation.jsp");
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

// import com.jacksonsexchangeagency.dao.ExchangeDAO;

// @WebServlet("/confirmExchange")
// public class ConfirmExchangeServlet extends HttpServlet {

//     private static final long serialVersionUID = 1L;
//     private ExchangeDAO exchangeDAO = new ExchangeDAO();

//     @Override
//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         HttpSession session = request.getSession();
//         Integer itemId = (Integer) session.getAttribute("itemId");
//         Integer userId = (Integer) session.getAttribute("userId");

//         if (itemId == null || userId == null) {
//             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID or User ID is missing or invalid.");
//             return;
//         }

//         String action = request.getParameter("action");

//         if (action == null || action.isEmpty()) {
//             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request parameters.");
//             return;
//         }

//         String status = "Rejected";
//         if ("confirm".equalsIgnoreCase(action)) {
//             status = "Confirmed";
//         }

//         // Update exchange status in the database
//         exchangeDAO.updateExchangeStatus(itemId, status); // Adjust according to your database schema

//         // Redirect to a confirmation page or list of exchanges
//         response.sendRedirect(request.getContextPath() + "/viewExchanges");
//     }
// }
