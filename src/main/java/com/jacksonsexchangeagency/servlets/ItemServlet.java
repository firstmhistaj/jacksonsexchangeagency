// package com.jacksonsexchangeagency.servlets;

// import java.io.IOException;

// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;

// import com.jacksonsexchangeagency.model.ItemClassifier;

// @WebServlet("/classifyItem")
// public class ItemServlet extends HttpServlet {
//     private ItemClassifier itemClassifier;

//     @Override
//     public void init() throws ServletException {
//         super.init();
//         try {
//             itemClassifier = new ItemClassifier();
//         } catch (Exception e) {
//             throw new ServletException("Failed to initialize ItemClassifier", e);
//         }
//     }

//     @Override
//     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//         req.getRequestDispatcher("/view/item/classifyItem.jsp").forward(req, resp);
//     }

//     @Override
//     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//         String name = req.getParameter("name");
//         String features = req.getParameter("features");
//         try {
//             String category = itemClassifier.classifyItem(name, features);
//             req.setAttribute("category", category);
//             req.getRequestDispatcher("/view/item/classifyResult.jsp").forward(req, resp);
//         } catch (Exception e) {
//             throw new ServletException("Failed to classify item", e);
//         }
//     }
// }
