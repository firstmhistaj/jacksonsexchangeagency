// package com.jacksonsexchangeagency.servlets;

// import java.io.IOException;
// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import com.jacksonsexchangeagency.dao.ItemDAO;

// @WebServlet("/finalizeExchange")
// public class FinalizeExchangeServlet extends HttpServlet {
//     private static final long serialVersionUID = 1L;
//     private ItemDAO itemDAO = new ItemDAO();

//     @Override
//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         String itemIdParam = request.getParameter("itemId");
//         String userIdParam = request.getParameter("userId");

//         if (itemIdParam == null || itemIdParam.isEmpty() || userIdParam == null || userIdParam.isEmpty()) {
//             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID or User ID is missing or invalid.");
//             return;
//         }

//         int itemId, userId;
//         try {
//             itemId = Integer.parseInt(itemIdParam);
//             userId = Integer.parseInt(userIdParam);
//         } catch (NumberFormatException e) {
//             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID or User ID must be a number.");
//             return;
//         }

//         // Finalize the exchange process (e.g., update the status of the item)
//         itemDAO.finalizeExchange(itemId, userId);

//         // Redirect to a confirmation page
//         response.sendRedirect(request.getContextPath() + "/finalizeExchangeConfirmation");
//     }
// }
