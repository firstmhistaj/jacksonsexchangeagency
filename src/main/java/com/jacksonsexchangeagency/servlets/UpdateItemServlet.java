package com.jacksonsexchangeagency.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jacksonsexchangeagency.dao.ItemDAO;
import com.jacksonsexchangeagency.model.Item;

@WebServlet("/updateItemForm")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdateItemServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "uploadFiles";
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
        request.getRequestDispatcher("/updateItemForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String condition = request.getParameter("condition");
        String owner = request.getParameter("owner");

        if (idParam == null || idParam.isEmpty() || name == null || name.isEmpty() || category == null || category.isEmpty() ||
            condition == null || condition.isEmpty() || owner == null || owner.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields must be provided.");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID must be a number.");
            return;
        }

        // Handle file upload
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        String fileName = null;
        for (Part part : request.getParts()) {
            String submittedFileName = part.getSubmittedFileName();
            if (submittedFileName != null && !submittedFileName.isEmpty()) {
                fileName = new File(submittedFileName).getName();
                part.write(savePath + File.separator + fileName);
            }
        }

        String photoUrl = (fileName != null) ? SAVE_DIR + "/" + fileName : request.getParameter("existingPhotoUrl");

        // Create an Item object
        Item item = new Item(id, name, description, category, condition, owner, photoUrl);

        // Update the item in the database
        itemDAO.updateItem(item);

        // Redirect back to the list of items
        response.sendRedirect(request.getContextPath() + "/browseListings");
    }
}
