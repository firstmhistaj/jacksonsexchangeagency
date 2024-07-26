package com.jacksonsexchangeagency.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacksonsexchangeagency.dao.ItemDAO;
import com.jacksonsexchangeagency.model.Item;

@WebServlet("/browseListings")
public class BrowseListingsServlet extends HttpServlet {

    private ItemDAO itemDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        itemDAO = new ItemDAO(); // Initialize your DAO (or use dependency injection)
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Item> items = itemDAO.getAllItems(); // Retrieve items from DAO

        request.setAttribute("items", items); // Set items as request attribute
        request.getRequestDispatcher("browseListings.jsp").forward(request, response); // Forward to JSP
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests if necessary
        doGet(request, response);
    }


}


