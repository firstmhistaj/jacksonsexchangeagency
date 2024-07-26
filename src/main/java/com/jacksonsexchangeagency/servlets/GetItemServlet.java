package com.jacksonsexchangeagency.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacksonsexchangeagency.dao.ItemDAO;
import com.jacksonsexchangeagency.model.Item;

@WebServlet("/item_details")
public class GetItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ItemDAO itemDAO = new ItemDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Get the item from the database
        Item item = itemDAO.getItemById(id);

        // Set the item as a request attribute
        request.setAttribute("item", item);

        // Forward to the item details JSP page
        request.getRequestDispatcher("/itemDetails.jsp").forward(request, response);
    }
}
