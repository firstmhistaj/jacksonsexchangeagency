package com.jacksonsexchangeagency.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacksonsexchangeagency.dao.ItemDAO;

@WebServlet("/delete_item")
public class DeleteItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ItemDAO itemDAO = new ItemDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Delete the item from the database
        itemDAO.deleteItem(id);

        // Redirect back to the list items page
        response.sendRedirect(request.getContextPath() + "/browseListings");
    }
}
