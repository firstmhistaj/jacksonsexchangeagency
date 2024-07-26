package com.jacksonsexchangeagency.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacksonsexchangeagency.dao.ItemDAO;
import com.jacksonsexchangeagency.model.Item;

@WebServlet("/expressInterestForm")
public class ExpressInterestFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ItemDAO itemDAO = new ItemDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID is missing or invalid.");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID must be a number.");
            return;
        }

        Item item = itemDAO.getItemById(id);
        if (item == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Item not found.");
            return;
        }

        request.setAttribute("item", item);
        request.getRequestDispatcher("/express_interest.jsp").forward(request, response);
    }
}
